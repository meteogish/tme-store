import 'package:json_annotation/json_annotation.dart';

part 'api_product_parameter.g.dart';

@JsonSerializable()
class ApiProductParameter {
  @JsonKey(name: 'ParameterId')
  final String parameterId;

  @JsonKey(name: 'ParameterName')
  final String parameterName;

  @JsonKey(name: 'ParameterValueId')
  final String parameterValueId;

  @JsonKey(name: 'ParameterValue')
  final String parameterValue;

  ApiProductParameter(this.parameterId, this.parameterName,
      this.parameterValueId, this.parameterValue);

  static ApiProductParameter fromJson(Map<String, dynamic> json) =>
      _$ApiProductParameterFromJson(json);

  Map<String, dynamic> toJson() => _$ApiProductParameterToJson(this);
}
