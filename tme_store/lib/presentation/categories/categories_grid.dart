import 'package:flutter/material.dart';
import 'package:tme_store/api/models/api_category.dart';
import 'package:tme_store/presentation/categories/category_grid_item.dart';

class CategoriesGrid extends StatelessWidget {
  final List<ApiCategory> _categories;

  CategoriesGrid(this._categories);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.85),
      itemCount: _categories.length,
      itemBuilder: (context, i) {
        ApiCategory category = _categories[i];
        return Padding(padding: EdgeInsets.all(4.0), child: CategoryGridItem(category));
      },
    );
  }
}