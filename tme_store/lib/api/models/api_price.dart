import 'package:json_annotation/json_annotation.dart';

part 'api_price.g.dart';

@JsonSerializable()
class ApiPrice {
  @JsonKey(name: 'Amount')
  final int amount;

  @JsonKey(name: 'PriceValue')
  final double value;

  @JsonKey(name: 'Special')
  final bool isSpecial;

  ApiPrice({
    this.amount,
    this.value,
    this.isSpecial
  });

  static ApiPrice fromJson(Map<String, dynamic> json) => _$ApiPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ApiPriceToJson(this);
}