import 'package:flutter_test/flutter_test.dart';
import 'package:tme_store/api/components/http_requester.dart';
import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/api/components/signature_creator.dart';
import 'package:tme_store/api/models/models.dart';
import 'package:tme_store/api/models/product_files/api_get_product_files_result.dart';
import 'package:tme_store/api/models/product_parameters/api_get_product_parameters_result.dart';
import 'package:tme_store/secrets.dart';

void main() {

  test("GetProductParameters integration test", () async {
    print("Started");

    var context = ProductsRepository(
        SignatureCreator(Secrets.secret, Secrets.token), ApiHttpRequester());
    ApiGetProductParametersResult result = await context.getProductsParameters(["PLED-HOLDER-WH", "PLED-HOLDER-BK", "FIX-LED-6501"]);
    expect(result.products.length, 3);
  });

  test("GetProductFiles integration test", () async {
    print("Started");

    var context = ProductsRepository(
        SignatureCreator(Secrets.secret, Secrets.token), ApiHttpRequester());
    ApiGetProductFilesResult result = await context.getProductsFiles(["PLED-HOLDER-WH", "PLED-HOLDER-BK", "FIX-LED-6501"]);
    expect(result.products.length, 3);
  });

  test("GetPricesAndStocks integration test", () async {
    print("Started");

    var context = ProductsRepository(
        SignatureCreator(Secrets.secret, Secrets.token), ApiHttpRequester());
    ApiGetPricesAndStockResult result = await context.getPricesAndStocks("EUR",
        ["PLED-HOLDER-WH", "PLED-HOLDER-BK", "FIX-LED-6501"]);
    expect(result.products.length, 3);
  });

  test("GetCategories integration test", () async {
    print("Started");

    var context = ProductsRepository(
        SignatureCreator(Secrets.secret, Secrets.token), ApiHttpRequester());
    
    ApiGetCategoriesResult result = await context.getCategories();
    
    expect(result.rootCategory, isNot(null));
    expect(result.rootCategory.id, "111000");
  });

  test("Api Search integration test", () async {
    print("Started");

    var context = ProductsRepository(
        SignatureCreator(Secrets.secret, Secrets.token), ApiHttpRequester());
    
    ApiSearchResult result = await context.search("arduino", 1);
    expect(result.page, 1);
    expect(result.products.length, 20);
  });

  test("Search by category integration test", () async {
    print("Started");

    var context = ProductsRepository(
        SignatureCreator(Secrets.secret, Secrets.token), ApiHttpRequester());
    
    ApiSearchResult result = await context.search(null, 1, categoryId: "113644");
    expect(result.page, 1);
    expect(result.products.length, 20);
  });
}
