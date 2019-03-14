// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_product_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiProductDocument _$ApiProductDocumentFromJson(Map<String, dynamic> json) {
  return ApiProductDocument(
      url: json['DocumentUrl'] as String,
      type: _$enumDecodeNullable(_$DocumentTypeEnumMap, json['DocumentType']),
      fileSizeBytes: json['Filesize'] as String,
      language: json['Language'] as String);
}

Map<String, dynamic> _$ApiProductDocumentToJson(ApiProductDocument instance) =>
    <String, dynamic>{
      'DocumentUrl': instance.url,
      'DocumentType': _$DocumentTypeEnumMap[instance.type],
      'Filesize': instance.fileSizeBytes,
      'Language': instance.language
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$DocumentTypeEnumMap = <DocumentType, dynamic>{
  DocumentType.INS: 'INS',
  DocumentType.DTE: 'DTE',
  DocumentType.KCH: 'KCH',
  DocumentType.GWA: 'GWA',
  DocumentType.INB: 'INB',
  DocumentType.MOV: 'MOV',
  DocumentType.YTB: 'YTB',
  DocumentType.PRE: 'PRE',
  DocumentType.SFT: 'SFT'
};
