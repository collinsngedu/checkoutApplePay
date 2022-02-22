// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenResModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResModel _$TokenResModelFromJson(Map<String, dynamic> json) =>
    TokenResModel(
      type: json['type'] as String?,
      token: json['token'] as String?,
      expiresOn: json['expiresOn'] as String?,
      expiryMonth: json['expiryMonth'] as int?,
      expiryYear: json['expiryYear'] as int?,
      scheme: json['scheme'] as String?,
      last4: json['last4'] as String?,
      bin: json['bin'] as String?,
      cardType: json['cardType'] as String?,
      cardCategory: json['cardCategory'] as String?,
      issuer: json['issuer'] as String?,
      issuerCountry: json['issuerCountry'] as String?,
      productId: json['productId'] as String?,
      productType: json['productType'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TokenResModelToJson(TokenResModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'token': instance.token,
      'expiresOn': instance.expiresOn,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
      'scheme': instance.scheme,
      'last4': instance.last4,
      'bin': instance.bin,
      'cardType': instance.cardType,
      'cardCategory': instance.cardCategory,
      'issuer': instance.issuer,
      'issuerCountry': instance.issuerCountry,
      'productId': instance.productId,
      'productType': instance.productType,
      'name': instance.name,
    };
