import 'package:freezed_annotation/freezed_annotation.dart';

part 'aoc_scores.freezed.dart';
part 'aoc_scores.g.dart';

@freezed
class AocScores with _$AocScores {
  const factory AocScores({
    @JsonKey(name: "event") required String event,
    @JsonKey(name: "members") required Map<String, Member> members,
    @JsonKey(name: "owner_id") required int ownerId,
  }) = _AocScores;
  factory AocScores.fromJson(Map<String, dynamic> json) =>
      _$AocScoresFromJson(json);
  const AocScores._();
}

@freezed
class Member with _$Member {
  factory Member({
    @JsonKey(name: "local_score") required int localScore,
    @JsonKey(name: "completion_day_level")
    required Map<String, Map<String, CompletionDayLevel>> completionDayLevel,
    @JsonKey(name: "global_score") required int globalScore,
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "stars") required int stars,
    @JsonKey(name: "last_star_ts") required int lastStarTs,
  }) = _Member;
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  const Member._();

  DateTime get lastStarDateTime =>
      DateTime.fromMillisecondsSinceEpoch(lastStarTs * 1000);
}

@freezed
class CompletionDayLevel with _$CompletionDayLevel {
  const factory CompletionDayLevel({
    @JsonKey(name: "star_index") required int starIndex,
    @JsonKey(name: "get_star_ts") required int getStarTs,
  }) = _CompletionDayLevel;
  factory CompletionDayLevel.fromJson(Map<String, dynamic> json) =>
      _$CompletionDayLevelFromJson(json);
  const CompletionDayLevel._();

  DateTime get getStarDateTime =>
      DateTime.fromMillisecondsSinceEpoch(getStarTs * 1000);
}
