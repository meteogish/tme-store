import 'package:tme_store/api/components/http_requester.dart';
import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/api/components/signature_creator.dart';
import 'package:flutter/material.dart';
import 'package:tme_store/presentation/app_state_provider.dart';
import 'package:tme_store/presentation/categories/root_category_pages.dart';
import 'package:tme_store/presentation/search_products_delegate.dart';
import 'package:tme_store/secrets.dart';

void main() {
  var app = AppStateProvider(
      ProductsRepository(
          SignatureCreator(Secrets.secret, Secrets.token), ApiHttpRequester()),
      child: new MaterialApp(
        title: 'TME.Store',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ));
  app.categoriesBloc.getCategories();
  runApp(app);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text("TME Store"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search), 
              onPressed: () => showSearch(context: context, delegate: SearchProductsDelegate())),
          ]
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: CategoriesPages()));
  }
}
