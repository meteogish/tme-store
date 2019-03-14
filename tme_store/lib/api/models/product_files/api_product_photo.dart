import 'package:json_annotation/json_annotation.dart';

part 'api_product_photo.g.dart';

@JsonSerializable()
class ApiProductPhoto {

  @JsonKey(name: 'Photo')
  final String photoUrl;

  @JsonKey(name: 'Thumbnail')
  final String thumbnailUrl;

  @JsonKey(name: 'HighResolutionPhoto')
  final String highResolutionPhotoUrl;

  ApiProductPhoto({
    this.photoUrl,
    this.thumbnailUrl,
    this.highResolutionPhotoUrl
  });

  static ApiProductPhoto fromJson(Map<String, dynamic> json) =>
     _$ApiProductPhotoFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductPhotoToJson(this);
}