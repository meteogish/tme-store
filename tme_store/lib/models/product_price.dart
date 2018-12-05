import 'dart:math';

import 'package:tme_store/models/price_orffer.dart';


class ProductPrice {
  final int vatRate;
  final String vatType;
  double _minPrice;
  double get minPrice => _minPrice;
  final List<PriceOffer> priceOffers;

  ProductPrice({
    this.vatRate,
    this.vatType,
    this.priceOffers
  }){
    _minPrice = priceOffers.map((po) => po.price).reduce(min);
  }
}