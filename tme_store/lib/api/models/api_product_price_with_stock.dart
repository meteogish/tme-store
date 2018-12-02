import 'package:json_annotation/json_annotation.dart';
import 'package:tme_store/api/models/api_price.dart';

part 'api_product_price_with_stock.g.dart';

@JsonSerializable()
class ApiProductPriceWithStock {
  @JsonKey(name: 'Symbol')
  String symbol;

  @JsonKey(name: 'Unit')
  String unit;

  @JsonKey(name: 'VatRate')
  int vatRate;

  @JsonKey(name: 'VatType')
  String vatType;

  @JsonKey(name: 'Amount')
  int amount;

  @JsonKey(name: 'PriceList')
  List<ApiPrice> prices;

  ApiProductPriceWithStock(
      {this.symbol, this.unit, this.amount, this.vatRate, this.vatType, this.prices});

  static ApiProductPriceWithStock fromJson(Map<String, dynamic> json) =>
      _$ApiProductPriceWithStockFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductPriceWithStockToJson(this);
}