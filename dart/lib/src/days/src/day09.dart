import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class Day09Logic extends BaseDayLogic {
  String input;
  Point head = Point(0, 0);
  Point tail = Point(0, 0);
  Point blVisited = Point(0, 0);
  Point trVisited = Point(0, 0);
  List<Point> visitedPoints = List.empty(growable: true);
  List<Point> lr = List.empty(growable: true);
  Day09Logic(super.dayNumber, super.title)
      : input = """
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2""";

  Future<void> initialize() async {
    //   input = await loadDayFileString();

    input = """
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20""";

    head = Point(0, 0);
    tail = Point(0, 0);
    visitedPoints = List.empty(growable: true);
    lr = List.empty(growable: true);
    for (var i = 0; i < 10; i++) {
      lr.add(Point(0, 0));
    }
  }

  void moveLongHead(String direction) {
    switch (direction) {
      case 'R':
        lr[0] = Point(lr[0].x + 1, lr[0].y);
        moveLongTail(1);
        break;
      case 'L':
        lr[0] = Point(lr[0].x - 1, lr[0].y);
        moveLongTail(1);
        break;
      case 'U':
        lr[0] = Point(lr[0].x, lr[0].y + 1);
        moveLongTail(1);
        break;
      case 'D':
        lr[0] = Point(lr[0].x, lr[0].y - 1);
        moveLongTail(1);
        break;
    }
  }

  void moveLongTail(int index) {
    if (!isAdjacentParent(index)) {
      if (lr[index - 1].x == lr[index].x) {
        if (lr[index - 1].y > lr[index].y) {
          lr[index] = Point(lr[index].x, lr[index - 1].y - 1);
        } else {
          lr[index] = Point(lr[index].x, lr[index].y + 1);
        }
        if (index < 9) {
          moveLongTail(index + 1);
        }
        return;
      }
      if (lr[index - 1].y == lr[index].y) {
        if (lr[index - 1].x > lr[index].x) {
          lr[index] = Point(lr[index - 1].x - 1, lr[index].y);
        } else {
          lr[index] = Point(lr[index].x + 1, lr[index].y);
        }
        if (index < 9) {
          moveLongTail(index + 1);
        }
        return;
      }
      if ((lr[index - 1].x - lr[index].x).abs() ==
          (lr[index - 1].y - lr[index].y).abs()) {
        // debugPrint(
        //   "### we have a problem ### - ${lr[index - 1].distanceTo(lr[index])} - (${lr[index - 1]}) - (${lr[index]})",
        // );
      }
      if ((lr[index - 1].x - lr[index].x).abs() >
          (lr[index - 1].y - lr[index].y).abs()) {
        if (lr[index - 1].x > lr[index].x) {
          lr[index] = Point(lr[index - 1].x - 1, lr[index].y);
        } else {
          lr[index] = Point(lr[index + 1].x + 1, lr[index].y);
        }
        if (index < 9) {
          moveLongTail(index + 1);
        }
        return;
      } else {
        if (lr[index - 1].y > lr[index].y) {
          lr[index] = Point(lr[index - 1].x, lr[index - 1].y - 1);
        } else {
          lr[index] = Point(lr[index - 1].x, lr[index].y + 1);
        }
        if (index < 9) {
          moveLongTail(index + 1);
        }
        return;
      }
    }
  }

  bool isAdjacentParent(int index) {
    return lr[index - 1].distanceTo(lr[index]).abs() < 2.0;
  }

  void printLongRope() {
    // debugPrint(
    //   lr.fold(
    //     "${isAdjacentParent(1)} - ",
    //     (value, element) => value = "${value!}(${element.x},${element.y}) ",
    //   ),
    // );
  }

  void moveHead(String direction) {
    switch (direction) {
      case 'R':
        head = Point(head.x + 1, head.y);
        moveTail();
        break;
      case 'L':
        head = Point(head.x - 1, head.y);
        moveTail();
        break;
      case 'U':
        head = Point(head.x, head.y + 1);
        moveTail();
        break;
      case 'D':
        head = Point(head.x, head.y - 1);
        moveTail();
        break;
    }
  }

  void moveTail() {
    if (!headTailAdjacent()) {
      if (head.x == tail.x) {
        if (head.y > tail.y) {
          tail = Point(tail.x, head.y - 1);
        } else {
          tail = Point(tail.x, head.y + 1);
        }
        return;
      }
      if (head.y == tail.y) {
        if (head.x > tail.x) {
          tail = Point(head.x - 1, tail.y);
        } else {
          tail = Point(head.x + 1, tail.y);
        }
        return;
      }
      if ((head.x - tail.x).abs() > (head.y - tail.y).abs()) {
        if (head.x > tail.x) {
          tail = Point(head.x - 1, head.y);
        } else {
          tail = Point(head.x + 1, head.y);
        }
        return;
      } else {
        if (head.y > tail.y) {
          tail = Point(head.x, head.y - 1);
        } else {
          tail = Point(head.x, head.y + 1);
        }
        return;
      }
    }
  }

  bool headTailAdjacent() {
    return head.distanceTo(tail) < 2.0;
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();
    var result = 0;
    visitedPoints.add(tail);
    for (final line in input.split('\n')) {
      final direction = line.substring(0, 1);
      final distance = int.parse(line.substring(1));
      for (var i = 0; i < distance; i++) {
        moveHead(direction);
        if (!visitedPoints.contains(tail)) {
          visitedPoints.add(tail);
        }
      }
    }
    result = visitedPoints.length;
    return PartResult(result: result.toString());
  }

  void updateVisitedPoints() {
    if (!visitedPoints.contains(lr[9])) {
      visitedPoints.add(lr[9]);
      // blVisited = visitedPoints.reduce((value, element) => null)
    }
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();
    var result = 0;
    visitedPoints.add(lr[9]);
    for (final line in input.split('\n')) {
      // debugPrint(line);
      final direction = line.substring(0, 1);
      final distance = int.parse(line.substring(1));
      for (var i = 0; i < distance; i++) {
        moveLongHead(direction);
        updateVisitedPoints();
        printLongRope();
      }
      // debugPrint('------------------');
    }
    result = visitedPoints.length;
    return PartResult(result: result.toString());
  }
}
