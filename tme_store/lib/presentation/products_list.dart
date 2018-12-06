import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tme_store/components/products_provider.dart';
import 'package:tme_store/models/models.dart';
import 'package:tme_store/presentation/product_item.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

class ProductsList extends StatelessWidget {
  ProductsProvider _productsProvider;
  SearchProductsResult _firstResult;
  String _searchText;

  ProductsList(this._searchText, this._productsProvider);

  Future getFirstResult() async {
    _firstResult = await _productsProvider.search(_searchText, 1);
  }

  Widget buildList() {
    if (_firstResult.totalCount == 0) {
      return Center(child: Text("Podana fraza nie zostala znaleziona"));
    } else {
      return PagewiseListView(
          pageSize: 20,
          totalCount: _firstResult.totalCount,
          showRetry: true,
          itemBuilder: (BuildContext context, entry) {
            return ProductItem(entry, _firstResult.currency);
          },
          pageFuture: (int pageIndex) async {
            print("Calling pageFuture with page: $pageIndex");

            if (pageIndex <= 1) {
              return _firstResult.products;
            }
            var response = await _productsProvider.search(_searchText, pageIndex);
            return response.products;
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFirstResult(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return buildList();
            }
        }
      },
    );
  }
}
