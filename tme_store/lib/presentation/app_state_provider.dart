import 'package:flutter/material.dart';
import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/presentation/categories/categories_bloc.dart';
import 'package:tme_store/presentation/products/search_products_bloc.dart';

class AppStateProvider extends InheritedWidget {
  CategoriesBloc categoriesBloc;
  SearchProductsBloc searchProductsBloc;

  AppStateProvider(ProductsRepository repository, {Key key, Widget child})
      : super(key: key, child: child) {
    searchProductsBloc = SearchProductsBloc(repository);
    categoriesBloc = CategoriesBloc(repository);
  }

  @override
  bool updateShouldNotify(_) => true;

  static AppStateProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppStateProvider)
        as AppStateProvider);
  }
}
