import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/models/models.dart';
import 'package:tme_store/models/product_details.dart';

class ProductDetailsBloc {
  ProductsRepository _repository;

  ProductDetailsBloc(this._repository);

  Future<ProductDetails> getProductDetails(Product product) async {
    var files = await _repository.getProductsFiles([product.symbol]);
    var parameters = await _repository.getProductsParameters([product.symbol]);
    print('calling get product details for product ${product.symbol}');
    return ProductDetails(parameter: parameters.products.first, files: files.products.first.file);
  }
}