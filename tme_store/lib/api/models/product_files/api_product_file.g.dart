// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_product_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiProductFile _$ApiProductFileFromJson(Map<String, dynamic> json) {
  return ApiProductFile(
      photoUrls: (json['PhotoList'] as List)?.map((e) => e as String)?.toList(),
      thumbnailUrls:
          (json['ThumbnailList'] as List)?.map((e) => e as String)?.toList(),
      highResolutionPhotoUrls: (json['HighResolutionPhotoList'] as List)
          ?.map((e) => e as String)
          ?.toList(),
      presentations: (json['PresentationList'] as List)
          ?.map((e) => (e as List)?.map((e) => e as String)?.toList())
          ?.toList(),
      documents: (json['DocumentList'] as List)
          ?.map((e) => e == null
              ? null
              : ApiProductDocument.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      additionalPhotos: (json['AdditionalPhotoList'] as List)
          ?.map((e) => e == null
              ? null
              : ApiProductPhoto.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      parametersImages: (json['ParametersImages'] as List)
          ?.map((e) => e == null
              ? null
              : ApiProductParametersImage.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApiProductFileToJson(ApiProductFile instance) =>
    <String, dynamic>{
      'PhotoList': instance.photoUrls,
      'ThumbnailList': instance.thumbnailUrls,
      'HighResolutionPhotoList': instance.highResolutionPhotoUrls,
      'PresentationList': instance.presentations,
      'DocumentList': instance.documents,
      'AdditionalPhotoList': instance.additionalPhotos,
      'ParametersImages': instance.parametersImages
    };
