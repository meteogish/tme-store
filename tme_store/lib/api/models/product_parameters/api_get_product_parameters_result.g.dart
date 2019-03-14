// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_get_product_parameters_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGetProductParametersResult _$ApiGetProductParametersResultFromJson(
    Map<String, dynamic> json) {
  return ApiGetProductParametersResult((json['ProductList'] as List)
      ?.map((e) => e == null
          ? null
          : ApiGetProductParametersResultItem.fromJson(
              e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ApiGetProductParametersResultToJson(
        ApiGetProductParametersResult instance) =>
    <String, dynamic>{'ProductList': instance.products};
