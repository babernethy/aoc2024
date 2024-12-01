import 'package:aoc2023/src/days/base_day.dart';
import 'package:flutter/foundation.dart';

class Day05Logic extends BaseDayLogic {
  String input;
  final List<int> seeds = List.empty(growable: true);
  final List<(int, int)> seedCollection = List.empty(growable: true);
  final Map<(int, int), int> seedSoilMap = {};
  final Map<(int, int), int> soilFertilizerMap = {};
  final Map<(int, int), int> fertilizerWaterMap = {};
  final Map<(int, int), int> waterLightMap = {};
  final Map<(int, int), int> lightTemperatureMap = {};
  final Map<(int, int), int> temperatureHumidityMap = {};
  final Map<(int, int), int> humidityLocationMap = {};

  Future<void> initialize() async {
    final sections = input.split('\n\n');
    seeds.clear();
    seeds.addAll(findNumbers(sections[0].split('\n')[0]));
    seedCollection.clear();
    for (var i = 0; i < seeds.length; i = i + 2) {
      seedCollection.add((seeds[i], seeds[i + 1]));
    }
    final seedSoilLines = sections[1].trim().split('\n');
    for (final line in seedSoilLines) {
      final numbers = findNumbers(line);
      if (numbers.length == 3) {
        seedSoilMap.addAll({(numbers[1], numbers[2]): numbers[0]});
      }
    }
    final soilFertilizerLines = sections[2].trim().split('\n');
    for (final line in soilFertilizerLines) {
      final numbers = findNumbers(line);
      if (numbers.length == 3) {
        soilFertilizerMap.addAll({(numbers[1], numbers[2]): numbers[0]});
      }
    }
    final fertilizerWaterLines = sections[3].trim().split('\n');
    for (final line in fertilizerWaterLines) {
      final numbers = findNumbers(line);
      if (numbers.length == 3) {
        fertilizerWaterMap.addAll({(numbers[1], numbers[2]): numbers[0]});
      }
    }
    final waterLightLines = sections[4].trim().split('\n');
    for (final line in waterLightLines) {
      final numbers = findNumbers(line);
      if (numbers.length == 3) {
        waterLightMap.addAll({(numbers[1], numbers[2]): numbers[0]});
      }
    }
    final lightTemperatureLines = sections[5].trim().split('\n');
    for (final line in lightTemperatureLines) {
      final numbers = findNumbers(line);
      if (numbers.length == 3) {
        lightTemperatureMap.addAll({(numbers[1], numbers[2]): numbers[0]});
      }
    }
    final temperatureHumidityLines = sections[6].trim().split('\n');
    for (final line in temperatureHumidityLines) {
      final numbers = findNumbers(line);
      if (numbers.length == 3) {
        temperatureHumidityMap.addAll({(numbers[1], numbers[2]): numbers[0]});
      }
    }
    final humidityLocationLines = sections[7].trim().split('\n');
    for (final line in humidityLocationLines) {
      final numbers = findNumbers(line);
      if (numbers.length == 3) {
        humidityLocationMap.addAll({(numbers[1], numbers[2]): numbers[0]});
      }
    }
  }

  int valueToMap(int value, Map<(int, int), int> map) {
    for (final entry in map.entries) {
      if (value >= entry.key.$1 && value <= (entry.key.$1 + entry.key.$2)) {
        return entry.value + (value - entry.key.$1);
      }
    }
    return value;
  }

  int valueFromMap(int value, Map<(int, int), int> map) {
    for (final entry in map.entries) {
      if (value >= entry.value && value <= (entry.value + entry.key.$2)) {
        return entry.key.$1 + (value - entry.value);
      }
    }
    return value;
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

  int seedToLocation(int seed) {
    final soil = valueToMap(seed, seedSoilMap);
    final fertilizer = valueToMap(soil, soilFertilizerMap);
    final water = valueToMap(fertilizer, fertilizerWaterMap);
    final light = valueToMap(water, waterLightMap);
    final temperature = valueToMap(light, lightTemperatureMap);
    final humidity = valueToMap(temperature, temperatureHumidityMap);
    final location = valueToMap(humidity, humidityLocationMap);
    return location;
  }

  int locationToSeed(int location) {
    final humidity = valueFromMap(location, humidityLocationMap);
    final temperature = valueFromMap(humidity, temperatureHumidityMap);
    final light = valueFromMap(temperature, lightTemperatureMap);
    final water = valueFromMap(light, waterLightMap);
    final fertilizer = valueFromMap(water, fertilizerWaterMap);
    final soil = valueFromMap(fertilizer, soilFertilizerMap);
    final seed = valueFromMap(soil, seedSoilMap);
    return seed;
  }

  bool seedInCollection(int seed) {
    for (final entry in seedCollection) {
      if (seed >= entry.$1 && seed <= (entry.$1 + entry.$2)) {
        return true;
      }
    }
    return false;
  }

  Day05Logic(super.dayNumber, super.title)
      : input = """
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4""";

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    initialize();
    int lowest = 100000000000000000;
    for (final seed in seeds) {
      final location = seedToLocation(seed);
      if (location < lowest) {
        lowest = location;
      }
      final seed2 = locationToSeed(location);
      if (seed != seed2) {
        debugPrint('seed: $seed, seed2: $seed2');
      }
    }
    return PartResult(result: "$lowest - ${locationToSeed(lowest)}");
  }

  @override
  Future<PartResult> partTwo() async {
    int lowest = 28580000;
    while (!seedInCollection(locationToSeed(lowest))) {
      lowest++;
    }
    return PartResult(result: "$lowest - ${locationToSeed(lowest)}");
  }
}
