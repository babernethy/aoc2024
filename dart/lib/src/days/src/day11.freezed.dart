// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day11.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Monkey {
  int get number => throw _privateConstructorUsedError;
  List<Int64> get items => throw _privateConstructorUsedError;
  set items(List<Int64> value) => throw _privateConstructorUsedError;
  Int64 get timesInspected => throw _privateConstructorUsedError;
  set timesInspected(Int64 value) => throw _privateConstructorUsedError;
  String get operation => throw _privateConstructorUsedError;
  set operation(String value) => throw _privateConstructorUsedError;
  String get operationValue => throw _privateConstructorUsedError;
  set operationValue(String value) => throw _privateConstructorUsedError;
  int get testValue => throw _privateConstructorUsedError;
  set testValue(int value) => throw _privateConstructorUsedError;
  int get testTrue => throw _privateConstructorUsedError;
  set testTrue(int value) => throw _privateConstructorUsedError;
  int get testFalse => throw _privateConstructorUsedError;
  set testFalse(int value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonkeyCopyWith<Monkey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonkeyCopyWith<$Res> {
  factory $MonkeyCopyWith(Monkey value, $Res Function(Monkey) then) =
      _$MonkeyCopyWithImpl<$Res, Monkey>;
  @useResult
  $Res call(
      {int number,
      List<Int64> items,
      Int64 timesInspected,
      String operation,
      String operationValue,
      int testValue,
      int testTrue,
      int testFalse});
}

/// @nodoc
class _$MonkeyCopyWithImpl<$Res, $Val extends Monkey>
    implements $MonkeyCopyWith<$Res> {
  _$MonkeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? items = null,
    Object? timesInspected = null,
    Object? operation = null,
    Object? operationValue = null,
    Object? testValue = null,
    Object? testTrue = null,
    Object? testFalse = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Int64>,
      timesInspected: null == timesInspected
          ? _value.timesInspected
          : timesInspected // ignore: cast_nullable_to_non_nullable
              as Int64,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      operationValue: null == operationValue
          ? _value.operationValue
          : operationValue // ignore: cast_nullable_to_non_nullable
              as String,
      testValue: null == testValue
          ? _value.testValue
          : testValue // ignore: cast_nullable_to_non_nullable
              as int,
      testTrue: null == testTrue
          ? _value.testTrue
          : testTrue // ignore: cast_nullable_to_non_nullable
              as int,
      testFalse: null == testFalse
          ? _value.testFalse
          : testFalse // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MonkeyCopyWith<$Res> implements $MonkeyCopyWith<$Res> {
  factory _$$_MonkeyCopyWith(_$_Monkey value, $Res Function(_$_Monkey) then) =
      __$$_MonkeyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int number,
      List<Int64> items,
      Int64 timesInspected,
      String operation,
      String operationValue,
      int testValue,
      int testTrue,
      int testFalse});
}

/// @nodoc
class __$$_MonkeyCopyWithImpl<$Res>
    extends _$MonkeyCopyWithImpl<$Res, _$_Monkey>
    implements _$$_MonkeyCopyWith<$Res> {
  __$$_MonkeyCopyWithImpl(_$_Monkey _value, $Res Function(_$_Monkey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? items = null,
    Object? timesInspected = null,
    Object? operation = null,
    Object? operationValue = null,
    Object? testValue = null,
    Object? testTrue = null,
    Object? testFalse = null,
  }) {
    return _then(_$_Monkey(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Int64>,
      timesInspected: null == timesInspected
          ? _value.timesInspected
          : timesInspected // ignore: cast_nullable_to_non_nullable
              as Int64,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String,
      operationValue: null == operationValue
          ? _value.operationValue
          : operationValue // ignore: cast_nullable_to_non_nullable
              as String,
      testValue: null == testValue
          ? _value.testValue
          : testValue // ignore: cast_nullable_to_non_nullable
              as int,
      testTrue: null == testTrue
          ? _value.testTrue
          : testTrue // ignore: cast_nullable_to_non_nullable
              as int,
      testFalse: null == testFalse
          ? _value.testFalse
          : testFalse // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Monkey with DiagnosticableTreeMixin implements _Monkey {
  _$_Monkey(
      {required this.number,
      this.items = const [],
      this.timesInspected = Int64.ZERO,
      required this.operation,
      required this.operationValue,
      required this.testValue,
      required this.testTrue,
      required this.testFalse});

  @override
  final int number;
  @override
  @JsonKey()
  List<Int64> items;
  @override
  @JsonKey()
  Int64 timesInspected;
  @override
  String operation;
  @override
  String operationValue;
  @override
  int testValue;
  @override
  int testTrue;
  @override
  int testFalse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Monkey(number: $number, items: $items, timesInspected: $timesInspected, operation: $operation, operationValue: $operationValue, testValue: $testValue, testTrue: $testTrue, testFalse: $testFalse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Monkey'))
      ..add(DiagnosticsProperty('number', number))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('timesInspected', timesInspected))
      ..add(DiagnosticsProperty('operation', operation))
      ..add(DiagnosticsProperty('operationValue', operationValue))
      ..add(DiagnosticsProperty('testValue', testValue))
      ..add(DiagnosticsProperty('testTrue', testTrue))
      ..add(DiagnosticsProperty('testFalse', testFalse));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MonkeyCopyWith<_$_Monkey> get copyWith =>
      __$$_MonkeyCopyWithImpl<_$_Monkey>(this, _$identity);
}

abstract class _Monkey implements Monkey {
  factory _Monkey(
      {required final int number,
      List<Int64> items,
      Int64 timesInspected,
      required String operation,
      required String operationValue,
      required int testValue,
      required int testTrue,
      required int testFalse}) = _$_Monkey;

  @override
  int get number;
  @override
  List<Int64> get items;
  set items(List<Int64> value);
  @override
  Int64 get timesInspected;
  set timesInspected(Int64 value);
  @override
  String get operation;
  set operation(String value);
  @override
  String get operationValue;
  set operationValue(String value);
  @override
  int get testValue;
  set testValue(int value);
  @override
  int get testTrue;
  set testTrue(int value);
  @override
  int get testFalse;
  set testFalse(int value);
  @override
  @JsonKey(ignore: true)
  _$$_MonkeyCopyWith<_$_Monkey> get copyWith =>
      throw _privateConstructorUsedError;
}
