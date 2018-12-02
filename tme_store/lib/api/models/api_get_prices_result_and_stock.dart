import 'package:tme_store/api/models/api_product_price_with_stock.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_get_prices_result_and_stock.g.dart';

@JsonSerializable()
class ApiGetPricesAndStockResult {
  @JsonKey(name: 'Language')
  final String language;

  @JsonKey(name: 'Currency')
  final String currency;

  @JsonKey(name: 'PriceType')
  final String priceType;

  @JsonKey(name: 'ProductList')
  final List<ApiProductPriceWithStock> products;

  ApiGetPricesAndStockResult({
    this.language,
    this.currency,
    this.priceType,
    this.products
    });
  
  static ApiGetPricesAndStockResult fromJson(Map<String, dynamic> json) =>
      _$ApiGetPricesAndStockResultFromJson(json);

  Map<String, dynamic> toJson() => _$ApiGetPricesAndStockResultToJson(this);
}
