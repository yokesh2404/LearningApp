// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDetailsResponse _$PaymentDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentDetailsResponse(
      data: json['data'] == null
          ? null
          : PaymentDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentDetailsResponseToJson(
        PaymentDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) =>
    PaymentDetails(
      amount: (json['amount'] as num?)?.toInt(),
      courseName: json['course_name'] as String?,
      language: json['language'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      discount: (json['discount'] as num?)?.toInt(),
      country: json['country'] as String?,
    );

Map<String, dynamic> _$PaymentDetailsToJson(PaymentDetails instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'course_name': instance.courseName,
      'language': instance.language,
      'currency_symbol': instance.currencySymbol,
      'discount': instance.discount,
      'country': instance.country,
    };
