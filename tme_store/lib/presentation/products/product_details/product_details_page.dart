import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tme_store/models/product.dart';
import 'package:tme_store/presentation/app_state_provider.dart';
import 'package:tme_store/presentation/categories/categories_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  Product _product;
  String _currency;

  ProductDetailsPage(this._product, this._currency);

  @override
  Widget build(BuildContext context) {
    CategoriesBloc categoriesBloc = AppStateProvider.of(context).categoriesBloc;
    var category = categoriesBloc.getCategoryById(_product.category);

    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: "https:${_product.photoUrl}",
                  placeholder: (context, url) =>
                      Container(width: 50.0, height: 50.0),
                  errorWidget: (context, url, error) =>
                      new Icon(Icons.cloud_queue)),
                      Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  )),
              // Align(
              //     alignment: Alignment.topRight,
              //     child: FloatingActionButton(
              //       onPressed: () {},
              //       backgroundColor: Colors.white,
              //       child: Center(
              //         child: Icon(Icons.shopping_basket, color: Colors.black),
              //       ),
              //       mini: true,
              //       elevation: 0.0,
              //     )),
              // Padding(
              //   padding: EdgeInsets.only(left: 15.0, top: 100.0),
              //   child: Text(
              //     'Woman',
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontFamily: 'Montserrat',
              //         fontSize: 37.0,
              //         fontWeight: FontWeight.bold),
              //   ),
              // )
            ],
          ),
          // SizedBox(height: 25.0),
          // Padding(
          //   padding: EdgeInsets.only(left: 15.0),
          //   child: Text(
          //     'Symbol: ${_product.symbol}',
          //     style: TextStyle(
          //         fontFamily: 'Montserrat', fontSize: 15.0, color: Colors.grey),
          //   ),
          // ),
          // SizedBox(height: 25.0),
          // Padding(
          //   padding: EdgeInsets.only(left: 15.0),
          //   child: Text(
          //     '${_product.description}',
          //     style: TextStyle(
          //         fontFamily: 'Quicksand', fontSize: 17.0, color: Colors.black),
          //   ),
          // ),
          // SizedBox(height: 25.0),
          // Container(
          //   height: 100.0,
          //   child: ListView(
          //     padding: EdgeInsets.only(left: 15.0),
          //     scrollDirection: Axis.horizontal,
          //     children: <Widget>[
          //       Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(50.0),
          //             image: DecorationImage(
          //                 image: AssetImage('assets/pic3.jpeg'),
          //                 fit: BoxFit.cover)),
          //         height: 100.0,
          //         width: 100.0,
          //         child: Center(
          //           child: Text(
          //             'New In',
          //             style: TextStyle(
          //                 fontFamily: 'Montserrat',
          //                 color: Colors.white,
          //                 fontSize: 15.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ),
          //       SizedBox(width: 15.0),
          //       Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(50.0),
          //             image: DecorationImage(
          //                 image: AssetImage('assets/pic4.jpeg'),
          //                 fit: BoxFit.cover)),
          //         height: 100.0,
          //         width: 100.0,
          //         child: Center(
          //           child: Text(
          //             'Tops',
          //             style: TextStyle(
          //                 fontFamily: 'Montserrat',
          //                 color: Colors.white,
          //                 fontSize: 15.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ),
          //       SizedBox(width: 15.0),
          //       Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(50.0),
          //             image: DecorationImage(
          //                 image: AssetImage('assets/pic5.jpeg'),
          //                 fit: BoxFit.cover)),
          //         height: 100.0,
          //         width: 100.0,
          //         child: Center(
          //           child: Text(
          //             'Pants',
          //             style: TextStyle(
          //                 fontFamily: 'Montserrat',
          //                 color: Colors.white,
          //                 fontSize: 15.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ),
          //       SizedBox(width: 15.0),
          //       Container(
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(50.0),
          //             image: DecorationImage(
          //                 image: AssetImage('assets/pic4.jpeg'),
          //                 fit: BoxFit.cover)),
          //         height: 100.0,
          //         width: 100.0,
          //         child: Center(
          //           child: Text(
          //             'Accessories',
          //             style: TextStyle(
          //                 fontFamily: 'Montserrat',
          //                 color: Colors.white,
          //                 fontSize: 15.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 10.0),
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
                      _product.amount > 0 ? Text(
                        'Jest na magazynie: ${_product.amount} ${_product.unit}',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ) 
                      :
                      Text(
                        'Nie ma na magazynie',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      )
                      ,
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
                      SizedBox(height: 15.0),
                      Text(
                        'PARAMETRY',
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
                            createTableDescriptionRow(
                                context,
                                'Kategoria produktu',
                                _product.category,
                                Colors.grey[300]),
                            createTableDescriptionRow(context, 'Producent',
                                _product.producer, Colors.transparent),
                            createTableDescriptionRow(context, 'Waga',
                                '${_product.weight}', Colors.grey[300]),
                                createTableDescriptionRow(context, 'Waga',
                                '${_product.weight}', Colors.grey[300]),
                          ]),
                    ],
                  ),
                ),
                Text("2"),
                // Text("3"),
                // Text("4"),
                // Text("5"),
              ],
            ),
          )
        ],
      ),
    ));
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
}
