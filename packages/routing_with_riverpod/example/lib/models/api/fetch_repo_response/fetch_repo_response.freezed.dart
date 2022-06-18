// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_repo_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FetchRepoResponse _$FetchRepoResponseFromJson(Map<String, dynamic> json) {
  return _FetchRepoResponse.fromJson(json);
}

/// @nodoc
mixin _$FetchRepoResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Repo get repo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FetchRepoResponseCopyWith<FetchRepoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchRepoResponseCopyWith<$Res> {
  factory $FetchRepoResponseCopyWith(
          FetchRepoResponse value, $Res Function(FetchRepoResponse) then) =
      _$FetchRepoResponseCopyWithImpl<$Res>;
  $Res call({bool success, String message, Repo repo});

  $RepoCopyWith<$Res> get repo;
}

/// @nodoc
class _$FetchRepoResponseCopyWithImpl<$Res>
    implements $FetchRepoResponseCopyWith<$Res> {
  _$FetchRepoResponseCopyWithImpl(this._value, this._then);

  final FetchRepoResponse _value;
  // ignore: unused_field
  final $Res Function(FetchRepoResponse) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? repo = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      repo: repo == freezed
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as Repo,
    ));
  }

  @override
  $RepoCopyWith<$Res> get repo {
    return $RepoCopyWith<$Res>(_value.repo, (value) {
      return _then(_value.copyWith(repo: value));
    });
  }
}

/// @nodoc
abstract class _$$_FetchRepoResponseCopyWith<$Res>
    implements $FetchRepoResponseCopyWith<$Res> {
  factory _$$_FetchRepoResponseCopyWith(_$_FetchRepoResponse value,
          $Res Function(_$_FetchRepoResponse) then) =
      __$$_FetchRepoResponseCopyWithImpl<$Res>;
  @override
  $Res call({bool success, String message, Repo repo});

  @override
  $RepoCopyWith<$Res> get repo;
}

/// @nodoc
class __$$_FetchRepoResponseCopyWithImpl<$Res>
    extends _$FetchRepoResponseCopyWithImpl<$Res>
    implements _$$_FetchRepoResponseCopyWith<$Res> {
  __$$_FetchRepoResponseCopyWithImpl(
      _$_FetchRepoResponse _value, $Res Function(_$_FetchRepoResponse) _then)
      : super(_value, (v) => _then(v as _$_FetchRepoResponse));

  @override
  _$_FetchRepoResponse get _value => super._value as _$_FetchRepoResponse;

  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? repo = freezed,
  }) {
    return _then(_$_FetchRepoResponse(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      repo: repo == freezed
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as Repo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FetchRepoResponse implements _FetchRepoResponse {
  const _$_FetchRepoResponse(
      {this.success = true, this.message = '', this.repo = Repo.defaultValue});

  factory _$_FetchRepoResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FetchRepoResponseFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final Repo repo;

  @override
  String toString() {
    return 'FetchRepoResponse(success: $success, message: $message, repo: $repo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchRepoResponse &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.repo, repo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(repo));

  @JsonKey(ignore: true)
  @override
  _$$_FetchRepoResponseCopyWith<_$_FetchRepoResponse> get copyWith =>
      __$$_FetchRepoResponseCopyWithImpl<_$_FetchRepoResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FetchRepoResponseToJson(this);
  }
}

abstract class _FetchRepoResponse implements FetchRepoResponse {
  const factory _FetchRepoResponse(
      {final bool success,
      final String message,
      final Repo repo}) = _$_FetchRepoResponse;

  factory _FetchRepoResponse.fromJson(Map<String, dynamic> json) =
      _$_FetchRepoResponse.fromJson;

  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  Repo get repo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FetchRepoResponseCopyWith<_$_FetchRepoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
