// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_product_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiProductPhoto _$ApiProductPhotoFromJson(Map<String, dynamic> json) {
  return ApiProductPhoto(
      photoUrl: json['Photo'] as String,
      thumbnailUrl: json['Thumbnail'] as String,
      highResolutionPhotoUrl: json['HighResolutionPhoto'] as String);
}

Map<String, dynamic> _$ApiProductPhotoToJson(ApiProductPhoto instance) =>
    <String, dynamic>{
      'Photo': instance.photoUrl,
      'Thumbnail': instance.thumbnailUrl,
      'HighResolutionPhoto': instance.highResolutionPhotoUrl
    };
