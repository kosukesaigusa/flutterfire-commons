// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'problem_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProblemState {
  List<int> get numbers => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProblemStateCopyWith<ProblemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProblemStateCopyWith<$Res> {
  factory $ProblemStateCopyWith(
          ProblemState value, $Res Function(ProblemState) then) =
      _$ProblemStateCopyWithImpl<$Res>;
  $Res call({List<int> numbers, String? answer});
}

/// @nodoc
class _$ProblemStateCopyWithImpl<$Res> implements $ProblemStateCopyWith<$Res> {
  _$ProblemStateCopyWithImpl(this._value, this._then);

  final ProblemState _value;
  // ignore: unused_field
  final $Res Function(ProblemState) _then;

  @override
  $Res call({
    Object? numbers = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      numbers: numbers == freezed
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProblemStateCopyWith<$Res>
    implements $ProblemStateCopyWith<$Res> {
  factory _$$_ProblemStateCopyWith(
          _$_ProblemState value, $Res Function(_$_ProblemState) then) =
      __$$_ProblemStateCopyWithImpl<$Res>;
  @override
  $Res call({List<int> numbers, String? answer});
}

/// @nodoc
class __$$_ProblemStateCopyWithImpl<$Res>
    extends _$ProblemStateCopyWithImpl<$Res>
    implements _$$_ProblemStateCopyWith<$Res> {
  __$$_ProblemStateCopyWithImpl(
      _$_ProblemState _value, $Res Function(_$_ProblemState) _then)
      : super(_value, (v) => _then(v as _$_ProblemState));

  @override
  _$_ProblemState get _value => super._value as _$_ProblemState;

  @override
  $Res call({
    Object? numbers = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$_ProblemState(
      numbers: numbers == freezed
          ? _value._numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProblemState implements _ProblemState {
  const _$_ProblemState({final List<int> numbers = const <int>[], this.answer})
      : _numbers = numbers;

  final List<int> _numbers;
  @override
  @JsonKey()
  List<int> get numbers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_numbers);
  }

  @override
  final String? answer;

  @override
  String toString() {
    return 'ProblemState(numbers: $numbers, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProblemState &&
            const DeepCollectionEquality().equals(other._numbers, _numbers) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_numbers),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$_ProblemStateCopyWith<_$_ProblemState> get copyWith =>
      __$$_ProblemStateCopyWithImpl<_$_ProblemState>(this, _$identity);
}

abstract class _ProblemState implements ProblemState {
  const factory _ProblemState({final List<int> numbers, final String? answer}) =
      _$_ProblemState;

  @override
  List<int> get numbers => throw _privateConstructorUsedError;
  @override
  String? get answer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProblemStateCopyWith<_$_ProblemState> get copyWith =>
      throw _privateConstructorUsedError;
}
