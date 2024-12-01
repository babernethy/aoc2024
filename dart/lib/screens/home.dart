import 'package:aoc2022/src/days/logic_collection.dart';
import 'package:aoc2022/src/logic_results.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              repeat: ImageRepeat.repeat,
              //alignment: Alignment(-.2, 0),
              image: AssetImage('assets/images/jungle_background.png'),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(title),
          ),
          body: daysList(context, ref),
        )
      ],
    );
  }
}

Widget daysList(BuildContext context, WidgetRef ref) {
  final logic = ref.read(logicCollectionProvider);
  final dayResults = ref.watch(logicResultsProvider);

  final List<Widget> dayWidgets = List.filled(26, Container());
  for (var day = 1; day <= 25; day++) {
    dayWidgets[day - 1] =
        dayButton(day, '/day/$day', context, isEnabled: logic.containsKey(day));
  }
  final initializeButton = Container(
    margin: const EdgeInsets.all(10.0),
    width: 240.0,
    height: 68.0,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: dayResults.isInitialized ? Colors.grey : Colors.blue,
      ),
      onPressed: () {
        // if (dayResults.isEmpty) {
        //   dayResultsActions.initialize();
        // }
      },
      child: Text(
        dayResults.isInitialized ? "Initialized" : "Initialize",
        style: const TextStyle(fontSize: 25),
      ),
    ),
  );
  dayWidgets[25] = initializeButton;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: dayWidgets,
          ),
        ),
      )
    ],
  );
}

Widget dayButton(
  int number,
  String pageName,
  BuildContext context, {
  bool isEnabled = true,
}) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    width: 68.0,
    height: 68.0,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.green : Colors.red,
      ),
      onPressed: () {
        if (isEnabled) {
          context.push(pageName);
        }
      },
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 25),
      ),
    ),
  );
}
