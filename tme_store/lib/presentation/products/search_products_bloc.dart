import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/models/models.dart';
import 'package:tme_store/models/search_filter.dart';
import 'package:tme_store/models/search_products_result.dart';

class SearchProductsBloc {
  ProductsRepository _repository;

  Map<SearchFilter, SearchProductsResult> _cachedSearches;

  final onRequestChanged = PublishSubject<SearchFilter>();

  Stream<SearchProductsResult> searchProductsStream;

  SearchProductsBloc(this._repository) {
    _cachedSearches = HashMap<SearchFilter, SearchProductsResult>();

    searchProductsStream = onRequestChanged
                        .debounce(const Duration(milliseconds: 200))
                        .asyncMap((filter) => _searchForSuggestions(filter, 1))
                        .asBroadcastStream();
  }

  Future<SearchProductsResult> _searchForSuggestions(SearchFilter filter, int page) async {
    // SearchProductsResult result = _cachedSearches[filter];
    // print('Cache length ${_cachedSearches.length}');
    // if(result == null) {
    //   result = await search(filter, page);
    //   if(result != null) {
    //     _cachedSearches[filter] = result;
    //   }
    // }
    // return result;
    print('Searching suggestions with $filter and page $page');
    var searchResult = await _repository.search(filter.searchText, page, categoryId: filter.searchCategoryID);
    
    if(searchResult.totalProductsFound == 0) {
      print('Search results is empty');
      return SearchProductsResult.empty();
    }

    return SearchProductsResult(
      currency: null,
      priceType: null,
      products: null,
      totalCount: searchResult.totalProductsFound,
      totalProductsPerCategory: searchResult.totalProductsPerCategory);
  }

  Future<SearchProductsResult> search(SearchFilter filter, int page) async {
    print('Calling search with $filter and page $page');
    var searchResult = await _repository.search(filter.searchText, page, categoryId: filter.searchCategoryID);
    
    if(searchResult.totalProductsFound == 0) {
      print('Search results is empty');
      return SearchProductsResult.empty();
    }

    var priceResult = await _repository
        .getPricesAndStocks(filter.searchInCurrency, searchResult.products.map((p) => p.symbol).toList());

    var products = searchResult.products.map((sp) {
       final priceProduct = priceResult.products.firstWhere((pp) => pp.symbol == sp.symbol);
       return Product.fromApiModels(sp, priceProduct);
    }).toList();

    return SearchProductsResult(
      currency: priceResult.currency, 
      priceType: priceResult.priceType,
      products: products,
      totalCount: searchResult.totalProductsFound,
      totalProductsPerCategory: searchResult.totalProductsPerCategory);
  }
}