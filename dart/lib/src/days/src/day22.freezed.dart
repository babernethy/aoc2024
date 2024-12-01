// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day22.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NextMove {
  int get distance => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;
  String get remainingMoves => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NextMoveCopyWith<NextMove> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextMoveCopyWith<$Res> {
  factory $NextMoveCopyWith(NextMove value, $Res Function(NextMove) then) =
      _$NextMoveCopyWithImpl<$Res, NextMove>;
  @useResult
  $Res call({int distance, String direction, String remainingMoves});
}

/// @nodoc
class _$NextMoveCopyWithImpl<$Res, $Val extends NextMove>
    implements $NextMoveCopyWith<$Res> {
  _$NextMoveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? direction = null,
    Object? remainingMoves = null,
  }) {
    return _then(_value.copyWith(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      remainingMoves: null == remainingMoves
          ? _value.remainingMoves
          : remainingMoves // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NextMoveCopyWith<$Res> implements $NextMoveCopyWith<$Res> {
  factory _$$_NextMoveCopyWith(
          _$_NextMove value, $Res Function(_$_NextMove) then) =
      __$$_NextMoveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int distance, String direction, String remainingMoves});
}

/// @nodoc
class __$$_NextMoveCopyWithImpl<$Res>
    extends _$NextMoveCopyWithImpl<$Res, _$_NextMove>
    implements _$$_NextMoveCopyWith<$Res> {
  __$$_NextMoveCopyWithImpl(
      _$_NextMove _value, $Res Function(_$_NextMove) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distance = null,
    Object? direction = null,
    Object? remainingMoves = null,
  }) {
    return _then(_$_NextMove(
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      remainingMoves: null == remainingMoves
          ? _value.remainingMoves
          : remainingMoves // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NextMove with DiagnosticableTreeMixin implements _NextMove {
  _$_NextMove(
      {required this.distance,
      required this.direction,
      required this.remainingMoves});

  @override
  final int distance;
  @override
  final String direction;
  @override
  final String remainingMoves;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NextMove(distance: $distance, direction: $direction, remainingMoves: $remainingMoves)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NextMove'))
      ..add(DiagnosticsProperty('distance', distance))
      ..add(DiagnosticsProperty('direction', direction))
      ..add(DiagnosticsProperty('remainingMoves', remainingMoves));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextMove &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.remainingMoves, remainingMoves) ||
                other.remainingMoves == remainingMoves));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, distance, direction, remainingMoves);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextMoveCopyWith<_$_NextMove> get copyWith =>
      __$$_NextMoveCopyWithImpl<_$_NextMove>(this, _$identity);
}

abstract class _NextMove implements NextMove {
  factory _NextMove(
      {required final int distance,
      required final String direction,
      required final String remainingMoves}) = _$_NextMove;

  @override
  int get distance;
  @override
  String get direction;
  @override
  String get remainingMoves;
  @override
  @JsonKey(ignore: true)
  _$$_NextMoveCopyWith<_$_NextMove> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NextStep {
  int get movesLeft => throw _privateConstructorUsedError;
  Orientation get orientation => throw _privateConstructorUsedError;
  Point<num> get currentPoint => throw _privateConstructorUsedError;
  bool get hitWall => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NextStepCopyWith<NextStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextStepCopyWith<$Res> {
  factory $NextStepCopyWith(NextStep value, $Res Function(NextStep) then) =
      _$NextStepCopyWithImpl<$Res, NextStep>;
  @useResult
  $Res call(
      {int movesLeft,
      Orientation orientation,
      Point<num> currentPoint,
      bool hitWall});
}

/// @nodoc
class _$NextStepCopyWithImpl<$Res, $Val extends NextStep>
    implements $NextStepCopyWith<$Res> {
  _$NextStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movesLeft = null,
    Object? orientation = null,
    Object? currentPoint = null,
    Object? hitWall = null,
  }) {
    return _then(_value.copyWith(
      movesLeft: null == movesLeft
          ? _value.movesLeft
          : movesLeft // ignore: cast_nullable_to_non_nullable
              as int,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
      currentPoint: null == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as Point<num>,
      hitWall: null == hitWall
          ? _value.hitWall
          : hitWall // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NextStepCopyWith<$Res> implements $NextStepCopyWith<$Res> {
  factory _$$_NextStepCopyWith(
          _$_NextStep value, $Res Function(_$_NextStep) then) =
      __$$_NextStepCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int movesLeft,
      Orientation orientation,
      Point<num> currentPoint,
      bool hitWall});
}

/// @nodoc
class __$$_NextStepCopyWithImpl<$Res>
    extends _$NextStepCopyWithImpl<$Res, _$_NextStep>
    implements _$$_NextStepCopyWith<$Res> {
  __$$_NextStepCopyWithImpl(
      _$_NextStep _value, $Res Function(_$_NextStep) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movesLeft = null,
    Object? orientation = null,
    Object? currentPoint = null,
    Object? hitWall = null,
  }) {
    return _then(_$_NextStep(
      movesLeft: null == movesLeft
          ? _value.movesLeft
          : movesLeft // ignore: cast_nullable_to_non_nullable
              as int,
      orientation: null == orientation
          ? _value.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
      currentPoint: null == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as Point<num>,
      hitWall: null == hitWall
          ? _value.hitWall
          : hitWall // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NextStep with DiagnosticableTreeMixin implements _NextStep {
  _$_NextStep(
      {required this.movesLeft,
      required this.orientation,
      required this.currentPoint,
      required this.hitWall});

  @override
  final int movesLeft;
  @override
  final Orientation orientation;
  @override
  final Point<num> currentPoint;
  @override
  final bool hitWall;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NextStep(movesLeft: $movesLeft, orientation: $orientation, currentPoint: $currentPoint, hitWall: $hitWall)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NextStep'))
      ..add(DiagnosticsProperty('movesLeft', movesLeft))
      ..add(DiagnosticsProperty('orientation', orientation))
      ..add(DiagnosticsProperty('currentPoint', currentPoint))
      ..add(DiagnosticsProperty('hitWall', hitWall));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextStep &&
            (identical(other.movesLeft, movesLeft) ||
                other.movesLeft == movesLeft) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation) &&
            (identical(other.currentPoint, currentPoint) ||
                other.currentPoint == currentPoint) &&
            (identical(other.hitWall, hitWall) || other.hitWall == hitWall));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, movesLeft, orientation, currentPoint, hitWall);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextStepCopyWith<_$_NextStep> get copyWith =>
      __$$_NextStepCopyWithImpl<_$_NextStep>(this, _$identity);
}

abstract class _NextStep implements NextStep {
  factory _NextStep(
      {required final int movesLeft,
      required final Orientation orientation,
      required final Point<num> currentPoint,
      required final bool hitWall}) = _$_NextStep;

  @override
  int get movesLeft;
  @override
  Orientation get orientation;
  @override
  Point<num> get currentPoint;
  @override
  bool get hitWall;
  @override
  @JsonKey(ignore: true)
  _$$_NextStepCopyWith<_$_NextStep> get copyWith =>
      throw _privateConstructorUsedError;
}
