import 'package:aoc2023/scoreboard/models/aoc_scores.dart';
import 'package:aoc2023/scoreboard/services/aoc_scores_repo.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'scores_state.freezed.dart';
part 'scores_state.g.dart';

@freezed
class ScoresStateData with _$ScoresStateData {
  factory ScoresStateData({
    @Default(0) int counter,
    @Default([]) List<Member> members,
    @Default([]) List<MemberActivity> memberActivities,
    // @Default([]) List<types.Message> messages,
  }) = _ScoresStateData;
}

@freezed
class MemberActivity with _$MemberActivity {
  factory MemberActivity({
    required String memberName,
    required DateTime activityTime,
    required int activityDay,
    required int activityPart,
  }) = _MemberActivity;
}

@riverpod
class ScoresState extends _$ScoresState {
  ScoresStateData? _cachedState;

  @override
  ScoresStateData build() {
    return _cachedState ?? ScoresStateData();
  }

  void increment() {
    _cachedState = state.copyWith(counter: state.counter + 1);
    state = _cachedState!;
  }

  void loadAOCMemberInfo() {
    final aocRepo = ref.read(getAocScoresRepoProvider);
    aocRepo.getAocScoress().then((value) {
      value.sort((a, b) => a.name.compareTo(b.name));
      final memberActivities = <MemberActivity>[];
      for (final member in value) {
        for (final day in member.completionDayLevel.keys) {
          for (final part in member.completionDayLevel[day]!.keys) {
            final activity = MemberActivity(
              memberName: member.name,
              activityTime:
                  member.completionDayLevel[day]![part]!.getStarDateTime,
              activityDay: int.parse(day),
              activityPart: int.parse(part),
            );
            memberActivities.add(activity);
          }
        }
      }
      memberActivities.sort((a, b) => b.activityTime.compareTo(a.activityTime));

      _cachedState = state.copyWith(
        members: value,
        memberActivities: memberActivities,
      );
      state = _cachedState!;
    });
  }
}
