// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_poduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiProduct _$ApiProductFromJson(Map<String, dynamic> json) {
  return ApiProduct(
      symbol: json['Symbol'] as String,
      originalSymbol: json['OriginalSymbol'] as String,
      producer: json['Producer'] as String,
      description: json['Description'] as String,
      offerId: json['OfferId'] as int,
      categoryId: json['CategoryId'] as String,
      category: json['Category'] as String,
      photoUrl: json['Photo'] as String,
      thumbnailUrl: json['Thumbnail'] as String,
      weight: (json['Weight'] as num)?.toDouble(),
      suppliedAmount: json['SuppliedAmount'] as int,
      minAmount: json['MinAmount'] as int,
      multiples: json['Multiples'] as int,
      unit: json['Unit'] as String,
      productInformationPage: json['ProductInformationPage'] as String,
      guarantee: json['Guarantee'] == null
          ? null
          : ApiGuarantee.fromJson(json['Guarantee'] as Map<String, dynamic>),
      productStatusList: (json['ProductStatusList'] as List)
          ?.map((e) => e as String)
          ?.toList());
}

Map<String, dynamic> _$ApiProductToJson(ApiProduct instance) =>
    <String, dynamic>{
      'Symbol': instance.symbol,
      'OriginalSymbol': instance.originalSymbol,
      'Producer': instance.producer,
      'Description': instance.description,
      'OfferId': instance.offerId,
      'CategoryId': instance.categoryId,
      'Category': instance.category,
      'Photo': instance.photoUrl,
      'Thumbnail': instance.thumbnailUrl,
      'Weight': instance.weight,
      'SuppliedAmount': instance.suppliedAmount,
      'MinAmount': instance.minAmount,
      'Multiples': instance.multiples,
      'Unit': instance.unit,
      'ProductInformationPage': instance.productInformationPage,
      'Guarantee': instance.guarantee,
      'ProductStatusList': instance.productStatusList
    };

ApiGuarantee _$ApiGuaranteeFromJson(Map<String, dynamic> json) {
  return ApiGuarantee(
      type: json['Type'] as String, period: json['Period'] as int);
}

Map<String, dynamic> _$ApiGuaranteeToJson(ApiGuarantee instance) =>
    <String, dynamic>{'Type': instance.type, 'Period': instance.period};
