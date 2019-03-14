import 'package:json_annotation/json_annotation.dart';
import 'package:tme_store/api/models/product_files/api_product_file.dart';

part 'api_get_product_files_result_item.g.dart';

@JsonSerializable()
class ApiGetProductFilesResultItem {
  @JsonKey(name: 'Symbol')
  final String symbol;

  @JsonKey(name: 'Files')
  final ApiProductFile file;

  ApiGetProductFilesResultItem({
    this.symbol,
    this.file
  });

  static ApiGetProductFilesResultItem fromJson(Map<String, dynamic> json) =>
     _$ApiGetProductFilesResultItemFromJson(json);

  Map<String, dynamic> toJson() => _$ApiGetProductFilesResultItemToJson(this);

}