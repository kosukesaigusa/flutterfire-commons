import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner.freezed.dart';
part 'owner.g.dart';

@freezed
class Owner with _$Owner {
  const factory Owner({
    @Default(0) int id,
    @Default('') String login,
    @Default('') String avatarUrl,
    @Default('') String htmlUrl,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  static const defaultValue = Owner();
}
