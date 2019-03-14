import 'package:tme_store/api/models/product_files/api_product_file.dart';
import 'package:tme_store/api/models/product_parameters/api_get_product_parameters_result_item.dart';

class ProductDetails {
  final ApiGetProductParametersResultItem parameter;
  final ApiProductFile files;

  ProductDetails({this.parameter, this.files});
}