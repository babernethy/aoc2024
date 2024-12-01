import 'package:aoc2023/src/days/base_day.dart';
import 'package:aoc2023/src/days/src/days.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logic_collection.g.dart';

const currentDay = 13;

@riverpod
LogicCollection logicCollection(LogicCollectionRef ref) => LogicCollection();

class LogicCollection {
  LogicCollection() {
    add(1, Day01Logic(1, "Trebuchet?"));
    add(2, Day02Logic(2, "Cube Conundrum"));
    add(3, Day03Logic(3, "Gear Ratio"));
    add(4, Day04Logic(4, "Scratch Cards"));
    add(5, Day05Logic(5, "If You Give A Seed A Fertilizer"));
    add(6, Day06Logic(6, "Wait for It"));
    add(7, Day07Logic(7, "Camel Cards"));
    add(8, Day08Logic(8, "Haunted Wasteland"));
    add(13, Day13Logic(13, "Point of Incidence"));
    add(14, Day14Logic(14, "Parabolic Reflector Dish"));
    add(9, Day09Logic(9, "Mirage Maintenance"));
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
