// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) {
  return ApiResponse<T>(
      json['Status'] as String,
      json['Data'] == null ? null : _dataFromJson(json['Data']),
      json['ErrorMessage'] as String,
      json['Error']);
}

Map<String, dynamic> _$ApiResponseToJson<T>(ApiResponse<T> instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Data': instance.data == null ? null : _dataToJson(instance.data),
      'ErrorMessage': instance.errorMessage,
      'Error': instance.error
    };
