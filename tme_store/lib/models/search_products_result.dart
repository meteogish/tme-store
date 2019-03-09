import 'package:tme_store/models/models.dart';

class SearchProductsResult {
  final String priceType;
  final String currency;
  final List<Product> products;
  final int totalCount;
  final Map<String, int> totalProductsPerCategory;

  SearchProductsResult({
    this.priceType,
    this.currency,
    this.products,
    this.totalCount,
    this.totalProductsPerCategory
  });

  static SearchProductsResult empty() {
    return SearchProductsResult(
      currency: null, 
      priceType: null,
      products: [],
      totalCount: 0);
  }
}