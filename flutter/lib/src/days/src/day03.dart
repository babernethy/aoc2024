import 'dart:math';

import 'package:aoc2023/src/days/base_day.dart';

class Day03Logic extends BaseDayLogic {
  String input;
  List<List<String>> matrix = [];
  final List<(int, Point)> partNumbers = List.empty(growable: true);

  Future<void> initialize() async {
    matrix =
        input.split('\n').map((e) => e.split('').toList().toList()).toList();
  }

  List<Point> findSymbols(List<List<String>> matrix, {String? symbol}) {
    final points = <Point>[];
    for (var y = 0; y < matrix.length; y++) {
      final row = matrix[y];
      for (var x = 0; x < row.length; x++) {
        final element = row[x];
        final val = int.tryParse(element);
        if (val == null) {
          if (symbol == null) {
            if (element != '.') {
              points.add(Point(x, y));
            }
          } else if (element == symbol) {
            points.add(Point(x, y));
          }
        }
      }
    }
    return points;
  }

  List<Point> adjacentPoints(Point p) {
    final points = <Point>[];
    points.add(Point(p.x - 1, p.y - 1));
    points.add(Point(p.x, p.y - 1));
    points.add(Point(p.x + 1, p.y - 1));
    points.add(Point(p.x - 1, p.y));
    points.add(Point(p.x + 1, p.y));
    points.add(Point(p.x - 1, p.y + 1));
    points.add(Point(p.x, p.y + 1));
    points.add(Point(p.x + 1, p.y + 1));
    return points;
  }

  Map<Point, int> findNumbers(List<String> inputLines) {
    final points = <Point, int>{};

    for (var y = 0; y < inputLines.length; y++) {
      final row = inputLines[y];
      final matches = RegExp(r'\d+').allMatches(row);
      for (final Match m in matches) {
        final match = int.parse(m[0]!);
        for (var i = m.start; i < m.end; i++) {
          points.addAll({Point(i, y): match});
        }
      }
      //  }
    }
    return points;
  }

  Day03Logic(super.dayNumber, super.title)
      : input = """
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...\$.*....
.664.598..""";

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    await initialize();
    final points = findSymbols(matrix);
    final numbers = findNumbers(input.split('\n'));
    for (final p in points) {
      final adj = adjacentPoints(p);
      for (final a in adj) {
        if (numbers.containsKey(a)) {
          if (!partNumbers.contains((numbers[a], p))) {
            partNumbers.add((numbers[a]!, p));
          }
        }
      }
    }
    int sum = 0;
    for (final p in partNumbers) {
      sum += p.$1;
    }
    return PartResult(result: "$sum");
  }

  @override
  Future<PartResult> partTwo() async {
//     input = """
// 467..114..
// ...*......
// ..35..633.
// ......#...
// 617*......
// .....+.58.
// ..592.....
// ......755.
// ...\$.*....
// .664.598..""";
    input = await loadDayFileString();
    await initialize();
    final points = findSymbols(matrix, symbol: '*');
    final numbers = findNumbers(input.split('\n'));
    int total = 0;
    for (final p in points) {
      final adj = adjacentPoints(p);
      //int hitCount = 0;
      final List<int> hitNums = List.empty(growable: true);
      for (final a in adj) {
        if (numbers.containsKey(a) && !hitNums.contains(numbers[a])) {
          hitNums.add(numbers[a]!);
        }
      }
      if (hitNums.length == 2) {
        total += hitNums.reduce((value, element) => value * element);
      }
    }
    return PartResult(result: "$total");
  }
}
