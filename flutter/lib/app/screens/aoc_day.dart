import 'package:aoc2023/app/adaptive_container.dart';
import 'package:aoc2023/app/screens/day_result.dart';
import 'package:aoc2023/src/days/base_day.dart';
import 'package:aoc2023/src/logic_results.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AocDayScreen extends ConsumerWidget {
  const AocDayScreen({super.key, required this.day, this.logic});
  final int day;
  final BaseDayLogic? logic;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmall = const AdaptiveConstraints(
      xs: true,
    ).withinAdaptiveConstraint(context);

    //final isDay14 = day == 1;

    // if (day == 14) {
    //   (logic! as Day1Logic).addListener(() {
    //     debugPrint("Day 14 listener called");
    //   });
    // }

    final dayResults = ref.read(logicResultsProvider);
    return SafeArea(
      child: Stack(
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
            backgroundColor: Colors.black.withAlpha(150),
            // backgroundColor: const Color(0xFF0f0f23),
            appBar: AppBar(
              title: Text(
                'AoC 23 - Day $day - ${logic!.title}',
                style: const TextStyle(
                  color: Color(0xffcccccc),
                  fontWeight: FontWeight.w100,
                ),
              ),
              backgroundColor: const Color(0xFF0f0f23),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => {context.pop()},
              ),
            ),
            body: isSmall
                ? SingleChildScrollView(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: DayImage(logic: logic),
                        ),
                        DayResults(
                          results: dayResults.results?[day],
                          logic: logic,
                        ),
                      ],
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DayImage(logic: logic),
                      DayResults(
                        results: dayResults.results?[day],
                        logic: logic,
                      ),
                      // if (isDay14)
                      //   Container(
                      //     //  color: Colors.lightGreenAccent.withAlpha(50),
                      //     child: CustomPaint(
                      //       size: const Size(200, 500),
                      //       painter: SpacePainter(
                      //         dayResults.results![day]!.partOneResult.extra!
                      //             as Set<Point>,
                      //       ),
                      //     ),
                      //   )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class DayResults extends StatelessWidget {
  const DayResults({
    this.logic,
    this.results,
    super.key,
  });

  final BaseDayLogic? logic;
  final DaysResults? results;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 40,
        ),
        if (results?.partOneResult != null)
          DayResultDisplay(partTitle: 'Part 1', data: results!.partOneResult),
        if (results?.partOneResult == null)
          DayResultDisplayFuture('Part 1', logic!.processPartOne()),
        const SizedBox(
          height: 20,
        ),
        if (results?.partOneResult != null)
          DayResultDisplay(partTitle: 'Part 2', data: results!.partTwoResult),
        if (results?.partOneResult == null)
          DayResultDisplayFuture('Part 2', logic!.processPartTwo()),
      ],
    );
  }
}

class DayImage extends StatelessWidget {
  const DayImage({
    super.key,
    required this.logic,
  });

  final BaseDayLogic? logic;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.lightGreen,
            blurRadius: 6.0,
            spreadRadius: 5.0,
            offset: Offset(
              0.0,
              3.0,
            ),
          ),
        ],
      ),
      child: logic!.dayImage(),
    );
  }
}
