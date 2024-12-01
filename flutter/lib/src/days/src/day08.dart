import 'package:aoc2023/src/days/base_day.dart';
import 'package:dart_numerics/dart_numerics.dart';
import 'package:flutter/material.dart';

class Day08Logic extends BaseDayLogic {
  String input;
  final Map<String, ({String right, String left})> mapNodes = {};
  final List<String> instructions = List.empty(growable: true);

  Future<void> initialize() async {
    final sections = input.split('\n\n');
    instructions.addAll(sections[0].split(''));
    for (final line in sections[1].split('\n')) {
      final parts = line.split('=');
      final words = findWords(parts[1]);
      mapNodes.addAll({
        parts[0].trim(): (right: words[1].trim(), left: words[0].trim()),
      });
    }
  }

  List<String> findWords(String input) {
    final List<String> words = List.empty(growable: true);
    final matches = RegExp(r'[A-Z][A-Z\d]+').allMatches(input);
    for (final Match m in matches) {
      final match = m[0]!;
      words.add(match);
    }
    return words;
  }

  List<int> findNumbers(String input) {
    final List<int> numbers = List.empty(growable: true);
    final matches = RegExp(r'\d+').allMatches(input);
    for (final Match m in matches) {
      final match = int.parse(m[0]!);
      numbers.add(match);
    }
    return numbers;
  }

  Day08Logic(super.dayNumber, super.title)
      : input = """
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)""";

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();

    initialize();
    final Map<String, int> visited = {};
    final List<String> log = List.empty(growable: true);
    for (final node in mapNodes.keys) {
      visited.addAll({node: 0});
    }
    //String current = mapNodes.keys.first; // aaaaaah
    String current = 'AAA';
    String previous = '';
    String already = '';
    int steps = 0;
    while (current != 'ZZZ') {
      previous = current;
      already = '';
      final index = steps % instructions.length;
      final next = instructions[index];
      if (next == 'L') {
        current = mapNodes[current]!.left;
      } else if (next == 'R') {
        current = mapNodes[current]!.right;
      }
      if (visited[current]! > 0) {
        already = "*${visited[current]}";
      }
      visited[current] = visited[current]! + 1;

      if (previous == 'QKX' && index == 0) {
        debugPrint('----------------------------------------------');
      }

      final logItem =
          '$steps/$index - $previous(${mapNodes[previous]!.left},${mapNodes[previous]!.right}) - $next - $current$already';
      log.add(logItem);

      // if (current == 'ZZZ') {
      //   debugPrint(logItem);
      // }

      steps++;
    }
    log.add('--- Completed in $steps steps ---');
    return PartResult(result: "$steps");
  }

  @override
  Future<PartResult> partTwo() async {
    //initialize();
    final List<int> stepsList = List.empty(growable: true);
    for (final item
        in mapNodes.keys.where((element) => element.endsWith('A'))) {
      var current = item;
      int steps = 0;
      while (!current.endsWith('Z')) {
        final index = steps % instructions.length;
        final next = instructions[index];
        current = (next == 'L')
            ? mapNodes[current]!.left
            : current = mapNodes[current]!.right;
        steps++;
      }
      stepsList.add(steps);
    }
    final lcm = leastCommonMultipleOfMany(stepsList);
    return PartResult(result: "$lcm");
  }
}
