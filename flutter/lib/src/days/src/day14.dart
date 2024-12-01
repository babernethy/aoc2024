import 'package:aoc2023/src/days/base_day.dart';
import 'package:flutter/material.dart';

class Day14Logic extends BaseDayLogic {
  String input;
  List<List<String>> matrix = [];

  Future<void> initialize() async {
    matrix =
        input.split('\n').map((e) => e.split('').toList().toList()).toList();
  }

  Day14Logic(super.dayNumber, super.title)
      : input = """
O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#....""";

  void tiltNorth() {
    bool rockMoved = true;
    while (rockMoved) {
      rockMoved = false;
      for (var y = 1; y < matrix.length; y++) {
        final row = matrix[y];
        for (var x = 0; x < row.length; x++) {
          final element = row[x];
          if (element == 'O') {
            final below = matrix[y - 1][x];
            if (below == '.') {
              matrix[y - 1][x] = 'O';
              matrix[y][x] = '.';
              rockMoved = true;
            }
          }
        }
        // debugPrint('-------------------');
        // final total = printMatrix();
        // debugPrint('Total: $total');
      }
    }
  }

  int printMatrix() {
    var total = 0;
    for (var y = 0; y < matrix.length; y++) {
      final row = matrix[y];
      //count rocks
      for (var x = 0; x < row.length; x++) {
        final element = row[x];
        if (element == 'O') {
          total = total + (matrix.length - y);
        }
      }
      debugPrint(row.join());
    }
    return total;
  }

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    initialize();

    tiltNorth();
    final total = printMatrix();

    return PartResult(result: "$total");
  }

  @override
  Future<PartResult> partTwo() async {
    initialize();

    return PartResult(result: "Not Implemented");
  }
}
