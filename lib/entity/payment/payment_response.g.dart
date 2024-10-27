// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      data: json['data'] == null
          ? null
          : PaymentData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) => PaymentData(
      paymentId: json['payment_id'] as String?,
      expireAt: json['expire_at'] as String?,
      course: json['course'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$PaymentDataToJson(PaymentData instance) =>
    <String, dynamic>{
      'payment_id': instance.paymentId,
      'expire_at': instance.expireAt,
      'course': instance.course,
      'amount': instance.amount,
      'user_id': instance.userId,
    };
