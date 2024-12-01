// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day13.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Packet {
  String? get left => throw _privateConstructorUsedError;
  set left(String? value) => throw _privateConstructorUsedError;
  String? get right => throw _privateConstructorUsedError;
  set right(String? value) => throw _privateConstructorUsedError;
  String? get leftMatch => throw _privateConstructorUsedError;
  set leftMatch(String? value) => throw _privateConstructorUsedError;
  String? get rightMatch => throw _privateConstructorUsedError;
  set rightMatch(String? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PacketCopyWith<Packet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PacketCopyWith<$Res> {
  factory $PacketCopyWith(Packet value, $Res Function(Packet) then) =
      _$PacketCopyWithImpl<$Res, Packet>;
  @useResult
  $Res call(
      {String? left, String? right, String? leftMatch, String? rightMatch});
}

/// @nodoc
class _$PacketCopyWithImpl<$Res, $Val extends Packet>
    implements $PacketCopyWith<$Res> {
  _$PacketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = freezed,
    Object? right = freezed,
    Object? leftMatch = freezed,
    Object? rightMatch = freezed,
  }) {
    return _then(_value.copyWith(
      left: freezed == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as String?,
      right: freezed == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as String?,
      leftMatch: freezed == leftMatch
          ? _value.leftMatch
          : leftMatch // ignore: cast_nullable_to_non_nullable
              as String?,
      rightMatch: freezed == rightMatch
          ? _value.rightMatch
          : rightMatch // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PacketCopyWith<$Res> implements $PacketCopyWith<$Res> {
  factory _$$_PacketCopyWith(_$_Packet value, $Res Function(_$_Packet) then) =
      __$$_PacketCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? left, String? right, String? leftMatch, String? rightMatch});
}

/// @nodoc
class __$$_PacketCopyWithImpl<$Res>
    extends _$PacketCopyWithImpl<$Res, _$_Packet>
    implements _$$_PacketCopyWith<$Res> {
  __$$_PacketCopyWithImpl(_$_Packet _value, $Res Function(_$_Packet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = freezed,
    Object? right = freezed,
    Object? leftMatch = freezed,
    Object? rightMatch = freezed,
  }) {
    return _then(_$_Packet(
      left: freezed == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as String?,
      right: freezed == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as String?,
      leftMatch: freezed == leftMatch
          ? _value.leftMatch
          : leftMatch // ignore: cast_nullable_to_non_nullable
              as String?,
      rightMatch: freezed == rightMatch
          ? _value.rightMatch
          : rightMatch // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Packet with DiagnosticableTreeMixin implements _Packet {
  _$_Packet(
      {required this.left,
      required this.right,
      this.leftMatch,
      this.rightMatch});

  @override
  String? left;
  @override
  String? right;
  @override
  String? leftMatch;
  @override
  String? rightMatch;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Packet(left: $left, right: $right, leftMatch: $leftMatch, rightMatch: $rightMatch)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Packet'))
      ..add(DiagnosticsProperty('left', left))
      ..add(DiagnosticsProperty('right', right))
      ..add(DiagnosticsProperty('leftMatch', leftMatch))
      ..add(DiagnosticsProperty('rightMatch', rightMatch));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PacketCopyWith<_$_Packet> get copyWith =>
      __$$_PacketCopyWithImpl<_$_Packet>(this, _$identity);
}

abstract class _Packet implements Packet {
  factory _Packet(
      {required String? left,
      required String? right,
      String? leftMatch,
      String? rightMatch}) = _$_Packet;

  @override
  String? get left;
  set left(String? value);
  @override
  String? get right;
  set right(String? value);
  @override
  String? get leftMatch;
  set leftMatch(String? value);
  @override
  String? get rightMatch;
  set rightMatch(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_PacketCopyWith<_$_Packet> get copyWith =>
      throw _privateConstructorUsedError;
}
