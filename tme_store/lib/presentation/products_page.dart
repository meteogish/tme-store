import 'package:flutter/material.dart';
import 'package:tme_store/api/models/api_category.dart';
import 'package:tme_store/models/search_filter.dart';
import 'package:tme_store/presentation/products/products_list.dart';

class ProductsPage extends StatelessWidget {
  final ApiCategory _category;

  ProductsPage(this._category);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Text('Produkty: ${_category.name}'),
    ),
        body: ProductsList(SearchFilter(null, "PLN", categoryId: _category.id)));
  }
  
}