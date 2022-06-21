// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BaseResponseData _$$_BaseResponseDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_BaseResponseData',
      json,
      ($checkedConvert) {
        final val = _$_BaseResponseData(
          success: $checkedConvert('success', (v) => v as bool? ?? true),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          data: $checkedConvert(
              'data',
              (v) => v == null
                  ? emptyMap
                  : const BaseResponseDataConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_BaseResponseDataToJson(_$_BaseResponseData instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': const BaseResponseDataConverter().toJson(instance.data),
    };
