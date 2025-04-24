// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_success_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSuccessModel _$ApiSuccessModelFromJson(Map<String, dynamic> json) =>
    ApiSuccessModel(
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$ApiSuccessModelToJson(ApiSuccessModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };
