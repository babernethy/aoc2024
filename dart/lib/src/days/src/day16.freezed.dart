// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day16.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MagmaValve {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  List<String> get tunnelsTo => throw _privateConstructorUsedError;
  set tunnelsTo(List<String> value) => throw _privateConstructorUsedError;
  int get flowRate => throw _privateConstructorUsedError;
  set flowRate(int value) => throw _privateConstructorUsedError;
  Map<String, int> get shortestPath => throw _privateConstructorUsedError;
  set shortestPath(Map<String, int> value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MagmaValveCopyWith<MagmaValve> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MagmaValveCopyWith<$Res> {
  factory $MagmaValveCopyWith(
          MagmaValve value, $Res Function(MagmaValve) then) =
      _$MagmaValveCopyWithImpl<$Res, MagmaValve>;
  @useResult
  $Res call(
      {String name,
      List<String> tunnelsTo,
      int flowRate,
      Map<String, int> shortestPath});
}

/// @nodoc
class _$MagmaValveCopyWithImpl<$Res, $Val extends MagmaValve>
    implements $MagmaValveCopyWith<$Res> {
  _$MagmaValveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? tunnelsTo = null,
    Object? flowRate = null,
    Object? shortestPath = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tunnelsTo: null == tunnelsTo
          ? _value.tunnelsTo
          : tunnelsTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      flowRate: null == flowRate
          ? _value.flowRate
          : flowRate // ignore: cast_nullable_to_non_nullable
              as int,
      shortestPath: null == shortestPath
          ? _value.shortestPath
          : shortestPath // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MagmaValveCopyWith<$Res>
    implements $MagmaValveCopyWith<$Res> {
  factory _$$_MagmaValveCopyWith(
          _$_MagmaValve value, $Res Function(_$_MagmaValve) then) =
      __$$_MagmaValveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<String> tunnelsTo,
      int flowRate,
      Map<String, int> shortestPath});
}

/// @nodoc
class __$$_MagmaValveCopyWithImpl<$Res>
    extends _$MagmaValveCopyWithImpl<$Res, _$_MagmaValve>
    implements _$$_MagmaValveCopyWith<$Res> {
  __$$_MagmaValveCopyWithImpl(
      _$_MagmaValve _value, $Res Function(_$_MagmaValve) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? tunnelsTo = null,
    Object? flowRate = null,
    Object? shortestPath = null,
  }) {
    return _then(_$_MagmaValve(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tunnelsTo: null == tunnelsTo
          ? _value.tunnelsTo
          : tunnelsTo // ignore: cast_nullable_to_non_nullable
              as List<String>,
      flowRate: null == flowRate
          ? _value.flowRate
          : flowRate // ignore: cast_nullable_to_non_nullable
              as int,
      shortestPath: null == shortestPath
          ? _value.shortestPath
          : shortestPath // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class _$_MagmaValve with DiagnosticableTreeMixin implements _MagmaValve {
  _$_MagmaValve(
      {required this.name,
      required this.tunnelsTo,
      required this.flowRate,
      required this.shortestPath});

  @override
  String name;
  @override
  List<String> tunnelsTo;
  @override
  int flowRate;
  @override
  Map<String, int> shortestPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MagmaValve(name: $name, tunnelsTo: $tunnelsTo, flowRate: $flowRate, shortestPath: $shortestPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MagmaValve'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('tunnelsTo', tunnelsTo))
      ..add(DiagnosticsProperty('flowRate', flowRate))
      ..add(DiagnosticsProperty('shortestPath', shortestPath));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MagmaValveCopyWith<_$_MagmaValve> get copyWith =>
      __$$_MagmaValveCopyWithImpl<_$_MagmaValve>(this, _$identity);
}

abstract class _MagmaValve implements MagmaValve {
  factory _MagmaValve(
      {required String name,
      required List<String> tunnelsTo,
      required int flowRate,
      required Map<String, int> shortestPath}) = _$_MagmaValve;

  @override
  String get name;
  set name(String value);
  @override
  List<String> get tunnelsTo;
  set tunnelsTo(List<String> value);
  @override
  int get flowRate;
  set flowRate(int value);
  @override
  Map<String, int> get shortestPath;
  set shortestPath(Map<String, int> value);
  @override
  @JsonKey(ignore: true)
  _$$_MagmaValveCopyWith<_$_MagmaValve> get copyWith =>
      throw _privateConstructorUsedError;
}
