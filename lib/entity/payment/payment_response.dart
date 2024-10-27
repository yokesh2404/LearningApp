// To parse this JSON data, do
//
//     final paymentResponse = paymentResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'payment_response.g.dart';

PaymentResponse paymentResponseFromJson(String str) =>
    PaymentResponse.fromJson(json.decode(str));

String paymentResponseToJson(PaymentResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class PaymentResponse {
  @JsonKey(name: "data")
  final PaymentData? data;

  PaymentResponse({
    this.data,
  });

  PaymentResponse copyWith({
    PaymentData? data,
  }) =>
      PaymentResponse(
        data: data ?? this.data,
      );

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
}

@JsonSerializable()
class PaymentData {
  @JsonKey(name: "payment_id")
  final String? paymentId;
  @JsonKey(name: "expire_at")
  final String? expireAt;
  @JsonKey(name: "course")
  final String? course;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "user_id")
  final String? userId;

  PaymentData({
    this.paymentId,
    this.expireAt,
    this.course,
    this.amount,
    this.userId,
  });

  PaymentData copyWith({
    String? paymentId,
    String? expireAt,
    String? course,
    int? amount,
    String? userId,
  }) =>
      PaymentData(
        paymentId: paymentId ?? this.paymentId,
        expireAt: expireAt ?? this.expireAt,
        course: course ?? this.course,
        amount: amount ?? this.amount,
        userId: userId ?? this.userId,
      );

  factory PaymentData.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDataToJson(this);
}
