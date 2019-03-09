import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tme_store/api/models/api_category.dart';
import 'package:tme_store/presentation/app_state_provider.dart';
import 'package:tme_store/presentation/categories/categories_bloc.dart';
import 'package:tme_store/presentation/categories/categories_grid.dart';
import 'dart:math';

class CategoriesPages extends StatelessWidget {
  final int _onPageCount = 9;

  @override
  Widget build(BuildContext context) {
    CategoriesBloc bloc = AppStateProvider.of(context).categoriesBloc;

    return StreamBuilder<ApiCategory>(
        stream: bloc.rootCategoryStream,
        builder: (BuildContext context, AsyncSnapshot<ApiCategory> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            ApiCategory rootCategory = snapshot.data;
            print('Rebuilding category: ${rootCategory.name}');

            int pagesCount = (rootCategory.subTree.length / _onPageCount).ceil();
            print('Pages count: $pagesCount');

            return Column(children: <Widget>[
              Flexible(
                flex: 2,
                child: StreamBuilder<int>(
                  stream: bloc.categoriesPageNumberStream,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    print(
                        'Rebuilding dots snapshot has data: ${snapshot.hasData}, data: ${snapshot.data}, state: ${snapshot.connectionState}');

                    return DotsIndicator(
                        position: snapshot.data ?? 0, numberOfDot: pagesCount);
                  },
                ),
              ),
              Flexible(
                  flex: 10,
                  child: PageView(
                    onPageChanged: bloc.updateCategoryPageNumber,
                    children:
                        List<int>.generate(pagesCount, (i) => i).map((page) {
                          int subListStart = page * _onPageCount;
                          return CategoriesGrid(rootCategory.subTree.sublist(
                              subListStart,
                              min(subListStart + _onPageCount,
                                  rootCategory.subTree.length)));
                      })
                      .toList(),
                  )),
            ]);
          }

          return Center(child: CircularProgressIndicator());
        });
  }
}
