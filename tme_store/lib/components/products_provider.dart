import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/api/models/models.dart';
import 'package:queries/collections.dart';
import 'package:tme_store/models/models.dart';

class ProductsProvider {
  ProductsRepository _repository;

  ProductsProvider(this._repository);

  Future<SearchProductsResult> search(String text, int page) async {
    if(text.isEmpty) {
      return SearchProductsResult.empty();
    }

    var searchResult = await _repository.search(text, page);
    
    if(searchResult.totalProductsFound == 0) {
      return SearchProductsResult.empty();
    }

    var priceResult = await _repository
        .getPricesAndStocks(searchResult.products.map((p) => p.symbol).toList());

    var searchProductsCollection = Collection(searchResult.products);
    var pricesCollection = Collection(priceResult.products);

    var products = pricesCollection.join<ApiProduct, String, Product>(
        searchProductsCollection,
        (p1) => p1.symbol,
        (p2) => p2.symbol,
        (p1, p2) => Product(
            amount: p1.amount,
            symbol: p2.symbol,
            category: p2.category,
            description: p2.description,
            producer: p2.producer,
            weight: p2.weight,
            unit: p2.unit,
            photoUrl: p2.photoUrl,
            thumbnailUrl: p2.thumbnailUrl,
            price: ProductPrice(
                vatRate: p1.vatRate,
                vatType: p1.vatType,
                priceOffers: p1.prices.map((apiPrice) => PriceOffer(
                    ammountInOffer: apiPrice.amount,
                    isSpecialPrice: apiPrice.isSpecial,
                    price: apiPrice.value)).toList()))).toList();

    return SearchProductsResult(
      currency: priceResult.currency, 
      priceType: priceResult.priceType,
      products: products,
      totalCount: searchResult.totalProductsFound);
  }
}
