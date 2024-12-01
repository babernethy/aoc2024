import 'dart:math';

import 'package:aoc2023/src/days/base_day.dart';
import 'package:equations/equations.dart';

class Day06Logic extends BaseDayLogic {
  String input;
  final List<(int, int)> races = List.empty(growable: true);

  Future<void> initialize() async {
    final lines = input.split('\n');
    final times = findNumbers(lines[0]);
    final distances = findNumbers(lines[1]);
    for (var i = 0; i < times.length; i++) {
      races.add((times[i], distances[i]));
    }
  }

  List<int> findNumbers(String input) {
    final List<int> numbers = List.empty(growable: true);
    final matches = RegExp(r'\d+').allMatches(input);
    for (final Match m in matches) {
      final match = int.parse(m[0]!);
      numbers.add(match);
    }
    return numbers;
  }

  Day06Logic(super.dayNumber, super.title)
      : input = """
Time:      7  15   30
Distance:  9  40  200""";

  (int, int)? findRange(int a, int b, int c) {
    final d = b * b - 4 * a * c; // discriminant
    final dSqrt = sqrt(d.abs()); // square root of discriminant
    final root1 = (-b + dSqrt) / (2 * a); // first root
    final root2 = (-b - dSqrt) / (2 * a); // second root
    return (root1.floor() + 1, root2.ceil() - 1);
  }

  @override
  Future<PartResult> partOne() async {
    //input = await loadDayFileString();
    initialize();
    final List<int> ways = List.empty(growable: true);
    for (final r in races) {
      final solutions =
          findRange(-1, r.$1, 0 - r.$2); // -1t^2 + time*t - distance = 0
      final q2 = Algebraic.from(
        [
          Complex(-1, 0),
          Complex(r.$1.toDouble(), 0),
          Complex(0 - r.$2.toDouble(), 0)
        ],
      );
      final solutions2 = q2.solutions();
      if (solutions != null) {
        ways.add(solutions.$2 - solutions.$1 + 1);
      }
    }
    return PartResult(result: ways.reduce((a, b) => a * b).toString());
  }

  @override
  Future<PartResult> partTwo() async {
    //initialize();
    final lines = input.split('\n');
    final time = findNumbers(lines[0].replaceAll(' ', ''))[0];
    final distance = findNumbers(lines[1].replaceAll(' ', ''))[0];
    final solutions =
        findRange(-1, time, 0 - distance); // -1t^2 + time*t - distance = 0
    final ways = solutions!.$2 - solutions.$1 + 1;
    return PartResult(result: "$ways");
  }
}
