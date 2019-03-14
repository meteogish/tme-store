// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_get_product_files_result_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGetProductFilesResultItem _$ApiGetProductFilesResultItemFromJson(
    Map<String, dynamic> json) {
  return ApiGetProductFilesResultItem(
      symbol: json['Symbol'] as String,
      file: json['Files'] == null
          ? null
          : ApiProductFile.fromJson(json['Files'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ApiGetProductFilesResultItemToJson(
        ApiGetProductFilesResultItem instance) =>
    <String, dynamic>{'Symbol': instance.symbol, 'Files': instance.file};
