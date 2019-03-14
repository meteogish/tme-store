// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_get_product_parameters_result_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGetProductParametersResultItem _$ApiGetProductParametersResultItemFromJson(
    Map<String, dynamic> json) {
  return ApiGetProductParametersResultItem(
      symbol: json['Symbol'] as String,
      language: json['Language'] as String,
      parameters: (json['ParameterList'] as List)
          ?.map((e) => e == null
              ? null
              : ApiProductParameter.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApiGetProductParametersResultItemToJson(
        ApiGetProductParametersResultItem instance) =>
    <String, dynamic>{
      'Symbol': instance.symbol,
      'Language': instance.language,
      'ParameterList': instance.parameters
    };
