// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repos_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchReposResponse _$$_SearchReposResponseFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_SearchReposResponse',
      json,
      ($checkedConvert) {
        final val = _$_SearchReposResponse(
          success: $checkedConvert('success', (v) => v as bool? ?? true),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          totalCount: $checkedConvert('total_count', (v) => v as int? ?? 0),
          incompleteResults:
              $checkedConvert('incomplete_results', (v) => v as bool? ?? false),
          repos: $checkedConvert(
              'items',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Repo.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const <Repo>[]),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalCount': 'total_count',
        'incompleteResults': 'incomplete_results',
        'repos': 'items'
      },
    );

Map<String, dynamic> _$$_SearchReposResponseToJson(
        _$_SearchReposResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.repos,
    };
