import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kurups_app/injector/injector.dart';
import 'package:kurups_app/screens/chapters/bloc/chapters_bloc.dart';
import 'package:kurups_app/screens/chapters/subchapter.dart';
import 'package:kurups_app/utils/constants/app_string.dart';
import 'package:kurups_app/utils/constants/colors.dart';
import 'package:kurups_app/widgets/appbar_widget.dart';

class BasicPage extends StatelessWidget {
  final String chapterId;
  const BasicPage({super.key, required this.chapterId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.instance<ChaptersBloc>()
        ..add(GetChaptersBasedId(id: chapterId)),
      child: BlocConsumer<ChaptersBloc, ChaptersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppbarWithTotalfare(
              onBackAction: () {
                context.pop();
                Injector.instance<ChaptersBloc>().close();
              },
              appbarTitle: AppString.chapters,
            ),
            body: _buildBody(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<ChaptersBloc, ChaptersState>(
      builder: (context, state) {
        return state.status.when(initial: () {
          return const SizedBox(
            child: Text("data"),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }, loadFailed: () {
          return const Center(
            child: SizedBox(
              child: Text("No data"),
            ),
          );
        }, loadSuccess: () {
          return ListView.builder(
            itemCount: state.chapters.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to the SubPage for the clicked chapter
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, Colors.greenAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      "${state.chapters[index].name ?? ""}: ${state.chapters[index].description!}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    leading:
                        const Icon(Icons.diamond_rounded, color: Colors.white),
                    trailing:
                        const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}
