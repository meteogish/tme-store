import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:tme_store/api/models/product_files/api_product_document.dart';
import 'package:tme_store/api/models/product_files/api_product_parameters_image.dart';
import 'package:tme_store/api/models/product_files/api_product_photo.dart';

part 'api_product_file.g.dart';

@JsonSerializable()
class ApiProductFile {
  
  @JsonKey(name: 'PhotoList')
  final List<String> photoUrls;

  @JsonKey(name: 'ThumbnailList')  
  final List<String> thumbnailUrls;

  @JsonKey(name: 'HighResolutionPhotoList')   
  final List<String> highResolutionPhotoUrls;

  @JsonKey(name: 'PresentationList')
  final List<List<String>> presentations;

  @JsonKey(name: 'DocumentList')
  final List<ApiProductDocument> documents;
  
  @JsonKey(name: 'AdditionalPhotoList')
  final List<ApiProductPhoto> additionalPhotos;
  

  @JsonKey(name: 'ParametersImages')
  final List<ApiProductParametersImage> parametersImages;

  ApiProductFile({
    this.photoUrls,
    this.thumbnailUrls,
    this.highResolutionPhotoUrls,
    this.presentations,
    this.documents,
    this.additionalPhotos,
    this.parametersImages
  });

  static ApiProductFile fromJson(Map<String, dynamic> json) =>
     _$ApiProductFileFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductFileToJson(this);
}