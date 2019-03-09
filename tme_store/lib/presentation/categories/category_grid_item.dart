import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tme_store/api/models/api_category.dart';
import 'package:tme_store/presentation/categories/subcategory_list_page.dart';

class CategoryGridItem extends StatelessWidget {
  final ApiCategory _category;

  CategoryGridItem(this._category);

  @override
  Widget build(BuildContext context) {
    bool nameHasAtLeastThreeWords = _category.name.split(' ').length == 2;

    return RaisedButton(
        color: Colors.white,
        child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                constraints: BoxConstraints.tight(Size(80, 60)),
                child: CachedNetworkImage(
                  width: 50.0,
                  height: 50.0,
                  imageUrl: "https:${_category.thumbnaillUrl}",
                  placeholder: (context, url) =>
                      Container(width:50.0, height: 50.0),
                  errorWidget: (context, url, error) => Icon(Icons.cloud_queue),
                ),
              ),
              Text(
                '${_category.name}',
                style: Theme.of(context).textTheme.button,
                textAlign: nameHasAtLeastThreeWords ? TextAlign.left : TextAlign.center,
                maxLines: nameHasAtLeastThreeWords ? 2 : 1,
                overflow: nameHasAtLeastThreeWords
                    ? TextOverflow.clip
                    : TextOverflow.ellipsis
              ),
            ]),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubCategoryListPage(_category),
            ),
          );
        });
  }
}
