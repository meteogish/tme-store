import 'package:json_annotation/json_annotation.dart';

part 'api_poduct.g.dart';

@JsonSerializable()
class ApiProduct {
  @JsonKey(name: 'Symbol')
  final String symbol;

  @JsonKey(name: 'OriginalSymbol')
  final String originalSymbol;

  @JsonKey(name: 'Producer')
  final String producer;

  @JsonKey(name: 'Description')
  final String description;

  @JsonKey(name: 'OfferId')
  final int offerId;

  @JsonKey(name: 'CategoryId')
  final String categoryId;

  @JsonKey(name: 'Category')
  final String category;

  @JsonKey(name: 'Photo')
  final String photoUrl;

  @JsonKey(name: 'Thumbnail')
  final String thumbnailUrl;

  @JsonKey(name: 'Weight')
  final double weight;

  @JsonKey(name: 'SuppliedAmount')
  final int suppliedAmount;

  @JsonKey(name: 'MinAmount')
  final int minAmount;

  @JsonKey(name: 'Multiples')
  final int multiples;

  @JsonKey(name: 'Unit')
  final String unit;

  @JsonKey(name: 'ProductInformationPage')
  final String productInformationPage;

  @JsonKey(name: 'Guarantee')
  final ApiGuarantee guarantee;

  @JsonKey(name: 'ProductStatusList')
  final List<String> productStatusList;

  ApiProduct(
      {this.symbol,
      this.originalSymbol,
      this.producer,
      this.description,
      this.offerId,
      this.categoryId,
      this.category,
      this.photoUrl,
      this.thumbnailUrl,
      this.weight,
      this.suppliedAmount,
      this.minAmount,
      this.multiples,
      this.unit,
      this.productInformationPage,
      this.guarantee,
      this.productStatusList});

  static ApiProduct fromJson(Map<String, dynamic> json) =>
      _$ApiProductFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductToJson(this);
}

@JsonSerializable()
class ApiGuarantee {
  @JsonKey(name: 'Type')
  final String type;

  @JsonKey(name: 'Period')
  final int period;

  ApiGuarantee({this.type, this.period});

  static ApiGuarantee fromJson(Map<String, dynamic> json) =>
      _$ApiGuaranteeFromJson(json);

  Map<String, dynamic> toJson() => _$ApiGuaranteeToJson(this);
}
