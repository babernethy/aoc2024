import "dart:math";
import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day22.freezed.dart';

@freezed
class NextMove with _$NextMove {
  factory NextMove({
    required int distance,
    required String direction,
    required String remainingMoves,
  }) = _NextMove;
}

@freezed
class NextStep with _$NextStep {
  factory NextStep({
    required int movesLeft,
    required Orientation orientation,
    required Point currentPoint,
    required bool hitWall,
  }) = _NextStep;
}

enum Orientation {
  up('^'),
  down('v'),
  left('<'),
  right('>');

  const Orientation(this.icon);
  final String icon;

  @override
  String toString() => icon;
}

class Day22Logic extends BaseDayLogic {
  String input;
  Map<Point, String> map = <Point, String>{};
  Point curPoint = Point(0, 0);
  Orientation curOrientation = Orientation.right;
  String moves = '';
  Day22Logic(super.dayNumber, super.title)
      : input = """
        ...#
        .#..
        #...
        ....
...#.......#
........#...
..#....#....
..........#.
        ...#....
        .....#..
        .#......
        ......#.

10R5L5R10L4R5L5""";

  Future<void> initialize() async {
    //input = await loadDayFileString();
    final parts = input.split("\n\n");
    var y = 0;
    for (final l in parts[0].split("\n")) {
      var x = 0;
      for (final c in l.split('')) {
        if (c.isNotEmpty && c != ' ') {
          map[Point(x, y)] = c;
        }
        x++;
      }
      y++;
    }
    moves = parts[1];
  }

  NextMove getNextMove(String remainingMoves) {
    var distance = 0;
    var direction = '';
    var i = 0;
    for (final c in remainingMoves.split('')) {
      if (c == 'L' || c == 'R') {
        direction = c;
        break;
      }
      i++;
    }
    if (direction.isNotEmpty) {
      distance = int.parse(remainingMoves.substring(0, i));
    } else {
      distance = int.parse(remainingMoves);
    }
    return NextMove(
      distance: distance,
      direction: direction,
      remainingMoves:
          direction.isNotEmpty ? remainingMoves.substring(i + 1) : '',
    );
  }

  bool pointOnMap(Point point) {
    return map.containsKey(point);
  }

  Point otherSideOfMap(Point point, Orientation orientation) {
    switch (orientation) {
      case Orientation.up:
        return Point(
          point.x,
          map.keys.where((e) => e.x == point.x).map((e) => e.y).reduce(min),
        );
      case Orientation.down:
        return Point(
          point.x,
          map.keys.where((e) => e.x == point.x).map((e) => e.y).reduce(max),
        );
      case Orientation.left:
        return Point(
          map.keys.where((e) => e.y == point.y).map((e) => e.x).reduce(max),
          point.y,
        );
      case Orientation.right:
        return Point(
          map.keys.where((e) => e.y == point.y).map((e) => e.x).reduce(min),
          point.y,
        );
    }
  }

  NextStep takeNextStep(
    int movesLeft,
    Orientation orientation,
    Point<num> currentPoint,
  ) {
    var hitWall = false;
    Point<num> outPoint = Point(0, 0);
    switch (orientation) {
      case Orientation.up:
        outPoint = Point(currentPoint.x, currentPoint.y - 1);
        break;
      case Orientation.down:
        outPoint = Point(currentPoint.x, currentPoint.y + 1);
        break;
      case Orientation.left:
        outPoint = Point(currentPoint.x - 1, currentPoint.y);
        break;
      case Orientation.right:
        outPoint = Point(currentPoint.x + 1, currentPoint.y);
        break;
    }
    if (!pointOnMap(outPoint)) {
      outPoint = otherSideOfMap(outPoint, orientation);
    }
    if (map[outPoint] == '#') {
      hitWall = true;
    }

    return NextStep(
      movesLeft: movesLeft - 1,
      orientation: orientation,
      currentPoint: hitWall ? currentPoint : outPoint,
      hitWall: hitWall,
    );
  }

  Orientation nextOrientation(String direction) {
    if (direction.isEmpty) return curOrientation;
    switch (curOrientation) {
      case Orientation.up:
        return direction == 'L' ? Orientation.left : Orientation.right;
      case Orientation.down:
        return direction == 'L' ? Orientation.right : Orientation.left;
      case Orientation.left:
        return direction == 'L' ? Orientation.down : Orientation.up;
      case Orientation.right:
        return direction == 'L' ? Orientation.up : Orientation.down;
    }
  }

  Point topLeft() {
    return map.keys
        .where((element) => element.y == 0)
        .reduce((value, element) => element.x < value.x ? element : value);
  }

  Point minPoint() {
    return Point(
      map.keys.map((e) => e.x).reduce(min),
      map.keys.map((e) => e.y).reduce(min),
    );
  }

  Point maxPoint() {
    return Point(
      map.keys.map((e) => e.x).reduce(max),
      map.keys.map((e) => e.y).reduce(max),
    );
  }

  void drawMap() {
    final min = minPoint();
    final max = maxPoint();
    final spaceString = StringBuffer();
    for (var y = min.y; y <= max.y; y++) {
      String line = '${y.toString().padLeft(3, "0")} ';
      for (var x = min.x; x <= max.x; x++) {
        if (map.keys.contains(Point(x, y))) {
          line += map[Point(x, y)] ?? "?";
        } else {
          line += " ";
        }
      }
      spaceString.writeln(line);
    }
    debugPrint(spaceString.toString());
  }

  @override
  Future<PartResult> partOne() async {
    initialize();
    debugPrint(topLeft().toString());
    var remainingMoves = moves;
    curPoint = topLeft();
    drawMap();
    while (remainingMoves.isNotEmpty) {
      final beforeOrientation = curOrientation;
      final nextMove = getNextMove(remainingMoves);
      var steps = nextMove.distance;
      var hitWall = false;
      while (steps > 0 && !hitWall) {
        map[curPoint] = curOrientation.toString();
        final nextStep = takeNextStep(
          steps,
          curOrientation,
          curPoint,
        );
        steps = nextStep.movesLeft;
        curPoint = nextStep.currentPoint;
        hitWall = nextStep.hitWall;
        map[curPoint] = curOrientation.toString();
      }
      curOrientation = nextOrientation(nextMove.direction);
      drawMap();
      debugPrint('$beforeOrientation $nextMove $curOrientation');
      remainingMoves = nextMove.remainingMoves;
    }
    return PartResult(result: "not implemented");
  }

  @override
  Future<PartResult> partTwo() async {
    return PartResult(result: "not implemented");
  }
}
