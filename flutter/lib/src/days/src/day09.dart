import 'package:aoc2023/app/aoc_utils.dart';
import 'package:aoc2023/src/days/base_day.dart';
import 'package:flutter/foundation.dart';

class Day09Logic extends BaseDayLogic {
  String input;
  List<List<int>> histories = List.empty(growable: true);

  Future<void> initialize() async {
    final sections = input.split('\n');
    histories.clear();
    histories = sections.map((e) => findNumbersInString(e)).toList().toList();
  }

  List<int> calcStepDifferenceInSeries(List<int> series) {
    final result = List<int>.empty(growable: true);
    for (var i = 0; i < series.length - 1; i++) {
      result.add(series[i + 1] - series[i]);
    }
    return result;
  }

  bool isSeriesAllZeros(List<int> series) {
    final testSeries = List<int>.from(series);
    testSeries.removeWhere((element) => element == 0);
    return testSeries.isEmpty;
  }

  int calcNextItemInSeries(List<int> series) {
    final List<List<int>> sequences = [];
    sequences.add(series);
    List<int> current = series;
    while (!isSeriesAllZeros(current)) {
      current = calcStepDifferenceInSeries(current);
      sequences.add(current);
    }
    sequences.last.add(0);
    for (var i = sequences.length - 2; i >= 0; i--) {
      sequences[i].add(sequences[i].last + sequences[i + 1].last);
      printSeries(sequences[i]);
    }
    final nextItem = sequences.first.last;
    debugPrint(nextItem.toString());
    return nextItem;
  }

  void printSeries(List<int> series) {
    debugPrint(series.join(', '));
  }

  Day09Logic(super.dayNumber, super.title)
      : input = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45""";

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    initialize();
    final total = histories.fold(
      0,
      (prev, history) => prev + calcNextItemInSeries(history),
    );

    return PartResult(result: "$total");
  }

  @override
  Future<PartResult> partTwo() async {
    //initialize();

    return PartResult(result: "Not Implemented");
  }
}
