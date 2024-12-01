import 'package:aoc2023/src/days/base_day.dart';

class Day02Logic extends BaseDayLogic {
  String input;
  static const int maxRed = 12;
  static const int maxGreen = 13;
  static const int maxBlue = 14;

  Day02Logic(super.dayNumber, super.title)
      : input = """
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green""";

  int? gameNumber(String line) {
    //  RegExp regExp = RegExp(r"([^ ]+):");

    final match = RegExp(r'Game (\d+):').firstMatch(line);
    if (match == null) return null;
    return int.parse(match.group(1)!);
  }

  // ({int red, int green, int blue}) findRGB(String input) {
  //   final parts = input.split(',').map((e) => e.trim().split(' ')).toList();
  //   return (first: numbers.first, last: numbers.last);
  // }

  Map<String, int> findRGBMap(String input) {
    final map = <String, int>{};
    final sets = input.split(';');
    for (final set in sets) {
      final parts = set.split(',').map((e) => e.trim().split(' ')).toList();
      for (final part in parts) {
        final color = part[1];
        final number = int.parse(part[0]);
        if (!map.containsKey(color)) {
          map.addAll({color: number});
        } else {
          if (map[color]! < number) {
            map[color] = number;
          }
        }
      }
    }
    return map;
  }

  bool isGameValid(Map<String, int> map) {
    final red = map['red'] ?? 0;
    final green = map['green'] ?? 0;
    final blue = map['blue'] ?? 0;
    return red <= maxRed && green <= maxGreen && blue <= maxBlue;
  }

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    final lines = input.split('\n');
    var total = 0;
    for (final line in lines) {
      final game = gameNumber(line);
      final map = findRGBMap(line.split(':')[1].trim());
      final isValid = isGameValid(map);
      // debugPrint("game $game is valid: $isValid - $line");
      if (isValid) {
        total += game!;
      }
    }
    return PartResult(result: "$total");
  }

  @override
  Future<PartResult> partTwo() async {
    input = await loadDayFileString();
    final lines = input.split('\n');
    var total = 0;
    for (final line in lines) {
      final map = findRGBMap(line.split(':')[1].trim());
      final power = map['red']! * map['green']! * map['blue']!;
      total += power;
    }
    return PartResult(result: "$total");
  }
}
