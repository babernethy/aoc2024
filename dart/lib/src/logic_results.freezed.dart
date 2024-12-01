// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logic_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DaysResults {
  DayResult get partOneResult => throw _privateConstructorUsedError;
  DayResult get partTwoResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DaysResultsCopyWith<DaysResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaysResultsCopyWith<$Res> {
  factory $DaysResultsCopyWith(
          DaysResults value, $Res Function(DaysResults) then) =
      _$DaysResultsCopyWithImpl<$Res, DaysResults>;
  @useResult
  $Res call({DayResult partOneResult, DayResult partTwoResult});

  $DayResultCopyWith<$Res> get partOneResult;
  $DayResultCopyWith<$Res> get partTwoResult;
}

/// @nodoc
class _$DaysResultsCopyWithImpl<$Res, $Val extends DaysResults>
    implements $DaysResultsCopyWith<$Res> {
  _$DaysResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partOneResult = null,
    Object? partTwoResult = null,
  }) {
    return _then(_value.copyWith(
      partOneResult: null == partOneResult
          ? _value.partOneResult
          : partOneResult // ignore: cast_nullable_to_non_nullable
              as DayResult,
      partTwoResult: null == partTwoResult
          ? _value.partTwoResult
          : partTwoResult // ignore: cast_nullable_to_non_nullable
              as DayResult,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DayResultCopyWith<$Res> get partOneResult {
    return $DayResultCopyWith<$Res>(_value.partOneResult, (value) {
      return _then(_value.copyWith(partOneResult: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DayResultCopyWith<$Res> get partTwoResult {
    return $DayResultCopyWith<$Res>(_value.partTwoResult, (value) {
      return _then(_value.copyWith(partTwoResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DaysResultsCopyWith<$Res>
    implements $DaysResultsCopyWith<$Res> {
  factory _$$_DaysResultsCopyWith(
          _$_DaysResults value, $Res Function(_$_DaysResults) then) =
      __$$_DaysResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DayResult partOneResult, DayResult partTwoResult});

  @override
  $DayResultCopyWith<$Res> get partOneResult;
  @override
  $DayResultCopyWith<$Res> get partTwoResult;
}

/// @nodoc
class __$$_DaysResultsCopyWithImpl<$Res>
    extends _$DaysResultsCopyWithImpl<$Res, _$_DaysResults>
    implements _$$_DaysResultsCopyWith<$Res> {
  __$$_DaysResultsCopyWithImpl(
      _$_DaysResults _value, $Res Function(_$_DaysResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partOneResult = null,
    Object? partTwoResult = null,
  }) {
    return _then(_$_DaysResults(
      partOneResult: null == partOneResult
          ? _value.partOneResult
          : partOneResult // ignore: cast_nullable_to_non_nullable
              as DayResult,
      partTwoResult: null == partTwoResult
          ? _value.partTwoResult
          : partTwoResult // ignore: cast_nullable_to_non_nullable
              as DayResult,
    ));
  }
}

/// @nodoc

class _$_DaysResults implements _DaysResults {
  _$_DaysResults({required this.partOneResult, required this.partTwoResult});

  @override
  final DayResult partOneResult;
  @override
  final DayResult partTwoResult;

  @override
  String toString() {
    return 'DaysResults(partOneResult: $partOneResult, partTwoResult: $partTwoResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DaysResults &&
            (identical(other.partOneResult, partOneResult) ||
                other.partOneResult == partOneResult) &&
            (identical(other.partTwoResult, partTwoResult) ||
                other.partTwoResult == partTwoResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partOneResult, partTwoResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DaysResultsCopyWith<_$_DaysResults> get copyWith =>
      __$$_DaysResultsCopyWithImpl<_$_DaysResults>(this, _$identity);
}

abstract class _DaysResults implements DaysResults {
  factory _DaysResults(
      {required final DayResult partOneResult,
      required final DayResult partTwoResult}) = _$_DaysResults;

  @override
  DayResult get partOneResult;
  @override
  DayResult get partTwoResult;
  @override
  @JsonKey(ignore: true)
  _$$_DaysResultsCopyWith<_$_DaysResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalcDaysResults {
  Map<int, DaysResults>? get results => throw _privateConstructorUsedError;
  bool get isInitialized => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalcDaysResultsCopyWith<CalcDaysResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalcDaysResultsCopyWith<$Res> {
  factory $CalcDaysResultsCopyWith(
          CalcDaysResults value, $Res Function(CalcDaysResults) then) =
      _$CalcDaysResultsCopyWithImpl<$Res, CalcDaysResults>;
  @useResult
  $Res call({Map<int, DaysResults>? results, bool isInitialized});
}

/// @nodoc
class _$CalcDaysResultsCopyWithImpl<$Res, $Val extends CalcDaysResults>
    implements $CalcDaysResultsCopyWith<$Res> {
  _$CalcDaysResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? isInitialized = null,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<int, DaysResults>?,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalcDaysResultsCopyWith<$Res>
    implements $CalcDaysResultsCopyWith<$Res> {
  factory _$$_CalcDaysResultsCopyWith(
          _$_CalcDaysResults value, $Res Function(_$_CalcDaysResults) then) =
      __$$_CalcDaysResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, DaysResults>? results, bool isInitialized});
}

/// @nodoc
class __$$_CalcDaysResultsCopyWithImpl<$Res>
    extends _$CalcDaysResultsCopyWithImpl<$Res, _$_CalcDaysResults>
    implements _$$_CalcDaysResultsCopyWith<$Res> {
  __$$_CalcDaysResultsCopyWithImpl(
      _$_CalcDaysResults _value, $Res Function(_$_CalcDaysResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? isInitialized = null,
  }) {
    return _then(_$_CalcDaysResults(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as Map<int, DaysResults>?,
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CalcDaysResults implements _CalcDaysResults {
  _$_CalcDaysResults(
      {final Map<int, DaysResults>? results, this.isInitialized = false})
      : _results = results;

  final Map<int, DaysResults>? _results;
  @override
  Map<int, DaysResults>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableMapView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isInitialized;

  @override
  String toString() {
    return 'CalcDaysResults(results: $results, isInitialized: $isInitialized)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalcDaysResults &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_results), isInitialized);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalcDaysResultsCopyWith<_$_CalcDaysResults> get copyWith =>
      __$$_CalcDaysResultsCopyWithImpl<_$_CalcDaysResults>(this, _$identity);
}

abstract class _CalcDaysResults implements CalcDaysResults {
  factory _CalcDaysResults(
      {final Map<int, DaysResults>? results,
      final bool isInitialized}) = _$_CalcDaysResults;

  @override
  Map<int, DaysResults>? get results;
  @override
  bool get isInitialized;
  @override
  @JsonKey(ignore: true)
  _$$_CalcDaysResultsCopyWith<_$_CalcDaysResults> get copyWith =>
      throw _privateConstructorUsedError;
}
