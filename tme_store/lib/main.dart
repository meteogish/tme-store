import 'package:tme_store/api/components/http_requester.dart';
import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/api/components/signature_creator.dart';
import 'package:tme_store/components/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:tme_store/presentation/products_list.dart';
import 'package:tme_store/secrets.dart';

void main() {
  runApp(new MaterialApp(
      title: 'TME.Store',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "TME Store")));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _searchText = "";
  ProductsProvider _productsProvider = 
    ProductsProvider(
      ProductsRepository(
            SignatureCreator(Secrets.secret, Secrets.token), ApiHttpRequester()));

  void _setSearch(String s) {
    setState(() {
      print("Setting state _searchText $s");
      _searchText = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: PreferredSize(
            child: SearchBar(widget.title, _setSearch),
            preferredSize: Size.fromHeight(60)),
        body: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: _productsProvider == null
                ? Center(child: CircularProgressIndicator())
                : ProductsList(_searchText, _productsProvider)));
  }
}

class SearchBar extends StatefulWidget {
  final String title;

  final ValueChanged<String> onSubmit;

  SearchBar(this.title, this.onSubmit);

  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  String _searchText = "";

  Icon _searchIcon = new Icon(Icons.search);

  Widget _appBarTitle;

  @override
  void initState() {
    super.initState();
    _appBarTitle = new Text(widget.title);
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          onSubmitted: widget.onSubmit,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Wyszukaj...',
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(widget.title);
      }
    });
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBar(context);
  }
}
