import 'package:aoc2022/src/days/base_day.dart';
import 'package:aoc2022/src/days/src/days.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logic_collection.g.dart';

const currentDay = 6;

@riverpod
LogicCollection logicCollection(LogicCollectionRef ref) => LogicCollection();

class LogicCollection {
  LogicCollection() {
    add(1, Day01Logic(1, "Calorie Counting"));
    add(2, Day02Logic(2, "Rock Paper Scissors"));
    add(3, Day03Logic(3, "Rucksack Reorganization"));
    add(4, Day04Logic(4, "Camp Cleanup"));
    add(5, Day05Logic(5, "Supply Stacks"));
    add(6, Day06Logic(6, "Tuning Trouble"));
    add(7, Day07Logic(7, "No Space Left On Device"));
    add(8, Day08Logic(8, "Treetop Tree House"));
    add(9, Day09Logic(9, "Rope Bridge"));
    add(10, Day10Logic(10, "Cathode-Ray Tube"));
    add(11, Day11Logic(11, "Monkey in the Middle"));
    add(12, Day12Logic(12, "Hill Climbing Algorithm"));
    add(13, Day13Logic(13, "Distress Signal"));
    add(14, Day14Logic(14, "Regolith Reservoir"));
    add(15, Day15Logic(15, "Beacon Exclusion Zone"));
    add(16, Day16Logic(16, "Proboscidea Volcanium"));
    add(19, Day19Logic(19, "Not Enough Minerals"));
    add(22, Day22Logic(22, "Monkey Map"));
  }
  Map<int, BaseDayLogic> logics = {};

  void add(int day, BaseDayLogic logic) {
    logics.addAll({day: logic});
  }

  bool containsKey(int day) {
    return logics.containsKey(day);
  }

  BaseDayLogic? get(int day) {
    return logics[day];
  }
}
