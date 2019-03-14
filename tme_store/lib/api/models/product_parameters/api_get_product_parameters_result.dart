import 'package:json_annotation/json_annotation.dart';
import 'package:tme_store/api/models/product_parameters/api_get_product_parameters_result_item.dart';

part 'api_get_product_parameters_result.g.dart';

@JsonSerializable()
class ApiGetProductParametersResult {
  @JsonKey(name: 'ProductList')
  final List<ApiGetProductParametersResultItem> products;

  @JsonKey(name: 'Language')
  final String language;

  ApiGetProductParametersResult(this.products, this.language);

  static ApiGetProductParametersResult fromJson(Map<String, dynamic> json) =>
      _$ApiGetProductParametersResultFromJson(json);

  Map<String, dynamic> toJson() => _$ApiGetProductParametersResultToJson(this);
}