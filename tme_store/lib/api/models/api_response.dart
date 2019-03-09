import 'package:json_annotation/json_annotation.dart';
import 'package:tme_store/api/models/api_get_categories_result.dart';
import 'package:tme_store/api/models/api_get_prices_result_and_stock.dart';
import 'package:tme_store/api/models/api_search_result.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse<T> {
  @JsonKey(name: 'Status')
  final String status;

  @JsonKey(name: 'Data', toJson: _dataToJson, fromJson: _dataFromJson)
  final T data;

  @JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  @JsonKey(name: 'Error')
  final dynamic error;

  ApiResponse(this.status, this.data, this.errorMessage, this.error);

  static ApiResponse<T> fromJson<T>(Map<String, dynamic> json) =>
      _$ApiResponseFromJson<T>(json);
}

T _dataFromJson<T>(dynamic json) {
  if (json is! List) {
    switch(T)
    {
      case ApiGetCategoriesResult:
        return ApiGetCategoriesResult.fromJson(json) as T;
      case ApiGetPricesAndStockResult:
        return ApiGetPricesAndStockResult.fromJson(json) as T;
      case ApiSearchResult:
        return ApiSearchResult.fromJson(json) as T;
      default:
        throw "Unknown ApiResponse Data type.";
    }
  }
  return null;
}

Map<String, dynamic> _dataToJson<T>(T input) => {'Data': input};
