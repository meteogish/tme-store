import 'dart:collection';
import 'package:tme_store/api/components/http_requester.dart';
import 'package:tme_store/api/components/models/models.dart';
import 'package:tme_store/api/components/signature_creator.dart';
import 'package:tme_store/api/models/models.dart';

class ProductsRepository {
  String _searchEndpoint = "https://api.tme.eu/Products/Search.json";
  String _getPricesAndStocksEndpoint = "https://api.tme.eu/Products/GetPricesAndStocks.json";
  String _getCategoriesEndpoint = "https://api.tme.eu/Products/GetCategories.json";

  final SignatureCreator _signatureCreator;
  final HttpRequester _requester;

  RequestFilter _defaultFilter = RequestFilter(country: "PL", language: "PL");

  ProductsRepository(this._signatureCreator, this._requester);

  Future<ApiGetPricesAndStockResult> getPricesAndStocks(
      String currency, 
      List<String> symbols, 
      {RequestFilter filter}) async {

    var values = _combineValues(filter ?? _defaultFilter, symbols: symbols);
    values["Currency"] = currency;
    
    return (await _createSignatureAndMakeResponse<ApiGetPricesAndStockResult>(_getPricesAndStocksEndpoint, values))?.data;
  }

  Future<ApiSearchResult> search(String text, int page, {String categoryId, RequestFilter filter}) async {
    var values = _combineValues(filter ?? _defaultFilter);
    
    if(text?.isNotEmpty ?? false) {
      values["SearchPlain"] = text;
    }

    if(categoryId != null) {
      values["SearchCategory"] = categoryId;
    }

    values.addAll({
      "SearchPage": "$page",
    });

    return (await _createSignatureAndMakeResponse<ApiSearchResult>(_searchEndpoint, values))?.data;
  }

  Future<ApiGetCategoriesResult> getCategories({int categoryId, RequestFilter filter}) async {
    var values = _combineValues(filter ?? _defaultFilter);
    
    if(categoryId != null)
    {
      values['CategoryId'] = '$categoryId';
    }

    return (await _createSignatureAndMakeResponse<ApiGetCategoriesResult>(_getCategoriesEndpoint, values))?.data;
  }

  Future<ApiResponse<T>> _createSignatureAndMakeResponse<T>(String enpointUrl, Map<String, String> values) async {
    String signature =
        _signatureCreator.createApiSignature(enpointUrl, values);
    values["ApiSignature"] = signature;

    print('Signature: $signature for $enpointUrl');
    
    var apiResponse =
        await _requester.post<T>(enpointUrl, values);

    return apiResponse;
  }

  Map<String, String> _combineValues(RequestFilter filter, { List<String> symbols: const [] }) {
    var map = new LinkedHashMap<String, String>();
    map.addAll({
      "Language": filter.language,
      "Token": _signatureCreator.token,
      "Country": filter.country,
    });

    for (var i = 0; i < symbols.length; i++) {
      map.addAll({"SymbolList[$i]": symbols[i]});
    }

    return map;
  }
}
