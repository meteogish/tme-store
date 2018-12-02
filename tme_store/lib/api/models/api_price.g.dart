// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPrice _$ApiPriceFromJson(Map<String, dynamic> json) {
  return ApiPrice(
      amount: json['Amount'] as int,
      value: (json['PriceValue'] as num)?.toDouble(),
      isSpecial: json['Special'] as bool);
}

Map<String, dynamic> _$ApiPriceToJson(ApiPrice instance) => <String, dynamic>{
      'Amount': instance.amount,
      'PriceValue': instance.value,
      'Special': instance.isSpecial
    };
