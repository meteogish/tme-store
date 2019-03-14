import 'package:json_annotation/json_annotation.dart';

part 'api_product_parameters_image.g.dart';

@JsonSerializable()
class ApiProductParametersImage {
  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'Url')
  final String url;

  ApiProductParametersImage({
    this.name,
    this.url
  });

  static ApiProductParametersImage fromJson(Map<String, dynamic> json) =>
     _$ApiProductParametersImageFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductParametersImageToJson(this);
}