import 'dart:collection';
import 'package:flutter_test/flutter_test.dart';
import 'package:tme_store/api/components/signature_creator.dart';

void main() {
  test("Create GetPrices signature test", () async {
    print("Started");

    var parts =
        "PUT Secret.txt CONTENT HERE"
            .split("|");
    var context = SignatureCreator(parts[0], parts[1]);

    LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
    map.addAll({
      "Language": "PL",
      "Token": context.token,
      "Country": "PL",
      "Currency": "EUR",
      "SymbolList[0]": "PLED-HOLDER-WH",
      "SymbolList[1]": "PLED-HOLDER-BK",
      "SymbolList[2]": "FIX-LED-6501"
    });

    String signature = context.createApiSignature(
        "https://api.tme.eu/Products/GetPrices.json", map);
    print(signature);
    expect(signature, "b0PE6amK/R808up0j8ZnUMph8ZU=");
  });
}
