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
      this.price
      });
}