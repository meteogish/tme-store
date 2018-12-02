// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_get_prices_result_and_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGetPricesAndStockResult _$ApiGetPricesAndStockResultFromJson(
    Map<String, dynamic> json) {
  return ApiGetPricesAndStockResult(
      language: json['Language'] as String,
      currency: json['Currency'] as String,
      priceType: json['PriceType'] as String,
      products: (json['ProductList'] as List)
          ?.map((e) => e == null
              ? null
              : ApiProductPriceWithStock.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApiGetPricesAndStockResultToJson(
        ApiGetPricesAndStockResult instance) =>
    <String, dynamic>{
      'Language': instance.language,
      'Currency': instance.currency,
      'PriceType': instance.priceType,
      'ProductList': instance.products
    };
