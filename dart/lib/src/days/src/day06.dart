import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';

class Day06Logic extends BaseDayLogic {
  String input;

  Day06Logic(super.dayNumber, super.title)
      : input = """
mjqjpqmgbljsphdztnvjfqwrcgsmlb""";

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    var result = 0;
    for (var i = 0; i < input.length; i++) {
      if (input.substring(i, i + 4).split('').toSet().length == 4) {
        // debugPrint((i + 4).toString());
        result = i + 4;
        break;
      }
    }

    return PartResult(result: result.toString());
  }

  @override
  Future<PartResult> partTwo() async {
    input = await loadDayFileString();
    var result = 0;
    for (var i = 0; i < input.length; i++) {
      if (input.substring(i, i + 14).split('').toSet().length == 14) {
        //debugPrint((i + 14).toString());
        result = i + 14;
        break;
      }
    }

    return PartResult(result: result.toString());
  }
}
