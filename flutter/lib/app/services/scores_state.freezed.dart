// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scores_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScoresStateData {
  int get counter => throw _privateConstructorUsedError;
  List<Member> get members => throw _privateConstructorUsedError;
  List<MemberActivity> get memberActivities =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScoresStateDataCopyWith<ScoresStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoresStateDataCopyWith<$Res> {
  factory $ScoresStateDataCopyWith(
          ScoresStateData value, $Res Function(ScoresStateData) then) =
      _$ScoresStateDataCopyWithImpl<$Res, ScoresStateData>;
  @useResult
  $Res call(
      {int counter,
      List<Member> members,
      List<MemberActivity> memberActivities});
}

/// @nodoc
class _$ScoresStateDataCopyWithImpl<$Res, $Val extends ScoresStateData>
    implements $ScoresStateDataCopyWith<$Res> {
  _$ScoresStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? members = null,
    Object? memberActivities = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
      memberActivities: null == memberActivities
          ? _value.memberActivities
          : memberActivities // ignore: cast_nullable_to_non_nullable
              as List<MemberActivity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoresStateDataImplCopyWith<$Res>
    implements $ScoresStateDataCopyWith<$Res> {
  factory _$$ScoresStateDataImplCopyWith(_$ScoresStateDataImpl value,
          $Res Function(_$ScoresStateDataImpl) then) =
      __$$ScoresStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int counter,
      List<Member> members,
      List<MemberActivity> memberActivities});
}

/// @nodoc
class __$$ScoresStateDataImplCopyWithImpl<$Res>
    extends _$ScoresStateDataCopyWithImpl<$Res, _$ScoresStateDataImpl>
    implements _$$ScoresStateDataImplCopyWith<$Res> {
  __$$ScoresStateDataImplCopyWithImpl(
      _$ScoresStateDataImpl _value, $Res Function(_$ScoresStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? members = null,
    Object? memberActivities = null,
  }) {
    return _then(_$ScoresStateDataImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Member>,
      memberActivities: null == memberActivities
          ? _value._memberActivities
          : memberActivities // ignore: cast_nullable_to_non_nullable
              as List<MemberActivity>,
    ));
  }
}

/// @nodoc

class _$ScoresStateDataImpl implements _ScoresStateData {
  _$ScoresStateDataImpl(
      {this.counter = 0,
      final List<Member> members = const [],
      final List<MemberActivity> memberActivities = const []})
      : _members = members,
        _memberActivities = memberActivities;

  @override
  @JsonKey()
  final int counter;
  final List<Member> _members;
  @override
  @JsonKey()
  List<Member> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<MemberActivity> _memberActivities;
  @override
  @JsonKey()
  List<MemberActivity> get memberActivities {
    if (_memberActivities is EqualUnmodifiableListView)
      return _memberActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberActivities);
  }

  @override
  String toString() {
    return 'ScoresStateData(counter: $counter, members: $members, memberActivities: $memberActivities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoresStateDataImpl &&
            (identical(other.counter, counter) || other.counter == counter) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._memberActivities, _memberActivities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      counter,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_memberActivities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoresStateDataImplCopyWith<_$ScoresStateDataImpl> get copyWith =>
      __$$ScoresStateDataImplCopyWithImpl<_$ScoresStateDataImpl>(
          this, _$identity);
}

abstract class _ScoresStateData implements ScoresStateData {
  factory _ScoresStateData(
      {final int counter,
      final List<Member> members,
      final List<MemberActivity> memberActivities}) = _$ScoresStateDataImpl;

  @override
  int get counter;
  @override
  List<Member> get members;
  @override
  List<MemberActivity> get memberActivities;
  @override
  @JsonKey(ignore: true)
  _$$ScoresStateDataImplCopyWith<_$ScoresStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MemberActivity {
  String get memberName => throw _privateConstructorUsedError;
  DateTime get activityTime => throw _privateConstructorUsedError;
  int get activityDay => throw _privateConstructorUsedError;
  int get activityPart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemberActivityCopyWith<MemberActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberActivityCopyWith<$Res> {
  factory $MemberActivityCopyWith(
          MemberActivity value, $Res Function(MemberActivity) then) =
      _$MemberActivityCopyWithImpl<$Res, MemberActivity>;
  @useResult
  $Res call(
      {String memberName,
      DateTime activityTime,
      int activityDay,
      int activityPart});
}

/// @nodoc
class _$MemberActivityCopyWithImpl<$Res, $Val extends MemberActivity>
    implements $MemberActivityCopyWith<$Res> {
  _$MemberActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberName = null,
    Object? activityTime = null,
    Object? activityDay = null,
    Object? activityPart = null,
  }) {
    return _then(_value.copyWith(
      memberName: null == memberName
          ? _value.memberName
          : memberName // ignore: cast_nullable_to_non_nullable
              as String,
      activityTime: null == activityTime
          ? _value.activityTime
          : activityTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activityDay: null == activityDay
          ? _value.activityDay
          : activityDay // ignore: cast_nullable_to_non_nullable
              as int,
      activityPart: null == activityPart
          ? _value.activityPart
          : activityPart // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberActivityImplCopyWith<$Res>
    implements $MemberActivityCopyWith<$Res> {
  factory _$$MemberActivityImplCopyWith(_$MemberActivityImpl value,
          $Res Function(_$MemberActivityImpl) then) =
      __$$MemberActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String memberName,
      DateTime activityTime,
      int activityDay,
      int activityPart});
}

/// @nodoc
class __$$MemberActivityImplCopyWithImpl<$Res>
    extends _$MemberActivityCopyWithImpl<$Res, _$MemberActivityImpl>
    implements _$$MemberActivityImplCopyWith<$Res> {
  __$$MemberActivityImplCopyWithImpl(
      _$MemberActivityImpl _value, $Res Function(_$MemberActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberName = null,
    Object? activityTime = null,
    Object? activityDay = null,
    Object? activityPart = null,
  }) {
    return _then(_$MemberActivityImpl(
      memberName: null == memberName
          ? _value.memberName
          : memberName // ignore: cast_nullable_to_non_nullable
              as String,
      activityTime: null == activityTime
          ? _value.activityTime
          : activityTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      activityDay: null == activityDay
          ? _value.activityDay
          : activityDay // ignore: cast_nullable_to_non_nullable
              as int,
      activityPart: null == activityPart
          ? _value.activityPart
          : activityPart // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MemberActivityImpl implements _MemberActivity {
  _$MemberActivityImpl(
      {required this.memberName,
      required this.activityTime,
      required this.activityDay,
      required this.activityPart});

  @override
  final String memberName;
  @override
  final DateTime activityTime;
  @override
  final int activityDay;
  @override
  final int activityPart;

  @override
  String toString() {
    return 'MemberActivity(memberName: $memberName, activityTime: $activityTime, activityDay: $activityDay, activityPart: $activityPart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberActivityImpl &&
            (identical(other.memberName, memberName) ||
                other.memberName == memberName) &&
            (identical(other.activityTime, activityTime) ||
                other.activityTime == activityTime) &&
            (identical(other.activityDay, activityDay) ||
                other.activityDay == activityDay) &&
            (identical(other.activityPart, activityPart) ||
                other.activityPart == activityPart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, memberName, activityTime, activityDay, activityPart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberActivityImplCopyWith<_$MemberActivityImpl> get copyWith =>
      __$$MemberActivityImplCopyWithImpl<_$MemberActivityImpl>(
          this, _$identity);
}

abstract class _MemberActivity implements MemberActivity {
  factory _MemberActivity(
      {required final String memberName,
      required final DateTime activityTime,
      required final int activityDay,
      required final int activityPart}) = _$MemberActivityImpl;

  @override
  String get memberName;
  @override
  DateTime get activityTime;
  @override
  int get activityDay;
  @override
  int get activityPart;
  @override
  @JsonKey(ignore: true)
  _$$MemberActivityImplCopyWith<_$MemberActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
