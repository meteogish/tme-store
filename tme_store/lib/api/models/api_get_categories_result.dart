import 'package:tme_store/api/models/api_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_get_categories_result.g.dart';

@JsonSerializable()
class ApiGetCategoriesResult {
  @JsonKey(name: 'CategoryTree')
  final ApiCategory rootCategory;

  ApiGetCategoriesResult({this.rootCategory});

  static ApiGetCategoriesResult fromJson(Map<String, dynamic> json) =>
      _$ApiGetCategoriesResultFromJson(json);

  Map<String, dynamic> toJson() => _$ApiGetCategoriesResultToJson(this);
}