import 'package:aoc2023/app/services/app_state.dart';
import 'package:aoc2023/app/services/scores_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moment_dart/moment_dart.dart';

class ScoresScreen extends ConsumerWidget {
  const ScoresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateActions = ref.watch(appStateProvider.notifier);
    final scoresState = ref.watch(scoresStateProvider);
    final scoresStateActions = ref.watch(scoresStateProvider.notifier);
    var activities = List<MemberActivity>.from(scoresState.memberActivities);
    final distinctActivities = <String, MemberActivity>{};
    for (final activity in activities) {
      if (!distinctActivities.containsKey(activity.memberName)) {
        distinctActivities[activity.memberName] = activity;
      }
    }
    activities = distinctActivities.values.toList();
    activities.sort((a, b) => b.activityTime.compareTo(a.activityTime));

    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(150),
        title: const Text("Advent of Code Status"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // scoresStateActions.increment();
                scoresStateActions.loadAOCMemberInfo();
              },
              child: const Text('Update'),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "Latest Activity",
                          style: textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorTheme.secondary,
                          ),
                        ),
                      ),
                      for (final activity in activities)
                        MemberActivityCard(
                          memberActivity: activity,
                        ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Participants",
                            style: textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorTheme.secondary,
                            ),
                          ),
                        ),
                        for (final member in scoresState.members)
                          Text(
                            member.stars > 0
                                ? '${member.name}(${member.stars}*)'
                                : member.name,
                            style: textTheme.bodyMedium!
                                .copyWith(color: colorTheme.primary),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget to display Member Activity Card
///

class MemberActivityCard extends StatelessWidget {
  const MemberActivityCard({
    super.key,
    required this.memberActivity,
  });

  final MemberActivity memberActivity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(5),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.secondary.withAlpha(150),
        title: Text(memberActivity.memberName),
        subtitle: Text(
          'Completed Day ${memberActivity.activityDay} - Part ${memberActivity.activityPart}',
        ),
        trailing: Text(memberActivity.activityTime.toMoment().calendar()),
      ),
    );
  }
}
