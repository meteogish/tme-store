import 'dart:collection';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  String _searchEndpoint = "https://api.tme.eu/Products/Search.json";
  String _getPricesEndpoint = "https://api.tme.eu/Products/GetPrices.json";

  ProductsRepository(this._secret, this._token);

  String _prefixRequestUri(String endpoint) =>
      "POST&${Uri.encodeComponent(endpoint)}&";

  String _secret;
  String _token;

  void getPrices() {
    List<String> list = ["PLED-HOLDER-WH", "PLED-HOLDER-BK", "FIX-LED-6501"];
    LinkedHashMap<String, String> values = _combineValues(list);
    values["Currency"] = "EUR";

    var signature = _createApiSignature(_getPricesEndpoint, values);
    print(signature);

    values["ApiSignature"] = signature;

    http.post(_getPricesEndpoint, body:values)
      .then((response) 
      {
        print(response.body);
      })
      .catchError((error) {
        print(error.runtimeType);
      });
  }

  void search(String text, int page) {
    LinkedHashMap<String, String> values = _combineValues(null);
    values.addAll({
      "SearchPlain": text,
      "SearchPage": "$page",
      "SymbolList[0]": "PLED-HOLDER-WH"
    });

    String signature = _createApiSignature(_searchEndpoint, values);
    print(signature);
  }

  String _createApiSignature(
      String urlEndpoint, Map<String, String> valuesMap) {
    String requestPrefix = _prefixRequestUri(urlEndpoint);

    LinkedHashMap<String, String> sortedMap = _sortRequestValuesMap(valuesMap);

    String requestSuffix = sortedMap.entries
        .map((mapEntry) =>
            "${Uri.encodeComponent(mapEntry.key)}=${Uri.encodeComponent(mapEntry.value)}")
        .join("&");

    String res = requestPrefix + Uri.encodeComponent(requestSuffix);
    print(res);
    var keyBytes = ascii.encode(_secret);
    var signatureBytes = ascii.encode(res);

    var hmacSha1 = new Hmac(sha1, keyBytes); // HMAC-SHA256

    var encodedSignature = hmacSha1.convert(signatureBytes);
    var signarture = base64Encode(encodedSignature.bytes);
    return signarture;
  }

  LinkedHashMap<String, String> _sortRequestValuesMap(
      Map<String, String> valuesMap) {
    List<String> sortedKeys = valuesMap.keys.toList();

    sortedKeys.sort(compareNatural);

    return LinkedHashMap.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => valuesMap[k]);
  }

  LinkedHashMap<String, String> _combineValues(List<String> symbols) {
    LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
    map.addAll({
      "Language": "PL",
      "Token": _token,
      "Country": "PL",
    });

    for (var i = 0; i < symbols?.length; i++) {
      map.addAll({"SymbolList[$i]": symbols[i]});
    }

    return map;
  }
}
