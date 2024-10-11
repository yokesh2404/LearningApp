// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      name: json['name'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      profile: json['profile'] as String?,
      about: json['about'] as String?,
      userId: json['userId'] as String?,
      phone: json['phone'] as String?,
      dob: json['dob'] as String?,
      classType: json['classType'] as String?,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'status': instance.status,
      'profile': instance.profile,
      'about': instance.about,
      'userId': instance.userId,
      'phone': instance.phone,
      'dob': instance.dob,
      'classType': instance.classType,
    };
