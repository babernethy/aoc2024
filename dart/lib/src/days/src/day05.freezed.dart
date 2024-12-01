// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day05.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoveInstruction {
  int get move => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoveInstructionCopyWith<MoveInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoveInstructionCopyWith<$Res> {
  factory $MoveInstructionCopyWith(
          MoveInstruction value, $Res Function(MoveInstruction) then) =
      _$MoveInstructionCopyWithImpl<$Res, MoveInstruction>;
  @useResult
  $Res call({int move, int from, int to});
}

/// @nodoc
class _$MoveInstructionCopyWithImpl<$Res, $Val extends MoveInstruction>
    implements $MoveInstructionCopyWith<$Res> {
  _$MoveInstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? move = null,
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_value.copyWith(
      move: null == move
          ? _value.move
          : move // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoveInstructionCopyWith<$Res>
    implements $MoveInstructionCopyWith<$Res> {
  factory _$$_MoveInstructionCopyWith(
          _$_MoveInstruction value, $Res Function(_$_MoveInstruction) then) =
      __$$_MoveInstructionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int move, int from, int to});
}

/// @nodoc
class __$$_MoveInstructionCopyWithImpl<$Res>
    extends _$MoveInstructionCopyWithImpl<$Res, _$_MoveInstruction>
    implements _$$_MoveInstructionCopyWith<$Res> {
  __$$_MoveInstructionCopyWithImpl(
      _$_MoveInstruction _value, $Res Function(_$_MoveInstruction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? move = null,
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_$_MoveInstruction(
      move: null == move
          ? _value.move
          : move // ignore: cast_nullable_to_non_nullable
              as int,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MoveInstruction
    with DiagnosticableTreeMixin
    implements _MoveInstruction {
  _$_MoveInstruction(
      {required this.move, required this.from, required this.to});

  @override
  final int move;
  @override
  final int from;
  @override
  final int to;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoveInstruction(move: $move, from: $from, to: $to)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MoveInstruction'))
      ..add(DiagnosticsProperty('move', move))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoveInstruction &&
            (identical(other.move, move) || other.move == move) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, move, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoveInstructionCopyWith<_$_MoveInstruction> get copyWith =>
      __$$_MoveInstructionCopyWithImpl<_$_MoveInstruction>(this, _$identity);
}

abstract class _MoveInstruction implements MoveInstruction {
  factory _MoveInstruction(
      {required final int move,
      required final int from,
      required final int to}) = _$_MoveInstruction;

  @override
  int get move;
  @override
  int get from;
  @override
  int get to;
  @override
  @JsonKey(ignore: true)
  _$$_MoveInstructionCopyWith<_$_MoveInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}
