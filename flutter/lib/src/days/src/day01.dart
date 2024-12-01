import 'package:aoc2023/src/days/base_day.dart';

class Day01Logic extends BaseDayLogic {
  Day01Logic(super.dayNumber, super.title);

  int numFirstLast(String input) {
    final pair = findFirstAndLast(input);
    return pair.first * 10 + pair.last;
  }

  ({int first, int last}) findFirstAndLast(String input) {
    final List<int> numbers = List.empty(growable: true);
    final characters = input.split('');
    for (var i = 0; i < characters.length; i++) {
      final val = int.tryParse(characters[i]);
      if (val == null) continue;
      numbers.add(val);
    }
    return (first: numbers.first, last: numbers.last);
  }

  ({int first, int last}) findFirstAndLastWithLetters(String input) {
    final List<int> numbers = List.empty(growable: true);
    final characters = input.split('');
    for (var i = 0; i < characters.length; i++) {
      final val = int.tryParse(characters[i]);
      if (val == null) {
        final length = i + 5 < input.length ? 5 : input.length - i;
        final nextNumber =
            areNextLettersANumberMap(input.substring(i, i + length));
        if (nextNumber != null) {
          numbers.add(nextNumber);
        }
        continue;
      }
      numbers.add(val);
    }
    return (first: numbers.first, last: numbers.last);
  }

  int? areNextLettersANumberMap(String input) {
    const numberMap = {
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9,
    };

    for (final entry in numberMap.entries) {
      if (input.startsWith(entry.key)) {
        return entry.value;
      }
    }
    return null;
  }

  @override
  Future<PartResult> partOne() async {
    return PartResult(
      result: (await loadDayFileString()).split('\n').fold(
            '0',
            (prev, element) => '${int.parse(prev) + numFirstLast(element)}',
          ),
    );
  }

  @override
  Future<PartResult> partTwo() async {
    return PartResult(
      result:
          (await loadDayFileString()).split('\n').fold('0', (prev, element) {
        final pair = findFirstAndLastWithLetters(element);
        final twoDigit = pair.first * 10 + pair.last;
        return '${int.parse(prev) + twoDigit}';
      }),
    );
  }
}
