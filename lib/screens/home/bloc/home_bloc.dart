import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kurups_app/data/auth_repo/auth_repo.dart';
import 'package:kurups_app/data/database_repo/database_repo.dart';
import 'package:kurups_app/entity/home/course_details.dart';
import 'package:kurups_app/entity/request/user_details/user_details.dart';
import 'package:kurups_app/service/firebase_services/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:kurups_app/service/firebase_services/firebase_database/firebase_database_service.dart';
import 'package:kurups_app/service/log_services/log_service.dart';
import 'package:kurups_app/utils/bloc_core/ui_status.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  late final AuthRepo _authServices;
  late final DatabaseRepo _databaseService;
  late final LogService _logService;
  HomeBloc(
      {required AuthRepo authServices,
      required DatabaseRepo databaseService,
      required LogService logService})
      : super(const HomeBlocState()) {
    _authServices = authServices;
    _databaseService = databaseService;
    _logService = logService;
    on<HomeBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetHomeData>(
      (event, emit) {
        return getUserDetails(event, emit);
      },
    );
    on<GetHomeCourses>((event, emit) => getCourses(event, emit));
  }

  void getUserDetails(GetHomeData event, Emitter emit) async {
    emit(state.copyWith(status: const UIStatus.loading()));
    UserDetails _details = await _databaseService.getUserDataById();
    if (_details.name != null) {
      emit(state.copyWith(
          status: const UIStatus.loadSuccess(), userDetails: _details));
    } else {
      emit(state.copyWith(
          status: const UIStatus.loadFailed(), userDetails: _details));
    }
  }

  void getCourses(GetHomeCourses event, Emitter emit) async {
    emit(state.copyWith(status: const UIStatus.loading()));
    List<BasicConcept> _data = await _databaseService.getCourseList();

    if (_data.isNotEmpty) {
      emit(state.copyWith(
          status: const UIStatus.loadSuccess(), courseList: _data));
    } else {
      emit(state.copyWith(
          status: const UIStatus.loadFailed(), courseList: _data));
    }
  }
}
