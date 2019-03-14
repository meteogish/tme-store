import 'package:json_annotation/json_annotation.dart';
import 'package:tme_store/api/models/product_files/api_get_product_files_result_item.dart';

part 'api_get_product_files_result.g.dart';

@JsonSerializable()
class ApiGetProductFilesResult {

  @JsonKey(name: 'ProductList')
  final List<ApiGetProductFilesResultItem> products;

  ApiGetProductFilesResult({
    this.products
  });

  static ApiGetProductFilesResult fromJson(Map<String, dynamic> json) =>
     _$ApiGetProductFilesResultFromJson(json);

  Map<String, dynamic> toJson() => _$ApiGetProductFilesResultToJson(this);
}