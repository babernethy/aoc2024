// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aoc_scores.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AocScores _$AocScoresFromJson(Map<String, dynamic> json) {
  return _AocScores.fromJson(json);
}

/// @nodoc
mixin _$AocScores {
  @JsonKey(name: "event")
  String get event => throw _privateConstructorUsedError;
  @JsonKey(name: "members")
  Map<String, Member> get members => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_id")
  int get ownerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AocScoresCopyWith<AocScores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AocScoresCopyWith<$Res> {
  factory $AocScoresCopyWith(AocScores value, $Res Function(AocScores) then) =
      _$AocScoresCopyWithImpl<$Res, AocScores>;
  @useResult
  $Res call(
      {@JsonKey(name: "event") String event,
      @JsonKey(name: "members") Map<String, Member> members,
      @JsonKey(name: "owner_id") int ownerId});
}

/// @nodoc
class _$AocScoresCopyWithImpl<$Res, $Val extends AocScores>
    implements $AocScoresCopyWith<$Res> {
  _$AocScoresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? members = null,
    Object? ownerId = null,
  }) {
    return _then(_value.copyWith(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, Member>,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AocScoresImplCopyWith<$Res>
    implements $AocScoresCopyWith<$Res> {
  factory _$$AocScoresImplCopyWith(
          _$AocScoresImpl value, $Res Function(_$AocScoresImpl) then) =
      __$$AocScoresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "event") String event,
      @JsonKey(name: "members") Map<String, Member> members,
      @JsonKey(name: "owner_id") int ownerId});
}

/// @nodoc
class __$$AocScoresImplCopyWithImpl<$Res>
    extends _$AocScoresCopyWithImpl<$Res, _$AocScoresImpl>
    implements _$$AocScoresImplCopyWith<$Res> {
  __$$AocScoresImplCopyWithImpl(
      _$AocScoresImpl _value, $Res Function(_$AocScoresImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? members = null,
    Object? ownerId = null,
  }) {
    return _then(_$AocScoresImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, Member>,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AocScoresImpl extends _AocScores {
  const _$AocScoresImpl(
      {@JsonKey(name: "event") required this.event,
      @JsonKey(name: "members") required final Map<String, Member> members,
      @JsonKey(name: "owner_id") required this.ownerId})
      : _members = members,
        super._();

  factory _$AocScoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$AocScoresImplFromJson(json);

  @override
  @JsonKey(name: "event")
  final String event;
  final Map<String, Member> _members;
  @override
  @JsonKey(name: "members")
  Map<String, Member> get members {
    if (_members is EqualUnmodifiableMapView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_members);
  }

  @override
  @JsonKey(name: "owner_id")
  final int ownerId;

  @override
  String toString() {
    return 'AocScores(event: $event, members: $members, ownerId: $ownerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AocScoresImpl &&
            (identical(other.event, event) || other.event == event) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, event,
      const DeepCollectionEquality().hash(_members), ownerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AocScoresImplCopyWith<_$AocScoresImpl> get copyWith =>
      __$$AocScoresImplCopyWithImpl<_$AocScoresImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AocScoresImplToJson(
      this,
    );
  }
}

abstract class _AocScores extends AocScores {
  const factory _AocScores(
      {@JsonKey(name: "event") required final String event,
      @JsonKey(name: "members") required final Map<String, Member> members,
      @JsonKey(name: "owner_id") required final int ownerId}) = _$AocScoresImpl;
  const _AocScores._() : super._();

  factory _AocScores.fromJson(Map<String, dynamic> json) =
      _$AocScoresImpl.fromJson;

  @override
  @JsonKey(name: "event")
  String get event;
  @override
  @JsonKey(name: "members")
  Map<String, Member> get members;
  @override
  @JsonKey(name: "owner_id")
  int get ownerId;
  @override
  @JsonKey(ignore: true)
  _$$AocScoresImplCopyWith<_$AocScoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  @JsonKey(name: "local_score")
  int get localScore => throw _privateConstructorUsedError;
  @JsonKey(name: "completion_day_level")
  Map<String, Map<String, CompletionDayLevel>> get completionDayLevel =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "global_score")
  int get globalScore => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "stars")
  int get stars => throw _privateConstructorUsedError;
  @JsonKey(name: "last_star_ts")
  int get lastStarTs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call(
      {@JsonKey(name: "local_score") int localScore,
      @JsonKey(name: "completion_day_level")
      Map<String, Map<String, CompletionDayLevel>> completionDayLevel,
      @JsonKey(name: "global_score") int globalScore,
      @JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "stars") int stars,
      @JsonKey(name: "last_star_ts") int lastStarTs});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localScore = null,
    Object? completionDayLevel = null,
    Object? globalScore = null,
    Object? id = null,
    Object? name = null,
    Object? stars = null,
    Object? lastStarTs = null,
  }) {
    return _then(_value.copyWith(
      localScore: null == localScore
          ? _value.localScore
          : localScore // ignore: cast_nullable_to_non_nullable
              as int,
      completionDayLevel: null == completionDayLevel
          ? _value.completionDayLevel
          : completionDayLevel // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, CompletionDayLevel>>,
      globalScore: null == globalScore
          ? _value.globalScore
          : globalScore // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      lastStarTs: null == lastStarTs
          ? _value.lastStarTs
          : lastStarTs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "local_score") int localScore,
      @JsonKey(name: "completion_day_level")
      Map<String, Map<String, CompletionDayLevel>> completionDayLevel,
      @JsonKey(name: "global_score") int globalScore,
      @JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "stars") int stars,
      @JsonKey(name: "last_star_ts") int lastStarTs});
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localScore = null,
    Object? completionDayLevel = null,
    Object? globalScore = null,
    Object? id = null,
    Object? name = null,
    Object? stars = null,
    Object? lastStarTs = null,
  }) {
    return _then(_$MemberImpl(
      localScore: null == localScore
          ? _value.localScore
          : localScore // ignore: cast_nullable_to_non_nullable
              as int,
      completionDayLevel: null == completionDayLevel
          ? _value._completionDayLevel
          : completionDayLevel // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, CompletionDayLevel>>,
      globalScore: null == globalScore
          ? _value.globalScore
          : globalScore // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stars: null == stars
          ? _value.stars
          : stars // ignore: cast_nullable_to_non_nullable
              as int,
      lastStarTs: null == lastStarTs
          ? _value.lastStarTs
          : lastStarTs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberImpl extends _Member {
  _$MemberImpl(
      {@JsonKey(name: "local_score") required this.localScore,
      @JsonKey(name: "completion_day_level")
      required final Map<String, Map<String, CompletionDayLevel>>
          completionDayLevel,
      @JsonKey(name: "global_score") required this.globalScore,
      @JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "stars") required this.stars,
      @JsonKey(name: "last_star_ts") required this.lastStarTs})
      : _completionDayLevel = completionDayLevel,
        super._();

  factory _$MemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberImplFromJson(json);

  @override
  @JsonKey(name: "local_score")
  final int localScore;
  final Map<String, Map<String, CompletionDayLevel>> _completionDayLevel;
  @override
  @JsonKey(name: "completion_day_level")
  Map<String, Map<String, CompletionDayLevel>> get completionDayLevel {
    if (_completionDayLevel is EqualUnmodifiableMapView)
      return _completionDayLevel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_completionDayLevel);
  }

  @override
  @JsonKey(name: "global_score")
  final int globalScore;
  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "stars")
  final int stars;
  @override
  @JsonKey(name: "last_star_ts")
  final int lastStarTs;

  @override
  String toString() {
    return 'Member(localScore: $localScore, completionDayLevel: $completionDayLevel, globalScore: $globalScore, id: $id, name: $name, stars: $stars, lastStarTs: $lastStarTs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
            (identical(other.localScore, localScore) ||
                other.localScore == localScore) &&
            const DeepCollectionEquality()
                .equals(other._completionDayLevel, _completionDayLevel) &&
            (identical(other.globalScore, globalScore) ||
                other.globalScore == globalScore) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stars, stars) || other.stars == stars) &&
            (identical(other.lastStarTs, lastStarTs) ||
                other.lastStarTs == lastStarTs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      localScore,
      const DeepCollectionEquality().hash(_completionDayLevel),
      globalScore,
      id,
      name,
      stars,
      lastStarTs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberImplToJson(
      this,
    );
  }
}

abstract class _Member extends Member {
  factory _Member(
          {@JsonKey(name: "local_score") required final int localScore,
          @JsonKey(name: "completion_day_level")
          required final Map<String, Map<String, CompletionDayLevel>>
              completionDayLevel,
          @JsonKey(name: "global_score") required final int globalScore,
          @JsonKey(name: "id") required final int id,
          @JsonKey(name: "name") required final String name,
          @JsonKey(name: "stars") required final int stars,
          @JsonKey(name: "last_star_ts") required final int lastStarTs}) =
      _$MemberImpl;
  _Member._() : super._();

  factory _Member.fromJson(Map<String, dynamic> json) = _$MemberImpl.fromJson;

  @override
  @JsonKey(name: "local_score")
  int get localScore;
  @override
  @JsonKey(name: "completion_day_level")
  Map<String, Map<String, CompletionDayLevel>> get completionDayLevel;
  @override
  @JsonKey(name: "global_score")
  int get globalScore;
  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "stars")
  int get stars;
  @override
  @JsonKey(name: "last_star_ts")
  int get lastStarTs;
  @override
  @JsonKey(ignore: true)
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CompletionDayLevel _$CompletionDayLevelFromJson(Map<String, dynamic> json) {
  return _CompletionDayLevel.fromJson(json);
}

/// @nodoc
mixin _$CompletionDayLevel {
  @JsonKey(name: "star_index")
  int get starIndex => throw _privateConstructorUsedError;
  @JsonKey(name: "get_star_ts")
  int get getStarTs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompletionDayLevelCopyWith<CompletionDayLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletionDayLevelCopyWith<$Res> {
  factory $CompletionDayLevelCopyWith(
          CompletionDayLevel value, $Res Function(CompletionDayLevel) then) =
      _$CompletionDayLevelCopyWithImpl<$Res, CompletionDayLevel>;
  @useResult
  $Res call(
      {@JsonKey(name: "star_index") int starIndex,
      @JsonKey(name: "get_star_ts") int getStarTs});
}

/// @nodoc
class _$CompletionDayLevelCopyWithImpl<$Res, $Val extends CompletionDayLevel>
    implements $CompletionDayLevelCopyWith<$Res> {
  _$CompletionDayLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? starIndex = null,
    Object? getStarTs = null,
  }) {
    return _then(_value.copyWith(
      starIndex: null == starIndex
          ? _value.starIndex
          : starIndex // ignore: cast_nullable_to_non_nullable
              as int,
      getStarTs: null == getStarTs
          ? _value.getStarTs
          : getStarTs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompletionDayLevelImplCopyWith<$Res>
    implements $CompletionDayLevelCopyWith<$Res> {
  factory _$$CompletionDayLevelImplCopyWith(_$CompletionDayLevelImpl value,
          $Res Function(_$CompletionDayLevelImpl) then) =
      __$$CompletionDayLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "star_index") int starIndex,
      @JsonKey(name: "get_star_ts") int getStarTs});
}

/// @nodoc
class __$$CompletionDayLevelImplCopyWithImpl<$Res>
    extends _$CompletionDayLevelCopyWithImpl<$Res, _$CompletionDayLevelImpl>
    implements _$$CompletionDayLevelImplCopyWith<$Res> {
  __$$CompletionDayLevelImplCopyWithImpl(_$CompletionDayLevelImpl _value,
      $Res Function(_$CompletionDayLevelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? starIndex = null,
    Object? getStarTs = null,
  }) {
    return _then(_$CompletionDayLevelImpl(
      starIndex: null == starIndex
          ? _value.starIndex
          : starIndex // ignore: cast_nullable_to_non_nullable
              as int,
      getStarTs: null == getStarTs
          ? _value.getStarTs
          : getStarTs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompletionDayLevelImpl extends _CompletionDayLevel {
  const _$CompletionDayLevelImpl(
      {@JsonKey(name: "star_index") required this.starIndex,
      @JsonKey(name: "get_star_ts") required this.getStarTs})
      : super._();

  factory _$CompletionDayLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompletionDayLevelImplFromJson(json);

  @override
  @JsonKey(name: "star_index")
  final int starIndex;
  @override
  @JsonKey(name: "get_star_ts")
  final int getStarTs;

  @override
  String toString() {
    return 'CompletionDayLevel(starIndex: $starIndex, getStarTs: $getStarTs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletionDayLevelImpl &&
            (identical(other.starIndex, starIndex) ||
                other.starIndex == starIndex) &&
            (identical(other.getStarTs, getStarTs) ||
                other.getStarTs == getStarTs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, starIndex, getStarTs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletionDayLevelImplCopyWith<_$CompletionDayLevelImpl> get copyWith =>
      __$$CompletionDayLevelImplCopyWithImpl<_$CompletionDayLevelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompletionDayLevelImplToJson(
      this,
    );
  }
}

abstract class _CompletionDayLevel extends CompletionDayLevel {
  const factory _CompletionDayLevel(
          {@JsonKey(name: "star_index") required final int starIndex,
          @JsonKey(name: "get_star_ts") required final int getStarTs}) =
      _$CompletionDayLevelImpl;
  const _CompletionDayLevel._() : super._();

  factory _CompletionDayLevel.fromJson(Map<String, dynamic> json) =
      _$CompletionDayLevelImpl.fromJson;

  @override
  @JsonKey(name: "star_index")
  int get starIndex;
  @override
  @JsonKey(name: "get_star_ts")
  int get getStarTs;
  @override
  @JsonKey(ignore: true)
  _$$CompletionDayLevelImplCopyWith<_$CompletionDayLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
