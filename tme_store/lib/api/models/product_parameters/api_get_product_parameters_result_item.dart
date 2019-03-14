import 'package:json_annotation/json_annotation.dart';
import 'package:tme_store/api/models/product_parameters/api_product_parameter.dart';

part 'api_get_product_parameters_result_item.g.dart';

@JsonSerializable()
class ApiGetProductParametersResultItem {
  @JsonKey(name: 'Symbol')
  final String symbol;

  @JsonKey(name: 'ParameterList')
  final List<ApiProductParameter> parameters;

  ApiGetProductParametersResultItem(
      {this.symbol, this.parameters});

  static ApiGetProductParametersResultItem fromJson(
          Map<String, dynamic> json) =>
      _$ApiGetProductParametersResultItemFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ApiGetProductParametersResultItemToJson(this);
}
