import 'package:json_annotation/json_annotation.dart';
import 'package:tme_store/api/models/api_poduct.dart';

part 'api_search_result.g.dart';

@JsonSerializable()
class ApiSearchResult {
  @JsonKey(name: 'Amount')
  final int totalProductsFound;

  @JsonKey(name: 'PageNumber')
  final int page;

  @JsonKey(name: 'ProductList')
  final List<ApiProduct> products;

  @JsonKey(name: 'CategoryList')
  final Map<String, int> totalProductsPerCategory;

  ApiSearchResult({
    this.totalProductsFound,
    this.page,
    this.products,
    this.totalProductsPerCategory
  });

  static ApiSearchResult fromJson(Map<String, dynamic> json) =>
      _$ApiSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSearchResultToJson(this);
}