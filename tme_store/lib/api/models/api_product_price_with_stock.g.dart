// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_product_price_with_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiProductPriceWithStock _$ApiProductPriceWithStockFromJson(
    Map<String, dynamic> json) {
  return ApiProductPriceWithStock(
      symbol: json['Symbol'] as String,
      unit: json['Unit'] as String,
      amount: json['Amount'] as int,
      vatRate: json['VatRate'] as int,
      vatType: json['VatType'] as String,
      prices: (json['PriceList'] as List)
          ?.map((e) =>
              e == null ? null : ApiPrice.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApiProductPriceWithStockToJson(
        ApiProductPriceWithStock instance) =>
    <String, dynamic>{
      'Symbol': instance.symbol,
      'Unit': instance.unit,
      'VatRate': instance.vatRate,
      'VatType': instance.vatType,
      'Amount': instance.amount,
      'PriceList': instance.prices
    };
