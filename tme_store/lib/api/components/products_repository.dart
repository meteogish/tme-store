import 'dart:collection';
import 'package:tme_store/api/components/http_requester.dart';
import 'package:tme_store/api/components/signature_creator.dart';
import 'package:tme_store/api/models/models.dart';

class ProductsRepository {
  String _searchEndpoint = "https://api.tme.eu/Products/Search.json";
  String _getPricesAndStocksEndpoint = "https://api.tme.eu/Products/GetPricesAndStocks.json";

  final SignatureCreator _signatureCreator;
  final HttpRequester _requester;

  ProductsRepository(this._signatureCreator, this._requester);

  Future<ApiGetPricesAndStockResult> getPricesAndStocks(List<String> symbols) async {
    var values = _combineValues(symbols);
    values["Currency"] = "EUR";

    var signature = _signatureCreator.createApiSignature(_getPricesAndStocksEndpoint, values);
    print(signature);

    values["ApiSignature"] = signature;

    var apiResponse = await _requester.post<ApiGetPricesAndStockResult>(_getPricesAndStocksEndpoint, values);
    return apiResponse.data;
  }

  Future<ApiSearchResult> search(String text, int page) async {
    var values = _combineValues([]);
    values.addAll({
      "SearchPlain": text,
      "SearchPage": "$page",
    });

    String signature = _signatureCreator.createApiSignature(_searchEndpoint, values);
    values["ApiSignature"] = signature;

    var apiResponse = await _requester.post<ApiSearchResult>(_searchEndpoint, values);
    return apiResponse.data;
  }

  Map<String, String> _combineValues(List<String> symbols) {
    var map = new LinkedHashMap<String, String>();
    map.addAll({ 
      "Language": "PL",
      "Token": _signatureCreator.token,
      "Country": "PL",  
    });

      for (var i = 0; i < symbols.length; i++) {
        map.addAll({"SymbolList[$i]": symbols[i]});
      }

    return map;
  }
}
