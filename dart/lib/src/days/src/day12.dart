import 'dart:math';

import 'package:aoc2022/src/days/base_day.dart';
import 'package:directed_graph/directed_graph.dart';
import 'package:flutter/foundation.dart';

class Day12Logic extends BaseDayLogic {
  String input;
  int height = 0;
  int width = 0;
  Point start = Point(0, 0);
  Point end = Point(0, 0);
  Map<Point, String> graph = {};
  DirectedGraph<Point>? dGraph;
  Day12Logic(super.dayNumber, super.title)
      : input = """
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi""";

  Future<void> initialize() async {
    input = await loadDayFileString();
    final data = input.split("\n");
    height = data.length;
    width = data[0].length;
    var y = 0;
    for (final line in data) {
      var x = 0;
      for (final c in line.split('')) {
        if (c == 'S') {
          start = Point(x, y);
          graph.addAll({Point(x, y): 'a'});
        } else if (c == 'E') {
          end = Point(x, y);
          graph.addAll({Point(x, y): 'z'});
        } else {
          graph.addAll({Point(x, y): c});
        }
        x++;
      }
      y++;
    }

    final graphInput = <Point, Set<Point>>{};
    graph.forEach(
      (key, value) => graphInput
          .addAll({key: Set.from(pathForward(value, neighbors(key)))}),
    );
    dGraph = DirectedGraph<Point>(graphInput);
  }

  bool inGrid(Point p) {
    return p.x >= 0 && p.x < width && p.y >= 0 && p.y < height;
  }

  List<Point> pathForward(String current, List<Point> points) {
    final List<Point> p = [];
    for (final point in points) {
      if (current == "S") {
        p.add(point);
      } else {
        final target = graph[point]!;
        if (target.codeUnitAt(0) <= current.codeUnitAt(0) + 1) {
          p.add(point);
        }
      }
    }
    return p;
  }

  List<Point> neighbors(Point p) {
    final List<Point> n = [
      Point(p.x - 1, p.y),
      Point(p.x + 1, p.y),
      Point(p.x, p.y - 1),
      Point(p.x, p.y + 1),
    ];
    return n.where((element) => inGrid(element)).toList();
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();

    final sp = dGraph!.shortestPath(start, end);

    final outGrid =
        List.generate(height, (i) => List.generate(width, (j) => ' '));
    for (final p in sp) {
      outGrid[p.y.toInt()][p.x.toInt()] = '.';
    }
    for (final line in outGrid) {
      // debugPrint(line.join());
    }

    return PartResult(result: "${sp.length - 1}");
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();

    final startingPoints = graph.entries
        .where((element) => element.value == 'a')
        .map((e) => e.key)
        .map((e) => dGraph!.shortestPath(e, end).length - 1)
        .where((element) => element != 0)
        .toList();
    startingPoints.sort();

    return PartResult(result: startingPoints.first.toString());
  }
}
