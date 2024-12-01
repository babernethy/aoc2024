import 'dart:math';

import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day15.freezed.dart';

@freezed
class SensorBeacon with _$SensorBeacon {
  factory SensorBeacon({
    required Point sensor,
    required Point beacon,
    required int distance,
  }) = _SensorBeacon;
  SensorBeacon._();

  int minXAtY(int y) => (sensor.x - distance + (sensor.y - y).abs()).toInt();
  int maxXAtY(int y) => (sensor.x + distance - (sensor.y - y).abs()).toInt();
}

class Day15Logic extends BaseDayLogic {
  String input;
  Map<Point, String> space = {};
  List<List<Point>> parsedPoints = [];
  List<SensorBeacon> sensorBeacons = [];
  Day15Logic(super.dayNumber, super.title)
      : input = """
Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=9, y=16: closest beacon is at x=10, y=16
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=12, y=14: closest beacon is at x=10, y=16
Sensor at x=10, y=20: closest beacon is at x=10, y=16
Sensor at x=14, y=17: closest beacon is at x=10, y=16
Sensor at x=8, y=7: closest beacon is at x=2, y=10
Sensor at x=2, y=0: closest beacon is at x=2, y=10
Sensor at x=0, y=11: closest beacon is at x=2, y=10
Sensor at x=20, y=14: closest beacon is at x=25, y=17
Sensor at x=17, y=20: closest beacon is at x=21, y=22
Sensor at x=16, y=7: closest beacon is at x=15, y=3
Sensor at x=14, y=3: closest beacon is at x=15, y=3
Sensor at x=20, y=1: closest beacon is at x=15, y=3""";

  Future<void> initialize() async {
    //input = await loadDayFileString();

//'Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)'
    space = {};

    final re = RegExp(r"[-]?\d+");
    sensorBeacons = input
        .split("\n")
        .map(
          (l) => re
              .allMatches(l)
              .map((m) => l.substring(m.start, m.end))
              .map((e) => int.parse(e))
              .toList(),
        )
        .map(
          (p) => SensorBeacon(
            sensor: Point(p[0], p[1]),
            beacon: Point(p[2], p[3]),
            distance: (p[0] - p[2]).abs() + (p[1] - p[3]).abs(),
          ),
        )
        .toList();

    for (final line in input.split("\n")) {
      // debugPrint(line);

      final points = line
          .split(":")
          .map((p) => p.split(',').toList().map((e) => e.split(" ")).toList())
          .toList();

      parsedPoints.add([
        Point(
          int.parse(points[0][0][2].split("=")[1]),
          int.parse(points[0][1][1].split("=")[1]),
        ),
        Point(
          int.parse(points[1][0][5].split("=")[1]),
          int.parse(points[1][1][1].split("=")[1]),
        )
      ]);
    }

    //drawSpace();
  }

  void fillSpace(Point sensor, Point beacon) {
    final steps = (beacon.x - sensor.x).abs() + (beacon.y - sensor.y).abs();

    var ix = -steps;
    for (var x = sensor.x - steps; x < sensor.x + steps + 1; x++) {
      final yDelta = ix == 0
          ? steps
          : ix < 0
              ? steps + ix
              : steps - ix;
      for (var y = sensor.y - yDelta; y < sensor.y + yDelta + 1; y++) {
        if (!space.keys.contains(Point(x, y))) {
          space.addAll({Point(x, y): "#"});
        }
      }
      ix++;
    }
  }

  Point minPoint() {
    return Point(
      space.keys.map((e) => e.x).reduce(min),
      space.keys.map((e) => e.y).reduce(min),
    );
  }

  Point maxPoint() {
    return Point(
      space.keys.map((e) => e.x).reduce(max),
      space.keys.map((e) => e.y).reduce(max),
    );
  }

  void drawSpace() {
    final min = minPoint();
    final max = maxPoint();
    final spaceString = StringBuffer();
    for (var y = min.y; y <= max.y; y++) {
      String line = '${y.toString().padLeft(3, "0")} ';
      for (var x = min.x; x <= max.x; x++) {
        if (space.keys.contains(Point(x, y))) {
          line += space[Point(x, y)] ?? "?";
        } else {
          line += ".";
        }
      }
      spaceString.writeln(line);
    }
    debugPrint(spaceString.toString());
  }

  int spaceFilled(int row) {
    return space.keys
        .where((e) => e.y == row)
        .where((e) => space[e] == "#")
        .length;
  }

  int linesCross(int row) {
    // we know the "y" how much "x" do we need to check?
    // the furthest left and right of the sensors and beacons
    final minX =
        sensorBeacons.map((e) => e.sensor.x - e.distance).reduce(min).toInt();
    final maxX =
        sensorBeacons.map((e) => e.sensor.x + e.distance).reduce(max).toInt();

    // how many intersections?
    var count = 0;

    for (int i = minX; i <= maxX; i++) {
      var ignoreBeacon = false;
      // got this wrong the first time - apparently we don't count the beacons
      for (final sb in sensorBeacons) {
        if (sb.beacon.x == i && sb.beacon.y == row) {
          // we're evaluating a beacon
          ignoreBeacon = true;
          break;
        }
      }
      if (ignoreBeacon) {
        // ignore beacons
        continue;
      }

      for (final sb in sensorBeacons) {
        // if we look at the slope of the sensor-beacon line and take it to this row
        if (i >= sb.minXAtY(row) && i <= sb.maxXAtY(row)) {
          // we can tell if this combo will hit it
          count++;
          break;
        }
      }
    }

    return count;
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();

    //    fillSpace(parsedPoints[6][0], parsedPoints[6][1]);
    //  drawSpace();

    // for (final p in parsedPoints) {
    //   debugPrint("filling space for $p");
    //   fillSpace(p[0], p[1]);
    //   // drawSpace();
    // }
    // final tenSpace = spaceFilled(10);
    final tenSpace = linesCross(2000000);

    //final tenSpace = spaceFilled(2000000);

    return PartResult(result: "$tenSpace");
  }

  @override
  Future<PartResult> partTwo() async {
    //await initialize();

    return PartResult(result: "not implemented");
  }
}
