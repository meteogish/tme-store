// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_get_product_files_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGetProductFilesResult _$ApiGetProductFilesResultFromJson(
    Map<String, dynamic> json) {
  return ApiGetProductFilesResult(
      products: (json['ProductList'] as List)
          ?.map((e) => e == null
              ? null
              : ApiGetProductFilesResultItem.fromJson(
                  e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApiGetProductFilesResultToJson(
        ApiGetProductFilesResult instance) =>
    <String, dynamic>{'ProductList': instance.products};
