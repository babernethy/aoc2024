import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';

class Day04Logic extends BaseDayLogic {
  String input;

  Day04Logic(super.dayNumber, super.title)
      : input = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8""";

  int priority(String c) {
    final int unit = c.codeUnitAt(0);
    if (64 + 1 <= unit && unit <= 64 + 26) {
      return 26 + unit - 64;
    } else if (96 + 1 <= unit && unit <= 96 + 26) {
      return unit - 96;
    } else {
      return 0;
    }
  }

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    final data = input
        .split('\n')
        .map((line) {
          final parts = line.split(',');
          return parts.map((e) {
            final range = e.split('-').map((e) => int.parse(e)).toList();
            return List<int>.generate(
              range[1] - range[0] + 1,
              (i) => i + 1 + range[0] - 1,
            ).toSet();
          }).toList();
        })
        .toList()
        .map((e) {
          final ab = e[0].intersection(e[1]).toList().length;
          final ba = (e[1].intersection(e[0])).toList().length;
          final isContained = ab == e[0].length || ba == e[1].length;
          return isContained ? 1 : 0;
        })
        .reduce((value, element) => value + element);

    //debugPrint(data.toString());

    return PartResult(result: data.toString());
  }

  @override
  Future<PartResult> partTwo() async {
    input = await loadDayFileString();
    final data = input
        .split('\n')
        .map((line) {
          final parts = line.split(',');
          return parts.map((e) {
            final range = e.split('-').map((e) => int.parse(e)).toList();
            return List<int>.generate(
              range[1] - range[0] + 1,
              (i) => i + 1 + range[0] - 1,
            ).toSet();
          }).toList();
        })
        .toList()
        .map((e) {
          final ab = e[0].intersection(e[1]).toList().length;
          final ba = (e[1].intersection(e[0])).toList().length;
          final isPartiallyContained = (ab > 0) || (ba > 0);
          return isPartiallyContained ? 1 : 0;
        })
        .reduce((value, element) => value + element);

    // debugPrint(data.toString());

    return PartResult(result: data.toString());
  }
}
