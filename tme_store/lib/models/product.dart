import 'package:tme_store/api/models/api_poduct.dart';
import 'package:tme_store/api/models/api_product_price_with_stock.dart';
import 'package:tme_store/models/price_orffer.dart';
import 'package:tme_store/models/product_price.dart';

class Product {
  final String symbol;

  final String producer;

  final String description;

  final String category;

  final String photoUrl;

  final String thumbnailUrl;

  final double weight;

  final int amount;

  final String unit;

  final ProductPrice price;

  Product(
      {this.symbol,
      this.producer,
      this.description,
      this.category,
      this.photoUrl,
      this.thumbnailUrl,
      this.weight,
      this.amount,
      this.unit,
      this.price});

  static Product fromApiModels(
      ApiProduct apiProduct, ApiProductPriceWithStock productPrice) {
    return Product(
        symbol: apiProduct.symbol,
        category: apiProduct.category,
        description: apiProduct.description,
        producer: apiProduct.producer,
        weight: apiProduct.weight,
        unit: apiProduct.unit,
        photoUrl: apiProduct.photoUrl,
        thumbnailUrl: apiProduct.thumbnailUrl,
        amount: productPrice.amount,
        price: ProductPrice(
            vatRate: productPrice.vatRate,
            vatType: productPrice.vatType,
            priceOffers: productPrice.prices
                .map((apiPrice) => PriceOffer(
                    ammountInOffer: apiPrice.amount,
                    isSpecialPrice: apiPrice.isSpecial,
                    price: apiPrice.value))
                .toList()));
  }
}
