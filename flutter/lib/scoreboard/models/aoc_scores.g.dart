// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aoc_scores.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AocScoresImpl _$$AocScoresImplFromJson(Map<String, dynamic> json) =>
    _$AocScoresImpl(
      event: json['event'] as String,
      members: (json['members'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Member.fromJson(e as Map<String, dynamic>)),
      ),
      ownerId: json['owner_id'] as int,
    );

Map<String, dynamic> _$$AocScoresImplToJson(_$AocScoresImpl instance) =>
    <String, dynamic>{
      'event': instance.event,
      'members': instance.members.map((k, e) => MapEntry(k, e.toJson())),
      'owner_id': instance.ownerId,
    };

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      localScore: json['local_score'] as int,
      completionDayLevel:
          (json['completion_day_level'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  k, CompletionDayLevel.fromJson(e as Map<String, dynamic>)),
            )),
      ),
      globalScore: json['global_score'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      stars: json['stars'] as int,
      lastStarTs: json['last_star_ts'] as int,
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'local_score': instance.localScore,
      'completion_day_level': instance.completionDayLevel
          .map((k, e) => MapEntry(k, e.map((k, e) => MapEntry(k, e.toJson())))),
      'global_score': instance.globalScore,
      'id': instance.id,
      'name': instance.name,
      'stars': instance.stars,
      'last_star_ts': instance.lastStarTs,
    };

_$CompletionDayLevelImpl _$$CompletionDayLevelImplFromJson(
        Map<String, dynamic> json) =>
    _$CompletionDayLevelImpl(
      starIndex: json['star_index'] as int,
      getStarTs: json['get_star_ts'] as int,
    );

Map<String, dynamic> _$$CompletionDayLevelImplToJson(
        _$CompletionDayLevelImpl instance) =>
    <String, dynamic>{
      'star_index': instance.starIndex,
      'get_star_ts': instance.getStarTs,
    };
