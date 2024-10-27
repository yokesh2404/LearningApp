// To parse this JSON data, do
//
//     final paymentDetailsResponse = paymentDetailsResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'payment_details_response.g.dart';

PaymentDetailsResponse paymentDetailsResponseFromJson(String str) =>
    PaymentDetailsResponse.fromJson(json.decode(str));

String paymentDetailsResponseToJson(PaymentDetailsResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PaymentDetailsResponse {
  @JsonKey(name: "data")
  final PaymentDetails? data;

  PaymentDetailsResponse({
    this.data,
  });

  PaymentDetailsResponse copyWith({
    PaymentDetails? data,
  }) =>
      PaymentDetailsResponse(
        data: data ?? this.data,
      );

  factory PaymentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailsResponseToJson(this);
}

@JsonSerializable()
class PaymentDetails {
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "course_name")
  final String? courseName;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "currency_symbol")
  final String? currencySymbol;
  @JsonKey(name: "discount")
  final int? discount;
  @JsonKey(name: "country")
  final String? country;

  PaymentDetails({
    this.amount,
    this.courseName,
    this.language,
    this.currencySymbol,
    this.discount,
    this.country,
  });

  PaymentDetails copyWith({
    int? amount,
    String? courseName,
    String? language,
    String? currencySymbol,
    int? discount,
    String? country,
  }) =>
      PaymentDetails(
        amount: amount ?? this.amount,
        courseName: courseName ?? this.courseName,
        language: language ?? this.language,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        discount: discount ?? this.discount,
        country: country ?? this.country,
      );

  factory PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailsToJson(this);
}
