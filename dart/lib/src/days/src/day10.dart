import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class Day10Logic extends BaseDayLogic {
  String input;
  int x = 1;
  final display = List<String>.generate(
      6, (_) => '........................................');

  Day10Logic(super.dayNumber, super.title)
      : input = """
noop
addx 3
addx -5""";

  Future<void> initialize() async {
    input = """
addx 15
addx -11
addx 6
addx -3
addx 5
addx -1
addx -8
addx 13
addx 4
noop
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx -35
addx 1
addx 24
addx -19
addx 1
addx 16
addx -11
noop
noop
addx 21
addx -15
noop
noop
addx -3
addx 9
addx 1
addx -3
addx 8
addx 1
addx 5
noop
noop
noop
noop
noop
addx -36
noop
addx 1
addx 7
noop
noop
noop
addx 2
addx 6
noop
noop
noop
noop
noop
addx 1
noop
noop
addx 7
addx 1
noop
addx -13
addx 13
addx 7
noop
addx 1
addx -33
noop
noop
noop
addx 2
noop
noop
noop
addx 8
noop
addx -1
addx 2
addx 1
noop
addx 17
addx -9
addx 1
addx 1
addx -3
addx 11
noop
noop
addx 1
noop
addx 1
noop
noop
addx -13
addx -19
addx 1
addx 3
addx 26
addx -30
addx 12
addx -1
addx 3
addx 1
noop
noop
noop
addx -9
addx 18
addx 1
addx 2
noop
noop
addx 9
noop
noop
noop
addx -1
addx 2
addx -37
addx 1
addx 3
noop
addx 15
addx -21
addx 22
addx -6
addx 1
noop
addx 2
addx 1
noop
addx -10
noop
noop
addx 20
addx 1
addx 2
addx 2
addx -6
addx -11
noop
noop
noop""";

    input = await loadDayFileString();
  }

  String addPixel(String input, int index) {
    return '${input.substring(0, index)}#${input.substring(index)}';
  }

  String getSprite(int x) {
    var sprite = '';
    for (var i = 0; i < 40; i++) {
      if ((x - i).abs() <= 1) {
        sprite += '#';
      } else {
        sprite += '.';
      }
    }
    return sprite;
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();
    var result = 1;
    var cycle = 0;
    final checkCycles = [20, 60, 100, 140, 180, 220];
    var strengths = 0;

    for (final line in input.split('\n')) {
      if (line.contains('addx')) {
        final parts = line.split(' ');
        x = int.parse(parts[1]);
        for (var i = 0; i < 2; i++) {
          cycle++;

          // debugPrint(
          //     '$cycle: x: $x, command: $line${(i == 0) ? "(w)" : ""} , result: $result');

          if (checkCycles.contains(cycle)) {
            strengths += cycle * result;
            // debugPrint(
            //   '***** strength $strengths + ${cycle * result} - ($cycle, $result)',
            // );
          }
        }
        result += x;
      } else {
        cycle++;
        if (checkCycles.contains(cycle)) {
          strengths += cycle * result;
          // debugPrint(
          //     '***** strength $strengths + ${cycle * result} - ($cycle, $result)');
        }
      }
      //   debugPrint('$cycle: x: $x, command: $line, result: $result');
    }

    return PartResult(result: strengths.toString());
  }

  void updateDisplay(int cycle, int result) {
    final spritePixelMatch =
        getSprite(result).substring(cycle % 40, cycle % 40 + 1);
    final line = cycle ~/ 40;
    final pixel = cycle % 40;
    if (spritePixelMatch == "#") {
      display[line] = addPixel(display[line], pixel);
    }
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();
    var result = 1;
    var cycle = 0;

    for (final line in input.split('\n')) {
      if (line.contains('addx')) {
        final parts = line.split(' ');
        x = int.parse(parts[1]);
        for (var i = 0; i < 2; i++) {
          updateDisplay(cycle, result);
          // debugPrint(
          //     '${getSprite(result).substring(cycle % 40, cycle % 40 + 1)} (${cycle % 40},{}) $cycle: $result ${getSprite(result)}');
          cycle++;
        }
        result += x;
      } else {
        updateDisplay(cycle, result);
        // debugPrint(
        //     '${getSprite(result).substring(cycle % 40, cycle % 40 + 1)} $cycle: $result ${getSprite(result)}');
        cycle++;
      }
    }
    var output = '';
    // for (final element in display) {
    //   debugPrint(element);
    //   output += '$element\\n';
    // }
    return PartResult(result: output);
  }
}
