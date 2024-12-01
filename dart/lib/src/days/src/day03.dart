import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';

class Day03Logic extends BaseDayLogic {
  String input;

  Day03Logic(super.dayNumber, super.title)
      : input = """
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw""";

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
    final data = input.split('\n').map((line) {
      final length = line.length ~/ 2;
      return {
        line.substring(0, length),
        line.substring(length),
      }
          .map((e) => e.split(''))
          .reduce(
            (a, b) => a
                .toSet()
                .where((element) => b.toSet().contains(element))
                .toList(),
          )
          .map((e) => priority(e[0]))
          .reduce((a, b) => a + b);
    }).reduce((a, b) => a + b);

    // debugPrint(data.toString());

    return PartResult(result: data.toString());
  }

  @override
  Future<PartResult> partTwo() async {
    input = await loadDayFileString();
    final data = input.split('\n');
    //borrowed from Google, need to figure out why this works.
    final solution = data
        .fold<List<List<String>>>(
          [[]],
          (a, b) => a.last.length == 3
              ? [
                  ...a,
                  [b]
                ]
              : [
                  ...a.sublist(0, a.length - 1),
                  a.last + [b]
                ],
        )
        // Get the common letters in each group.
        .map(
          (g) => g
              .map((v) => v.split("").toSet())
              .reduce((a, b) => a.intersection(b))
              .toList(),
        )
        // Combine the letters into a list
        .reduce((a, b) => [...a, ...b])
        // Get the priorities, then sum.
        .fold(0, (a, b) => a + priority(b));

    return PartResult(result: solution.toString());
  }
}
