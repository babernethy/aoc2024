import 'package:aoc2022/src/days/base_day.dart';

class Day01Logic extends BaseDayLogic {
  Day01Logic(super.dayNumber, super.title);

  Future<List<int>> caloriesPerElf() async {
    final perElf = (await loadDayFileString())
        .split('\n\n')
        .map((block) => block.split('\n').map((cal) => int.parse(cal)))
        .map((elf) => elf.reduce((value, element) => value + element))
        .toList();
    perElf.sort();
    return perElf;
  }

  @override
  Future<PartResult> partOne() async {
    final perElf = await caloriesPerElf();
    return PartResult(result: perElf.last.toString());
  }

  @override
  Future<PartResult> partTwo() async {
    final perElf = await caloriesPerElf();

    return PartResult(
        result: perElf.reversed
            .take(3)
            .reduce((value, element) => value + element)
            .toString());
  }
}
