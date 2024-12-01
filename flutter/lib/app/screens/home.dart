import 'package:aoc2023/src/days/logic_collection.dart';
import 'package:aoc2023/src/logic_results.dart';
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
              image: AssetImage('assets/images/snow_background.jpg'),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              title,
              style: const TextStyle(
                color: Color(0xffcccccc),
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          body: daysList(context, ref),
        ),
      ],
    );
  }
}

Widget daysList(BuildContext context, WidgetRef ref) {
  final logic = ref.read(logicCollectionProvider);
  final dayResults = ref.watch(logicResultsProvider);
  final colorTheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;
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
        backgroundColor: colorTheme.secondary,
      ),
      onPressed: () {
        context.push('/scores');
        // if (dayResults.isEmpty) {
        //   dayResultsActions.initialize();
        // }
      },
      child: Text(
        "Scores",
        style: textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: colorTheme.onSecondary,
        ),
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
      ),
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: () {
        if (isEnabled) {
          context.push(pageName);
        }
      },
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    ),
  );
}
