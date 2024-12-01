import 'package:aoc2022/src/days/base_day.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day11.freezed.dart';

@unfreezed
class Monkey with _$Monkey {
  factory Monkey({
    required final int number,
    @Default([]) List<Int64> items,
    @Default(Int64.ZERO) Int64 timesInspected,
    required String operation,
    required String operationValue,
    required int testValue,
    required int testTrue,
    required int testFalse,
  }) = _Monkey;
}

class Day11Logic extends BaseDayLogic {
  String input;
  Map<int, Monkey> monkeys = {};
  int lcm = 0;
  Day11Logic(super.dayNumber, super.title)
      : input = """
Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1""";

  Future<void> initialize() async {
    input = await loadDayFileString();
    final data = input.split("\n\n");
    for (final d in data) {
      final lines = d.split("\n");
      final monkeyNumber =
          int.parse(lines[0].split(" ")[1].replaceAll(":", ""));
      final startingItems = lines[1]
          .split(": ")[1]
          .split(", ")
          .map((e) => Int64.parseInt(e))
          .toList();
      final operation = lines[2].split(": ")[1].split(" ")[3];
      final operationValue = lines[2].split(": ")[1].split(" ")[4];
      final testValue = int.parse(lines[3].split(": ")[1].split(" ")[2]);
      final testTrue = int.parse(lines[4].split(": ")[1].split(" ")[3]);
      final testFalse = int.parse(lines[5].split(": ")[1].split(" ")[3]);
      monkeys[monkeyNumber] = Monkey(
        number: monkeyNumber,
        items: startingItems,
        operation: operation,
        operationValue: operationValue,
        testValue: testValue,
        testTrue: testTrue,
        testFalse: testFalse,
      );
    }
    lcm = monkeys.values
        .map((e) => e.testValue)
        .toSet()
        .reduce((value, element) => value * element);
  }

  Int64 updateWorryLevel(
      Int64 currentLevel, String operation, String operationValue) {
    var result = Int64.ONE;
    final value =
        operationValue == "old" ? currentLevel : Int64.parseInt(operationValue);
    if (operation == "*") {
      result = (currentLevel * value) ~/ 3;
    } else {
      result = (currentLevel + value) ~/ 3;
    }
    // debugPrint(
    //     "Monkey inspects an item with worry level $currentLevel, $operation $operationValue, ~/3 = $result");
    return result;
  }

  Int64 updateWorryLevel2(
    Int64 currentLevel,
    String operation,
    String operationValue,
    int divisor,
  ) {
    Int64 result = Int64.ONE;
    final value =
        operationValue == "old" ? currentLevel : int.parse(operationValue);
    if (operation == "*") {
      result = (currentLevel * value) % lcm;
    } else {
      result = (currentLevel + value) % lcm;
    }
    // debugPrint(
    //     "Monkey inspects an item with worry level $currentLevel, $operation $operationValue, ~/3 = $result");
    return result;
  }

  void doPartOneCycle() {
    for (final monkey in monkeys.values) {
      final items = monkey.items;
      for (final item in items) {
        final newLevel =
            updateWorryLevel(item, monkey.operation, monkey.operationValue);
        if (newLevel.remainder(monkey.testValue) == 0) {
          // debugPrint(
          //     'Current Worry Level is divisible by ${monkey.testValue}, item with worry level $newLevel is thrown to monkey ${monkey.testTrue}');
          monkeys[monkey.testTrue]!.items.add(newLevel);
        } else {
          // debugPrint(
          //     'Current Worry Level not divisible by ${monkey.testValue}, item with worry level $newLevel is thrown to monkey ${monkey.testFalse}');
          monkeys[monkey.testFalse]!.items.add(newLevel);
        }
        monkey.timesInspected++;
      }
      monkey.items = [];
    }
  }

  void doPartTwoCycle() {
    for (final monkey in monkeys.values) {
      final items = monkey.items;
      for (final item in items) {
        final newLevel = updateWorryLevel2(
            item, monkey.operation, monkey.operationValue, monkey.testValue);
        if (newLevel.remainder(monkey.testValue) == 0) {
          // debugPrint(
          //     'Current Worry Level is divisible by ${monkey.testValue}, item with worry level $newLevel is thrown to monkey ${monkey.testTrue}');
          monkeys[monkey.testTrue]!.items.add(newLevel);
        } else {
          // debugPrint(
          //     'Current Worry Level not divisible by ${monkey.testValue}, item with worry level $newLevel is thrown to monkey ${monkey.testFalse}');
          monkeys[monkey.testFalse]!.items.add(newLevel);
        }
        monkey.timesInspected++;
      }
      monkey.items = [];
    }
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();

    for (var i = 0; i < 20; i++) {
      doPartOneCycle();
    }

    final result = monkeys.values.map((e) => e.timesInspected).toList();
    result.sort();

    final answer = result.reversed
        .take(2)
        .reduce((value, element) => value * element)
        .toString();

    return PartResult(result: answer);
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();
    for (var i = 1; i <= 10000; i++) {
      doPartTwoCycle();
      if ({1, 20, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000}
          .contains(i)) {
        //debugPrint("== After round $i ==");
        for (final monkey in monkeys.values) {
          // debugPrint(
          //   "Monkey ${monkey.number} has inspected items ${monkey.timesInspected} times",
          // );
        }
      }
    }

    final result = monkeys.values.map((e) => e.timesInspected).toList();
    result.sort();

    final answer = result.reversed
        .take(2)
        .reduce((value, element) => value * element)
        .toString();

    return PartResult(result: answer);
  }
}
