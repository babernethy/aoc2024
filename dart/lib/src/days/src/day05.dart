import 'package:aoc2022/app/aoc_utils.dart';
import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day05.freezed.dart';

@freezed
class MoveInstruction with _$MoveInstruction {
  factory MoveInstruction({
    required int move,
    required int from,
    required int to,
  }) = _MoveInstruction;
}

class Day05Logic extends BaseDayLogic {
  String input;

  Day05Logic(super.dayNumber, super.title)
      : input = """
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2""";

  @override
  Future<PartResult> partOne() async {
//    input = await loadDayFileString();
    final data = await loadDayFileChunks();
    final moves = data[1].split('\n').map((e) {
      final parts = e.split(' ');
      return MoveInstruction(
        move: int.parse(parts[1]),
        from: int.parse(parts[3]),
        to: int.parse(parts[5]),
      );
    }).toList();
    final crateData = data[0].split('\n').toList();
    final crates = List<Stack<String>>.empty(growable: true);

    for (var i = 0; i < 9; i++) {
      crates.add(Stack<String>());
    }
    for (final element in crateData.reversed) {
      if (element.contains('[')) {
        for (var i = 0; i < 9; i++) {
          if (element.length > i * 4 + 1 &&
              element.substring(i * 4, i * 4 + 1) == '[') {
            crates[i].push(element.substring(i * 4 + 1, i * 4 + 2));
          }
        }
      }
    }

    for (final move in moves) {
      // debugPrint(crates.map((e) => e.peek() ?? '_').join());
      for (var i = 0; i < move.move; i++) {
        final item = crates[move.from - 1].pop()!;
        crates[move.to - 1].push(item);
      }
    }

    final resultString = crates.map((e) => e.peek() ?? '*').join();

    return PartResult(result: resultString);
  }

  @override
  Future<PartResult> partTwo() async {
    // input = await loadFileString('05.txt');
    final data = await loadDayFileChunks();
    final moves = data[1].split('\n').map((e) {
      final parts = e.split(' ');
      return MoveInstruction(
        move: int.parse(parts[1]),
        from: int.parse(parts[3]),
        to: int.parse(parts[5]),
      );
    }).toList();
    final crateData = data[0].split('\n').toList();
    final crates = List<Stack<String>>.empty(growable: true);

    for (var i = 0; i < 9; i++) {
      crates.add(Stack<String>());
    }
    for (final element in crateData.reversed) {
      if (element.contains('[')) {
        for (var i = 0; i < 9; i++) {
          if (element.length > i * 4 + 1 &&
              element.substring(i * 4, i * 4 + 1) == '[') {
            crates[i].push(element.substring(i * 4 + 1, i * 4 + 2));
          }
        }
      }
    }

    for (final move in moves) {
      final stackToMove = Stack<String>();
      for (var i = 0; i < move.move; i++) {
        final item = crates[move.from - 1].pop()!;
        stackToMove.push(item);
      }
      for (var i = 0; i < move.move; i++) {
        final item = stackToMove.pop()!;
        crates[move.to - 1].push(item);
      }
    }

    final resultString = crates.map((e) => e.peek() ?? '*').join();

    return PartResult(result: resultString);
  }
}
