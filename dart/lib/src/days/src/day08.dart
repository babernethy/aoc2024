import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';

class Day08Logic extends BaseDayLogic {
  String input;
  List<List<int>> matrix = [];

  Day08Logic(super.dayNumber, super.title)
      : input = """
30373
25512
65332
33549
35390""";

  Future<void> initialize() async {
    input = await loadDayFileString();

    matrix = input
        .split('\n')
        .map((e) => e.split('').map((e) => int.parse(e)).toList())
        .toList();
  }

  int valueAt(int x, int y, List<List<int>> matrix) {
    return matrix[y][x];
  }

  int scenicFromAbove(int value, int x, int y, List<List<int>> matrix) {
    var score = 0;
    if (y == 0) {
      return score;
    }
    score++;
    if (y == 1) {
      return score;
    }
    for (var i = y - 1; i >= 0; i--) {
      if (valueAt(x, i, matrix) >= value) {
        // debugPrint('not visible from above: $value, $x, $y, $i');
        return score;
      } else {
        score++;
      }
    }
    score--;
    return score;
  }

  int scenicFromBelow(int value, int x, int y, List<List<int>> matrix) {
    var score = 0;
    final valueCheck = valueAt(x, y, matrix);
    if (valueCheck != value) {
      debugPrint('value check failed: $value, $x, $y, $valueCheck');
    }
    if (y == matrix.length - 1) {
      return score;
    }
    score++;
    if (y == matrix.length - 2) {
      return score;
    }
    for (var i = y + 1; i < matrix.length; i++) {
      if (valueAt(x, i, matrix) >= value) {
        return score;
      } else {
        score++;
      }
    }
    score--;
    return score;
  }

  int scenicFromLeft(int value, int x, int y, List<List<int>> matrix) {
    var score = 0;
    if (x == 0) {
      return score;
    }
    score++;
    if (x == 1) {
      return score;
    }
    for (var i = x - 1; i >= 0; i--) {
      if (valueAt(i, y, matrix) >= value) {
        return score;
      } else {
        score++;
      }
    }
    score--;
    return score;
  }

  int scenicFromRight(int value, int x, int y, List<List<int>> matrix) {
    var score = 0;
    if (x == matrix[0].length - 1) {
      return score;
    }
    score++;
    if (x == matrix[0].length - 2) {
      return score;
    }
    for (var i = x + 1; i < matrix[0].length; i++) {
      if (valueAt(i, y, matrix) >= value) {
        return score;
      } else {
        score++;
      }
    }
    score--;
    return score;
  }

  bool visibleFromAbove(int value, int x, int y, List<List<int>> matrix) {
    if (y == 0) {
      return true;
    }
    for (var i = y - 1; i >= 0; i--) {
      if (valueAt(x, i, matrix) >= value) {
        // debugPrint('not visible from above: $value, $x, $y, $i');
        return false;
      }
    }
    return true;
  }

  bool visibleFromBelow(int value, int x, int y, List<List<int>> matrix) {
    if (y == matrix.length - 1) {
      return true;
    }
    for (var i = y + 1; i < matrix.length; i++) {
      if (valueAt(x, i, matrix) >= value) {
        return false;
      }
    }
    return true;
  }

  bool visibleFromLeft(int value, int x, int y, List<List<int>> matrix) {
    if (x == 0) {
      return true;
    }
    for (var i = x - 1; i >= 0; i--) {
      if (valueAt(i, y, matrix) >= value) {
        return false;
      }
    }
    return true;
  }

  bool visibleFromRight(int value, int x, int y, List<List<int>> matrix) {
    if (x == matrix[0].length - 1) {
      return true;
    }
    for (var i = x + 1; i < matrix[0].length; i++) {
      if (valueAt(i, y, matrix) >= value) {
        return false;
      }
    }
    return true;
  }

  bool isVisible(int value, int x, int y, List<List<int>> matrix) {
    final v4a = visibleFromAbove(value, x, y, matrix);
    final v4b = visibleFromBelow(value, x, y, matrix);
    final v4l = visibleFromLeft(value, x, y, matrix);
    final v4r = visibleFromRight(value, x, y, matrix);

    final notVisibleAtAll = v4a || v4b || v4l || v4r;

    //debugPrint('isVisible:  $x, $y ($value)');

    return notVisibleAtAll;
  }

  int scenicScore(int value, int x, int y, List<List<int>> matrix) {
    final v4a = scenicFromAbove(value, x, y, matrix);
    final v4b = scenicFromBelow(value, x, y, matrix);
    final v4l = scenicFromLeft(value, x, y, matrix);
    final v4r = scenicFromRight(value, x, y, matrix);

    final totalScore = v4a * v4b * v4l * v4r;

    // debugPrint(
    //   'scenic score:  $x, $y ($value) - $totalScore ($v4a, $v4b, $v4l, $v4r)',
    // );

    return totalScore;
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();
    var result = 0;
    var x = 0;
    for (final line in matrix) {
      var y = 0;
      for (final e in line) {
        if (isVisible(e, x, y, matrix)) {
          result++;
        }
        y++;
      }
      x++;
    }

    return PartResult(result: result.toString());
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();
    var result = 0;
    var y = 0;
    for (final line in matrix) {
      var x = 0;
      for (final e in line) {
        final score = scenicScore(e, x, y, matrix);
        if (score > result) {
          result = score;
        }
        x++;
      }
      y++;
    }

    return PartResult(result: result.toString());
  }
}
