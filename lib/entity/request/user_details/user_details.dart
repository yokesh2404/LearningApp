// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_details.g.dart';

@immutable
@JsonSerializable()
class UserDetails {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "profile")
  final String? profile;
  @JsonKey(name: "about")
  final String? about;
  @JsonKey(name: "userId")
  final String? userId;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "dob")
  final String? dob;
  @JsonKey(name: "classType")
  final String? classType;

  UserDetails({
    this.name,
    this.email,
    this.status,
    this.profile,
    this.about,
    this.userId,
    this.phone,
    this.dob,
    this.classType,
  });

  UserDetails copyWith({
    String? name,
    String? email,
    String? status,
    String? profile,
    String? about,
    String? userId,
    String? phone,
    String? dob,
    String? classType,
  }) =>
      UserDetails(
        name: name ?? this.name,
        email: email ?? this.email,
        status: status ?? this.status,
        profile: profile ?? this.profile,
        about: about ?? this.about,
        userId: userId ?? this.userId,
        phone: phone ?? this.phone,
        dob: dob ?? this.dob,
        classType: classType ?? this.classType,
      );

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
