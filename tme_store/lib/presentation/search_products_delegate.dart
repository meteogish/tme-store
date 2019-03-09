import 'package:flutter/material.dart';
import 'package:tme_store/api/models/api_category.dart';
import 'package:tme_store/models/search_filter.dart';
import 'package:tme_store/models/search_products_result.dart';
import 'package:tme_store/presentation/app_state_provider.dart';
import 'package:tme_store/presentation/products/products_list.dart';

class SearchProductsDelegate extends SearchDelegate<String> {
  String _choosenCategory;
  
  @override
  List<Widget> buildActions(BuildContext context) {
    //print('Build actions');
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //print('Build leading');

    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    print(
        'Building results with category: $_choosenCategory and query: $query');
    if (query.isNotEmpty) {
      return ProductsList(
          SearchFilter(query, "PLN", categoryId: _choosenCategory));
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print('Build suggestions');

    print('Build suggestions: Query: $query');
    //showResults(context);

    if (query.isNotEmpty) {
      var bloc = AppStateProvider.of(context).searchProductsBloc;
      bloc.onRequestChanged.add(SearchFilter(query, "PLN"));

      return StreamBuilder(
        stream: bloc.searchProductsStream,
        builder: (context, AsyncSnapshot<SearchProductsResult> snapshot) {
          print('Search suggestions state ${snapshot.connectionState}');
          print('HasData: ${snapshot.hasData}');
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.active) {
            var categoriesBloc = AppStateProvider.of(context).categoriesBloc;

            var productsInCategories = snapshot.data.totalProductsPerCategory;
            //print('ProductsInCategories count = ${productsInCategories.length}');

            var entries = productsInCategories.keys
                .map((cId) => MapEntry<ApiCategory, int>(
                    categoriesBloc.getCategoryById(cId),
                    productsInCategories[cId]))
                .where((me) => me.key.name.isNotEmpty && me.key.depth < 3)
                .toList()
                  ..sort((c1, c2) => -c1.value.compareTo(c2.value));

            var sugg = entries
                .map((me) => '${me.value} w kategorii ${me.key.name}')
                .toList();

            return ListView.builder(
              itemCount: sugg.length,
              itemBuilder: (context, index) {
                var entry = entries[index];
                return RaisedButton(
                  color: Colors.white,
                  child: ListTile(
                      leading: Image.network("https:${entry.key.thumbnaillUrl}",
                          width: 30.0, height: 30.0),
                      title: _buildSuggestionText(entry.key, entry.value)),
                  onPressed: () {
                    _choosenCategory = entry.key.id;
                    showResults(context);
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    }
    return Container();
  }

  RichText _buildSuggestionText(ApiCategory category, int count) {
    return RichText(
      text: TextSpan(
          text: '$count',
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: ' w kategorii ',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic)),
            TextSpan(
                text: '${category.name}',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
          ]),
    );
  }
}
