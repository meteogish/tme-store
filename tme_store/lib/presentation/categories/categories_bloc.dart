import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/api/models/api_category.dart';

class CategoriesBloc {
  ProductsRepository _repository;

  HashMap<String, ApiCategory> _categories;

  CategoriesBloc(this._repository) {
    _categories = HashMap<String, ApiCategory>();
  }

  final _categoriesPageNumberController = PublishSubject<int>();
  final _rootCategoryController = PublishSubject<ApiCategory>();

  Stream<int> get categoriesPageNumberStream => _categoriesPageNumberController.distinct();

  Stream<ApiCategory> get rootCategoryStream => _rootCategoryController.stream;

  Function(int) get updateCategoryPageNumber => _categoriesPageNumberController.sink.add;

  Future getCategories() async {
    var categories = await _repository.getCategories();
    _buildCategoriesMap(categories.rootCategory);

    print('Category ok. ${categories.rootCategory.id}');
    _rootCategoryController.add(categories.rootCategory);
  }

  ApiCategory getCategoryById(String categoryId) => _categories[categoryId];

  void _buildCategoriesMap(ApiCategory rootCategory) {
    _categories[rootCategory.id] = rootCategory;

    for (var category in rootCategory.subTree) {
      _buildCategoriesMap(category);
    }
  }

  dispose() {
    _categoriesPageNumberController.close();
    _rootCategoryController.close();
  }
}
