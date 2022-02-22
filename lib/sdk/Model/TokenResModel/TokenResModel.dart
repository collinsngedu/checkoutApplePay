import 'package:json_annotation/json_annotation.dart';

part 'TokenResModel.g.dart';

@JsonSerializable()
class TokenResModel {
  final String? type;
  final String? token;
  final String? expiresOn;
  final int? expiryMonth;
  final int? expiryYear;
  final String? scheme;
  final String? last4;
  final String? bin;
  final String? cardType;
  final String? cardCategory;
  final String? issuer;
  final String? issuerCountry;
  final String? productId;
  final String? productType;
  // final BillingModel? billingAddress;
  // final PhoneModel? phone;
  final String? name;

  TokenResModel({
    this.type,
    this.token,
    this.expiresOn,
    this.expiryMonth,
    this.expiryYear,
    this.scheme,
    this.last4,
    this.bin,
    this.cardType,
    this.cardCategory,
    this.issuer,
    this.issuerCountry,
    this.productId,
    this.productType,
    // this.billingAddress,
    // this.phone,
    this.name,
  });

  factory TokenResModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResModelToJson(this);
}
