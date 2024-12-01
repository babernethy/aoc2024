// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FirstStateData {
  int get counter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirstStateDataCopyWith<FirstStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirstStateDataCopyWith<$Res> {
  factory $FirstStateDataCopyWith(
          FirstStateData value, $Res Function(FirstStateData) then) =
      _$FirstStateDataCopyWithImpl<$Res, FirstStateData>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$FirstStateDataCopyWithImpl<$Res, $Val extends FirstStateData>
    implements $FirstStateDataCopyWith<$Res> {
  _$FirstStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirstStateDataImplCopyWith<$Res>
    implements $FirstStateDataCopyWith<$Res> {
  factory _$$FirstStateDataImplCopyWith(_$FirstStateDataImpl value,
          $Res Function(_$FirstStateDataImpl) then) =
      __$$FirstStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$FirstStateDataImplCopyWithImpl<$Res>
    extends _$FirstStateDataCopyWithImpl<$Res, _$FirstStateDataImpl>
    implements _$$FirstStateDataImplCopyWith<$Res> {
  __$$FirstStateDataImplCopyWithImpl(
      _$FirstStateDataImpl _value, $Res Function(_$FirstStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$FirstStateDataImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FirstStateDataImpl implements _FirstStateData {
  _$FirstStateDataImpl({this.counter = 0});

  @override
  @JsonKey()
  final int counter;

  @override
  String toString() {
    return 'FirstStateData(counter: $counter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstStateDataImpl &&
            (identical(other.counter, counter) || other.counter == counter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstStateDataImplCopyWith<_$FirstStateDataImpl> get copyWith =>
      __$$FirstStateDataImplCopyWithImpl<_$FirstStateDataImpl>(
          this, _$identity);
}

abstract class _FirstStateData implements FirstStateData {
  factory _FirstStateData({final int counter}) = _$FirstStateDataImpl;

  @override
  int get counter;
  @override
  @JsonKey(ignore: true)
  _$$FirstStateDataImplCopyWith<_$FirstStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
