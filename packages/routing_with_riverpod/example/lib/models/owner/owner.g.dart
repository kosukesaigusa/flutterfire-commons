// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Owner _$$_OwnerFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Owner',
      json,
      ($checkedConvert) {
        final val = _$_Owner(
          id: $checkedConvert('id', (v) => v as int? ?? 0),
          login: $checkedConvert('login', (v) => v as String? ?? ''),
          avatarUrl: $checkedConvert('avatar_url', (v) => v as String? ?? ''),
          htmlUrl: $checkedConvert('html_url', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {'avatarUrl': 'avatar_url', 'htmlUrl': 'html_url'},
    );

Map<String, dynamic> _$$_OwnerToJson(_$_Owner instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
    };
