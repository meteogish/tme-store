import 'package:json_annotation/json_annotation.dart';

part 'api_category.g.dart';

@JsonSerializable()
class ApiCategory {
  @JsonKey(name: 'Id')
  final String id;

  @JsonKey(name: 'ParentId')
  final String parentId;

  @JsonKey(name: 'Depth')
  final int depth;

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'TotalProducts')
  final int totalProducts;

  @JsonKey(name: 'Thumbnail')
  final String thumbnaillUrl;

  @JsonKey(name: 'SubTreeCount')
  final int subTreeCount;

  @JsonKey(name: 'SubTree')
  final List<ApiCategory> subTree;

  ApiCategory(
      {this.id,
      this.parentId,
      this.depth,
      this.name,
      this.totalProducts,
      this.thumbnaillUrl,
      this.subTreeCount,
      this.subTree});

  static ApiCategory fromJson(Map<String, dynamic> json) =>
      _$ApiCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ApiCategoryToJson(this);
}
