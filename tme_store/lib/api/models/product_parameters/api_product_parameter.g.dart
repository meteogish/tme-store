// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_product_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiProductParameter _$ApiProductParameterFromJson(Map<String, dynamic> json) {
  return ApiProductParameter(
      json['ParameterId'] as String,
      json['ParameterName'] as String,
      json['ParameterValueId'] as String,
      json['ParameterValue'] as String);
}

Map<String, dynamic> _$ApiProductParameterToJson(
        ApiProductParameter instance) =>
    <String, dynamic>{
      'ParameterId': instance.parameterId,
      'ParameterName': instance.parameterName,
      'ParameterValueId': instance.parameterValueId,
      'ParameterValue': instance.parameterValue
    };
