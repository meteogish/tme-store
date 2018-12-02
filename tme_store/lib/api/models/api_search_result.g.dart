// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSearchResult _$ApiSearchResultFromJson(Map<String, dynamic> json) {
  return ApiSearchResult(
      totalProductsFound: json['Amount'] as int,
      page: json['PageNumber'] as int,
      products: (json['ProductList'] as List)
          ?.map((e) =>
              e == null ? null : ApiProduct.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      totalProductsPerCategory: (json['CategoryList'] as Map<String, dynamic>)
          ?.map((k, e) => MapEntry(k, e as int)));
}

Map<String, dynamic> _$ApiSearchResultToJson(ApiSearchResult instance) =>
    <String, dynamic>{
      'Amount': instance.totalProductsFound,
      'PageNumber': instance.page,
      'ProductList': instance.products,
      'CategoryList': instance.totalProductsPerCategory
    };
