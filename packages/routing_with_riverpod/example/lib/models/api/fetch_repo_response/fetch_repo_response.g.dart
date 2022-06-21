// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_repo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FetchRepoResponse _$$_FetchRepoResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_FetchRepoResponse',
      json,
      ($checkedConvert) {
        final val = _$_FetchRepoResponse(
          success: $checkedConvert('success', (v) => v as bool? ?? true),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          repo: $checkedConvert(
              'repo',
              (v) => v == null
                  ? Repo.defaultValue
                  : Repo.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_FetchRepoResponseToJson(
        _$_FetchRepoResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'repo': instance.repo,
    };
