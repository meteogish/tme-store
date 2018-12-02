import 'package:tme_store/api/components/http_requester.dart';
import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/api/components/signature_creator.dart';
import "package:flutter/material.dart";
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState()=> _FavoriteWidgetState();
}
    
    
class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = true;
  int _favoriteCount = 41;

  ProductsRepository _repo;

  _FavoriteWidgetState()
  {
    _loadSecrets()
      .then((secrets){
        var parts = secrets.split("|");
        _repo = ProductsRepository(SignatureCreator(parts[0], parts[1]), ApiHttpRequester());
      });
  }

  Future<String> _loadSecrets() async {
    return await rootBundle.loadString('assets/Secret.txt');
  }

  void _toggleFavorite()
  {
    //repo.search("diody", 1);
    //["PLED-HOLDER-WH", "PLED-HOLDER-BK", "FIX-LED-6501"];
    _repo.getPricesAndStocks(["PLED-HOLDER-WH", "PLED-HOLDER-BK", "FIX-LED-6501"]);
    setState(() {
          _isFavorited ? 
            --_favoriteCount :
            ++_favoriteCount;

          _isFavorited = !_isFavorited; 
        });
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child:Container(
            child: Text('$_favoriteCount'),
          )
        )
    ]);
  }
    
}