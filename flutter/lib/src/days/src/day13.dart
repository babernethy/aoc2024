import 'package:aoc2023/src/days/base_day.dart';
import 'package:flutter/material.dart';
import 'package:quantity/quantity.dart';

class Day13Logic extends BaseDayLogic {
  String input;
  List<List<String>> mirrorRows = List.empty(growable: true);

  Future<void> initialize() async {
    mirrorRows.clear();
    mirrorRows = input.split('\n\n').map((e) => e.split('\n')).toList();
  }

  List<String> getColumns(List<String> rows) {
    final columns = List<String>.filled(rows[0].length, '', growable: true);
    for (var i = 0; i < rows.length; i++) {
      for (var j = 0; j < rows[i].length; j++) {
        columns[j] += rows[i][j];
      }
    }
    return columns;
  }

  (bool, int) oneSmudge(String str1, String str2) {
    int smudges = 0;
    int index = 0;
    for (int i = 0; i < str1.length; i++) {
      if (str1[i] != str2[i]) {
        smudges++;
        index = i;
        if (smudges > 1) {
          return (false, index);
        }
      }
    }
    return (smudges == 1, index);
  }

  (int, int)? findSmudge(List<String> rows) {
    for (var i = 1; i < rows.length; i++) {
      var up = '';
      var down = '';
      for (var j = 1; j < i; j++) {
        up += rows[i - j];
        down += rows[i + j];
        if (oneSmudge(up, down).$1) {
          return (i, j);
        }
      }
    }
    return null;
  }

  Day13Logic(super.dayNumber, super.title)
      : input = """
##..####..###
.#..####..#..
#...#..#...##
##.#....#.###
...#.##.#.#..
.###....###..
#.########.##
#..##..##..##
.#.#....#.#..

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#""";

  bool isMirror(int row, List<String> rows) {
    var top = row - 2;
    var bottom = row + 1;
    while (top >= 0 && bottom < rows.length) {
      if (rows[top] != rows[bottom]) {
        return false;
      }
      top--;
      bottom++;
    }

    return true;
  }

  @override
  Future<PartResult> partOne() async {
    // input = await loadDayFileString();
    initialize();

    var total = 0;

    for (final rows in mirrorRows) {
      var foundRowMirror = false;
      for (var i = 1; i < rows.length; i++) {
        if (rows[i] == rows[i - 1]) {
          if (isMirror(i, rows)) {
            foundRowMirror = true;
            total += i * 100;
          }
        }
      }
      if (!foundRowMirror) {
        final columns = getColumns(rows);
        for (var i = 1; i < columns.length; i++) {
          if (columns[i] == columns[i - 1]) {
            if (isMirror(i, columns)) {
              total += i;
            }
          }
        }
      }
    }

    return PartResult(result: "$total");
  }

  @override
  Future<PartResult> partTwo() async {
    initialize();

    var total = 0;

    for (final rows in mirrorRows) {
      var smudge = findSmudge(rows);
      // var foundRowMirror = false;
      // for (var i = 1; i < rows.length; i++) {
      //   // if (oneSmudge(rows[i], rows[i - 1])) {
      //   //   debugPrint("Found row smudge duplicate: ${rows[i]} - $i");
      //   //   if (isMirror(i, rows)) {
      //   //     foundRowMirror = true;
      //   //     debugPrint("Found row smudge mirror: ${rows[i]} - $i");
      //   //     total += i * 100;
      //   //   }
      //   // }
      // }
      // if (!foundRowMirror) {
      //   final columns = getColumns(rows);
      //   for (var i = 1; i < columns.length; i++) {
      //     // if (oneSmudge(columns[i], columns[i - 1])) {
      //     //   debugPrint("Found column smudge duplicate: ${columns[i]} - $i");
      //     //   if (isMirror(i, columns)) {
      //     //     debugPrint("Found column smudge mirror: ${columns[i]} - $i");
      //     //     total += i;
      //     //   }
      //     // }
      //   }
      // }
    }

    return PartResult(result: "$total");
  }
}
