import 'dart:math';
import 'dart:ui';

import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/material.dart';

class SpacePainter extends CustomPainter {
  SpacePainter(this.space);
  final Set<Point> space;

  Point minPoint() {
    return Point(
      space.map((e) => e.x).reduce((a, b) => min(a, b)),
      space.map((e) => e.y).reduce(min),
    );
  }

  Point maxPoint() {
    return Point(
      space.map((e) => e.x).reduce(max),
      space.map((e) => e.y).reduce(max),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 4;

    final min = minPoint();
    final max = maxPoint();
    final scale = 5;
    final points = space
        .map((e) =>
            Offset((e.x - min.x).toDouble() * scale, e.y.toDouble() * scale))
        .toList();

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Day14Logic extends BaseDayLogic with ChangeNotifier {
  String input;
  Set<Point> space = {};
  Point sandEntry = const Point(500, 0);
  Day14Logic(super.dayNumber, super.title)
      : input = """
498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9""";

  Future<void> initialize() async {
    input = await loadDayFileString();
    space = {};
    final formations = input
        .split("\n")
        .map((e) => e.split(" -> "))
        .map((e) => e.map((e) => e.split(",").map(int.parse).toList()))
        .map((e) => e.map((e) => Point(e[0], e[1])))
        .map((e) => e.toList())
        .toList();

    for (final f in formations) {
      for (var i = 0; i < f.length - 1; i++) {
        addPoints(f[i], f[i + 1]);
      }
    }
    notifyListeners();
  }

  void addPoints(Point from, Point to) {
    // debugPrint('$from $to');
    if (from.x == to.x) {
      for (var y = from.y;
          from.y < to.y ? y <= to.y : y >= to.y;
          from.y > to.y ? y-- : y++) {
        space.add(Point(from.x, y));
      }
    }
    if (from.y == to.y) {
      for (var x = from.x;
          from.x < to.x ? x <= to.x : x >= to.x;
          from.x > to.x ? x-- : x++) {
        space.add(Point(x, from.y));
      }
    }
  }

// keep dropping sand until it finds a resting point
  Point? dropSand(Point p) {
    // out point is below lowest structure
    if (p.y > maxPoint().y) {
      return null;
    }
    // look below, if clear drop one
    // how to know if this goes forever?
    if (!space.contains(Point(p.x, p.y + 1))) {
      return dropSand(Point(p.x, p.y + 1));
    }
    // if not clear, look left
    if (!space.contains(Point(p.x - 1, p.y + 1))) {
      return dropSand(Point(p.x - 1, p.y + 1));
    }
    // if not clear, look right
    if (!space.contains(Point(p.x + 1, p.y + 1))) {
      return dropSand(Point(p.x + 1, p.y + 1));
    }
    // if not clear, return current point
    return p;
  }

  Point? dropSand2(Point p, int floor) {
    // out point is above sand entry
    if (p.y < sandEntry.y) {
      return null;
    }
    // floor is 2 units below max
    if (p.y > floor) {
      return p;
    }
    // look below, if clear drop one
    // how to know if this goes forever?
    if (!space.contains(Point(p.x, p.y + 1))) {
      return dropSand2(Point(p.x, p.y + 1), floor);
    }
    // if not clear, look left
    if (!space.contains(Point(p.x - 1, p.y + 1))) {
      return dropSand2(Point(p.x - 1, p.y + 1), floor);
    }
    // if not clear, look right
    if (!space.contains(Point(p.x + 1, p.y + 1))) {
      return dropSand2(Point(p.x + 1, p.y + 1), floor);
    }
    // if not clear, return current point
    return p;
  }

  Point minPoint() {
    return Point(
      space.map((e) => e.x).reduce((a, b) => min(a, b)),
      space.map((e) => e.y).reduce(min),
    );
  }

  Point maxPoint() {
    return Point(
      space.map((e) => e.x).reduce(max),
      space.map((e) => e.y).reduce(max),
    );
  }

  void drawSpace() {
    final min = minPoint();
    final max = maxPoint();
    final spaceString = StringBuffer();
    for (var y = min.y; y <= max.y; y++) {
      String line = '${y.toString().padLeft(3, "0")} ';
      for (var x = min.x; x <= max.x; x++) {
        if (space.contains(Point(x, y))) {
          line += "#";
        } else {
          line += ".";
        }
      }
      spaceString.writeln(line);
    }
    debugPrint(spaceString.toString());
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();

    // debugPrint('min: ${minPoint()} max: ${maxPoint()}');
    //drawSpace();
    // for (var i = 0; i < 24; i++) {
    //   space.add(dropSand(sandEntry));
    // }
    var i = 0;
    Point? lastSand = const Point(0, 0);
    while (lastSand != null) {
      lastSand = dropSand(sandEntry);
      if (lastSand != null) {
        if (!space.add(lastSand)) {
          debugPrint('already in space: $lastSand');
        }
      }
      i++;
      notifyListeners();
    }

    // drawSpace();
    return PartResult(result: "${i - 1}", extra: space);
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();

    // debugPrint('min: ${minPoint()} max: ${maxPoint()}');
    // drawSpace();
    var i = 0;
    final floor = (maxPoint().y).toInt();
    Point? lastSand = const Point(0, 0);
    while (lastSand != null) {
      lastSand = dropSand2(sandEntry, floor);
      if (lastSand != null) {
        if (!space.add(lastSand)) {
          debugPrint('already in space: $lastSand');
          break;
        }
      }
      i++;

      // if (i % 15 == 0) {
      //   debugPrint('i: $i');
      //   drawSpace();
      // }
    }

    // drawSpace();
    return PartResult(result: "$i");
  }
}
