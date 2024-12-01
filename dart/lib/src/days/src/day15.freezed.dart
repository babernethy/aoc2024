// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day15.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SensorBeacon {
  Point<num> get sensor => throw _privateConstructorUsedError;
  Point<num> get beacon => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SensorBeaconCopyWith<SensorBeacon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorBeaconCopyWith<$Res> {
  factory $SensorBeaconCopyWith(
          SensorBeacon value, $Res Function(SensorBeacon) then) =
      _$SensorBeaconCopyWithImpl<$Res, SensorBeacon>;
  @useResult
  $Res call({Point<num> sensor, Point<num> beacon, int distance});
}

/// @nodoc
class _$SensorBeaconCopyWithImpl<$Res, $Val extends SensorBeacon>
    implements $SensorBeaconCopyWith<$Res> {
  _$SensorBeaconCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensor = null,
    Object? beacon = null,
    Object? distance = null,
  }) {
    return _then(_value.copyWith(
      sensor: null == sensor
          ? _value.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as Point<num>,
      beacon: null == beacon
          ? _value.beacon
          : beacon // ignore: cast_nullable_to_non_nullable
              as Point<num>,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SensorBeaconCopyWith<$Res>
    implements $SensorBeaconCopyWith<$Res> {
  factory _$$_SensorBeaconCopyWith(
          _$_SensorBeacon value, $Res Function(_$_SensorBeacon) then) =
      __$$_SensorBeaconCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Point<num> sensor, Point<num> beacon, int distance});
}

/// @nodoc
class __$$_SensorBeaconCopyWithImpl<$Res>
    extends _$SensorBeaconCopyWithImpl<$Res, _$_SensorBeacon>
    implements _$$_SensorBeaconCopyWith<$Res> {
  __$$_SensorBeaconCopyWithImpl(
      _$_SensorBeacon _value, $Res Function(_$_SensorBeacon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sensor = null,
    Object? beacon = null,
    Object? distance = null,
  }) {
    return _then(_$_SensorBeacon(
      sensor: null == sensor
          ? _value.sensor
          : sensor // ignore: cast_nullable_to_non_nullable
              as Point<num>,
      beacon: null == beacon
          ? _value.beacon
          : beacon // ignore: cast_nullable_to_non_nullable
              as Point<num>,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SensorBeacon extends _SensorBeacon {
  _$_SensorBeacon(
      {required this.sensor, required this.beacon, required this.distance})
      : super._();

  @override
  final Point<num> sensor;
  @override
  final Point<num> beacon;
  @override
  final int distance;

  @override
  String toString() {
    return 'SensorBeacon(sensor: $sensor, beacon: $beacon, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SensorBeacon &&
            (identical(other.sensor, sensor) || other.sensor == sensor) &&
            (identical(other.beacon, beacon) || other.beacon == beacon) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sensor, beacon, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SensorBeaconCopyWith<_$_SensorBeacon> get copyWith =>
      __$$_SensorBeaconCopyWithImpl<_$_SensorBeacon>(this, _$identity);
}

abstract class _SensorBeacon extends SensorBeacon {
  factory _SensorBeacon(
      {required final Point<num> sensor,
      required final Point<num> beacon,
      required final int distance}) = _$_SensorBeacon;
  _SensorBeacon._() : super._();

  @override
  Point<num> get sensor;
  @override
  Point<num> get beacon;
  @override
  int get distance;
  @override
  @JsonKey(ignore: true)
  _$$_SensorBeaconCopyWith<_$_SensorBeacon> get copyWith =>
      throw _privateConstructorUsedError;
}
