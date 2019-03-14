import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tme_store/api/models/product_files/api_product_document.dart';
import 'package:tme_store/models/product.dart';
import 'package:tme_store/models/product_details.dart';
import 'package:tme_store/presentation/app_state_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  Product _product;
  String _currency;
  ProductDetails _details;

  List<String> photosUrls = [];

  ProductDetailsPage(this._product, this._currency);

  @override
  Widget build(BuildContext context) {
    print('Weight ${_product.weight}');
    return Scaffold(
        body: FutureBuilder<ProductDetails>(
      future: AppStateProvider.of(context)
          .productDetailsBloc
          .getProductDetails(_product), //0?
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
              print('prod details page');
              _details = snapshot.data;

              photosUrls = _details.files.presentations
                  .expand((f) => f)
                  .where((f) => f.isNotEmpty)
                  .toList()
                  .map((f) => 'https:$f')
                  .toList();
              photosUrls.addAll(_details.files.photoUrls
                  .where((f) => f.isNotEmpty)
                  .toList()
                  .map((f) => 'https:$f'));

              print('Photos urls: ${photosUrls.length}');
              photosUrls.forEach((f) => print('$f'));

              print('Documents: ${_details.files.documents?.length}');
              _details.files.documents?.forEach((d) => print('$d'));

              return buildBody(context);
            }
        }
      },
    ));
  }

  Widget buildBody(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 250.0,
            child: Stack(
              children: <Widget>[
                ListView(
                    scrollDirection: Axis.horizontal,
                    children: photosUrls.map((f) {
                      return CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "$f",
                          placeholder: (context, url) =>
                              Container(width: 50.0, height: 50.0),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.cloud_queue));
                    }).toList()),
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    )),
              ],
            ),
          ),
          TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.6),
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                  // icon: new Icon(Icons.info),
                  text: "Informacja"),
              Tab(
                  // icon: new Icon(Icons.info),
                  text: "Parametry"),
              Tab(
                  // icon: new Icon(Icons.content_paste),
                  text: "Dokumenty"),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 350.0,
            child: TabBarView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ListView(
                    children: <Widget>[
                      Text(
                        'Symbol: ${_product.symbol}',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey),
                      ),
                      SizedBox(height: 15.0),
                      _product.amount > 0
                          ? Text(
                              'Jest na magazynie: ${_product.amount} ${_product.unit}',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Nie ma na magazynie',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                      SizedBox(height: 15.0),
                      Text(
                        '${_product.description}',
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 17.0,
                            color: Colors.black),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'PROGI CENOWE',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Table(
                          border: TableBorder.all(
                              width: 0.0, color: Colors.transparent),
                          children: [
                            TableRow(
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                children: [
                                  TableCell(
                                    child: Padding(
                                      child: Text(
                                        'Ilość [${_product.unit}]',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0,
                                            color: Colors.grey),
                                      ),
                                      padding: EdgeInsets.only(left: 4.0),
                                    ),
                                  ),
                                  TableCell(
                                      child: Text(
                                    'Cena',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 15.0,
                                        color: Colors.grey),
                                  ))
                                ])
                          ]..addAll(_product.price.priceOffers.map((offer) {
                              return TableRow(
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        child: Text(
                                          '${offer.ammountInOffer}',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 15.0,
                                              color: Colors.grey[700]),
                                        ),
                                        padding: EdgeInsets.only(left: 4.0),
                                      ),
                                    ),
                                    TableCell(
                                        child: RichText(
                                      text: TextSpan(
                                        text: offer.price.toStringAsFixed(2),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 19.0,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' $_currency',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 13.0,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ))
                                  ]);
                            }).toList())),
                    ],
                  ),
                ),
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Table(
                          border: TableBorder.all(
                              width: 0.0, color: Colors.transparent),
                          children: _details.parameter.parameters.map((p) {
                            return createTableDescriptionRow(
                                context,
                                p.parameterName,
                                p.parameterValue,
                                Colors.transparent);
                          }).toList()),
                    ),
                  ],
                ),
                ListView(
                    children: _details.files.documents.isEmpty ?
                    [Padding(
                      padding: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                  'Nie znaleziono dokumentów dla tego produktu',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                    )]
                    :
                     _details.files.documents.map((d) {
                  print('Building list tile for document ${d.url}');
                  Uri uri = Uri.dataFromString(d.url);
                  return Container(
                    color: Colors.grey[350],
                    child: ListTile(
                      
                      title: Text(Uri.decodeComponent(uri.pathSegments.last)),
                      subtitle: Text(_getLabelByDocumentType(d.type)),
                      trailing: Icon(Icons.open_in_browser, color: Colors.blue,)
                    ),
                  );
                }).toList())
                // Text("3"),
                // Text("4"),
                // Text("5"),
              ],
            ),
          )
        ],
      ),
    );
  }

  TableRow createTableDescriptionRow(
      BuildContext context, String id, String value, Color rowColor) {
    return TableRow(decoration: BoxDecoration(color: rowColor), children: [
      TableCell(
        child: Padding(
          child: Text(
            '$id:',
            style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15.0,
                    color: Colors.grey)
                .apply(color: Colors.blue[500]),
          ),
          padding: EdgeInsets.only(left: 4.0),
        ),
      ),
      TableCell(
          child: Text(
        '$value',
        style: Theme.of(context).textTheme.subhead.apply(fontWeightDelta: 2),
      ))
    ]);
  }

  String _getLabelByDocumentType(DocumentType type) {
    switch (type) {
      case DocumentType.DTE:
        return 'dokumentacja techniczna';
      case DocumentType.GWA:
        return 'karta charakterystyki';
      case DocumentType.INB:
        return 'instrukcja bezpieczeństwa';
      case DocumentType.INS:
        return 'instrukcja';
      case DocumentType.KCH:
        return 'karta charakterystyki';
      case DocumentType.MOV:
        return 'film';
      case DocumentType.PRE:
        return 'prezentacja';
      case DocumentType.SFT:
        return 'oprogramowanie';
      case DocumentType.YTB:
        return 'film na YouTube';
      default:
    }
  }
}
