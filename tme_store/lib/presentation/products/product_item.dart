import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tme_store/models/models.dart';
import 'package:tme_store/presentation/products/product_details/product_details_page.dart';

class ProductItem extends StatelessWidget {
  final Product _product;
  final String currency;

  ProductItem(this._product, this.currency);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(child:Text(_product.symbol,
                style: Theme.of(context).textTheme.subhead.apply(fontWeightDelta: 4,color: Theme.of(context).accentColor)),
                padding: EdgeInsets.only(left: 5.0),),
            ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(_product, currency),
                      ),
                    );
                },
                isThreeLine: true,
                leading: CachedNetworkImage(
                  width: 50.0,
                  height: 50.0,
                  imageUrl: "https:${_product.thumbnailUrl}",
                  placeholder: (context, url) =>
                      Container(width:50.0, height: 50.0),
                  errorWidget: (context, url, error) => Icon(Icons.cloud_queue),
                ),
                title: Text(_product.producer ?? '',
                    style: Theme.of(context).textTheme.subhead.apply(fontWeightDelta: 2)),
                subtitle: Text(_product.description),
                trailing: Column(children: <Widget>[
                  Text("${_product.price.minPrice.toStringAsFixed(2)} $currency", style: Theme.of(context).textTheme.subtitle.apply(fontWeightDelta: 10)),
                  Text("${_product.amount} ${_product.unit}", style: Theme.of(context).textTheme.caption.apply(fontSizeDelta: 2.5)),
                ]))
          ],
        ));
  }
}
