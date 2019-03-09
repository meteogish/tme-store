import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tme_store/api/models/api_category.dart';
import 'package:tme_store/presentation/products_page.dart';

class SubCategoryListPage extends StatelessWidget {
  ApiCategory _category;

  SubCategoryListPage(this._category);

  @override
  Widget build(BuildContext context) {
    //print("Showing category ${_category.name}, subtree count: ${_category.subTree?.length}");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('${_category.name}'),
        ),
        body: ListView.builder(
            itemBuilder: (context, i) {
              ApiCategory subTreeCategory = _category.subTree[i];

              bool hasChildren = subTreeCategory.subTreeCount != 0;
              return ListTile(
                leading: CachedNetworkImage(
                  width: 50.0,
                  height: 50.0,
                  imageUrl: "https:${subTreeCategory.thumbnaillUrl}",
                  placeholder: (context, url) =>
                      Container(width:50.0, height: 50.0),
                  errorWidget: (context, url, error) => new Icon(Icons.cloud_queue),
                ),
                title: Text(subTreeCategory.name),
                trailing: Icon(hasChildren ? Icons.arrow_forward : Icons.list),
                onTap: () {
                  if (!hasChildren) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsPage(subTreeCategory),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SubCategoryListPage(subTreeCategory),
                      ),
                    );
                  }
                },
              );
            },
            itemCount: _category.subTreeCount));
  }
}
