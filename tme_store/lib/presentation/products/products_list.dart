import 'package:flutter/material.dart';
import 'package:tme_store/models/models.dart';
import 'package:tme_store/models/search_filter.dart';
import 'package:tme_store/presentation/app_state_provider.dart';
import 'package:tme_store/presentation/products/product_item.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:tme_store/presentation/products/search_products_bloc.dart';

class ProductsList extends StatelessWidget {
  SearchProductsResult _firstResult;
  SearchFilter _filter;

  ProductsList(this._filter);

  Future _getFirstResult(SearchProductsBloc bloc) async {
    _firstResult = await bloc.search(_filter, 1);
  }

  Widget buildList(SearchProductsBloc bloc) {
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

            if(pageIndex == 0) {
              return [];
            }

            if (pageIndex == 1) {
              return _firstResult.products;
            }

            var response = await bloc.search(_filter, pageIndex);

            return response.products;
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    SearchProductsBloc bloc = AppStateProvider.of(context).searchProductsBloc;
    return FutureBuilder(
      future: _getFirstResult(bloc), //0?
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
              return buildList(bloc);
            }
        }
      },
    );
  }
}
