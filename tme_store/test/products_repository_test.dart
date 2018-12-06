import 'package:flutter_test/flutter_test.dart';
import 'package:tme_store/api/components/http_requester.dart';
import 'package:tme_store/api/components/products_repository.dart';
import 'package:tme_store/api/components/signature_creator.dart';
import 'package:tme_store/api/models/models.dart';

void main() {
  test("GetPricesAndStocks integration test", () async {
    print("Started");

    var parts =
        "PUT Secret.txt CONTENT HERE"
            .split("|");
    var context = ProductsRepository(
        SignatureCreator(parts[0], parts[1]), ApiHttpRequester());
    ApiGetPricesAndStockResult result = await context.getPricesAndStocks(
        ["PLED-HOLDER-WH", "PLED-HOLDER-BK", "FIX-LED-6501"]);
    expect(result.products.length, 3);
  });

  test("Api Search integration test", () async {
    print("Started");

    var parts =
        "PUT Secret.txt CONTENT HERE"
            .split("|");
    var context = ProductsRepository(
        SignatureCreator(parts[0], parts[1]), ApiHttpRequester());
    
    ApiSearchResult result = await context.search("arduino", 1);
    expect(result.page, 1);
    expect(result.products.length, 20);
  });
}
