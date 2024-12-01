// ignore_for_file: curly_braces_in_flow_control_structures
import 'dart:math';
import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day19.freezed.dart';

@freezed
class Blueprint with _$Blueprint {
  factory Blueprint({
    required int number,
    required int oreCost,
    required int clayOreCost,
    required int obsOreCost,
    required int obsClayCost,
    required int geodeOreCost,
    required int geodeObsCost,
  }) = _Blueprint;
  const factory Blueprint.parse(
    int number,
    int oreCost,
    int clayOreCost,
    int obsOreCost,
    int obsClayCost,
    int geodeOreCost,
    int geodeObsCost,
  ) = _BlueprintParse;
  const Blueprint._();
  int get maxOre =>
      [oreCost, clayOreCost, obsOreCost, geodeOreCost].reduce(max);
}

enum BuildBotType {
  wait,
  ore,
  clay,
  obs,
  geode,
}

@unfreezed
class BpRunCycle with _$BpRunCycle {
  factory BpRunCycle({
    required Blueprint bp,
    required String id,
    required int minute,
    required int ore,
    required int clay,
    required int obs,
    required int geode,
    required int oreRobots,
    required int clayRobots,
    required int obsRobots,
    required int geodeRobots,
    required Map<int, int> maxGeodeLog,
  }) = _BpRunCycle;
  const BpRunCycle._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BpRunCycle &&
            (identical(other.ore, ore) || other.ore == ore) &&
            (identical(other.clay, clay) || other.clay == clay) &&
            (identical(other.obs, obs) || other.obs == obs) &&
            (identical(other.geode, geode) || other.geode == geode) &&
            (identical(other.oreRobots, oreRobots) ||
                other.oreRobots == oreRobots) &&
            (identical(other.clayRobots, clayRobots) ||
                other.clayRobots == clayRobots) &&
            (identical(other.obsRobots, obsRobots) ||
                other.obsRobots == obsRobots) &&
            (identical(other.geodeRobots, geodeRobots) ||
                other.geodeRobots == geodeRobots));
  }

  int get totalQuality => bp.number * geode;

  List<BuildBotType> buildOptions() {
    final options = <BuildBotType>[];
    if (ore >= bp.geodeOreCost && obs >= bp.geodeObsCost) {
      options.add(BuildBotType.geode);
      return options; // if you can build geode should build geode
    }
    options.add(BuildBotType.wait); // when to wait?
    if (ore >= bp.oreCost &&
        oreRobots < bp.maxOre) // never build ore if >maxOre
      options.add(BuildBotType.ore);
    if (ore >= bp.clayOreCost && clayRobots < bp.obsClayCost)
      options.add(BuildBotType.clay); // always build clay or wait for obs?
    if (ore >= bp.obsOreCost && clay >= bp.obsClayCost)
      options.add(BuildBotType.obs); // always build obs or wait for geode?
    return options;
  }

  List<BpRunCycle> cloningMachine() {
    final clones = <BpRunCycle>[];
    int i = 0;
    for (final option in buildOptions()) {
      final clone = copyWith(minute: minute + 1, id: '$id$i');
      clone.runRobots();
      clone.buildBot(option);
      clones.add(clone);
      i++;
    }
    final outThis = clones.where((e) => e.maxGeodesPossible > 0).toList();
    return outThis;
  }

  void runRobots() {
    ore += oreRobots;
    clay += clayRobots;
    obs += obsRobots;
    geode += geodeRobots;
  }

  void buildBot(BuildBotType bbt) {
    switch (bbt) {
      case BuildBotType.ore:
        oreRobots++;
        ore -= bp.oreCost;
        break;
      case BuildBotType.clay:
        clayRobots++;
        ore -= bp.clayOreCost;
        break;
      case BuildBotType.obs:
        obsRobots++;
        ore -= bp.obsOreCost;
        clay -= bp.obsClayCost;
        break;
      case BuildBotType.geode:
        geodeRobots++;
        ore -= bp.geodeOreCost;
        obs -= bp.geodeObsCost;
        break;
      case BuildBotType.wait:
        // build nothing this minute
        break;
    }
  }

  int get maxGeodesPossible {
    // need a way to nuke clones that will never produce a geode
    var geodesPossible = geode;

    var myGeoRobots = geodeRobots;
    var myObsRobots = obsRobots;
    var myClayRobots = clayRobots;

    var myClay = clay;
    var myObs = obs;

    final myObsCost = bp.obsOreCost;
    final myClayCost = bp.clayOreCost;

    for (var i = minute; i < 24; i++) {
      var newClayRobotCount = myClayRobots;
      var newObsidianRobotCount = myObsRobots;
      var newGeodeRobotCount = myClayRobots;

      if (myObs >= myObsCost) {
        myObs -= myObsCost;
        newGeodeRobotCount++;
      }
      if (myClay >= myClayCost) {
        myClay -= myClayCost;
        newObsidianRobotCount++;
      }
      newClayRobotCount++;

      myClay += myClayRobots;
      myObs += myObsRobots;
      geodesPossible += myGeoRobots;

      myGeoRobots = newGeodeRobotCount;
      myObsRobots = newObsidianRobotCount;
      myClayRobots = newClayRobotCount;
    }

    return geodesPossible;
  }

  @override
  String toString() {
    return '$id: [$ore, $clay, $obs, $geode] ${maxGeodeLog.values} [$oreRobots, $clayRobots, $obsRobots, $geodeRobots]';
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(
        ore,
        clay,
        obs,
        geode,
        oreRobots,
        clayRobots,
        obsRobots,
        geodeRobots,
      );

  // @override
  //   // TODO: implement hashCode
  // int get hashCode => super.hashCode;

}

class Day19Logic extends BaseDayLogic {
  String input;
  List<Blueprint> blueprints = [];
  Day19Logic(super.dayNumber, super.title)
      : input = """
Blueprint 1: Each ore robot costs 4 ore. Each clay robot costs 2 ore. Each obsidian robot costs 3 ore and 14 clay. Each geode robot costs 2 ore and 7 obsidian.
Blueprint 2: Each ore robot costs 2 ore. Each clay robot costs 3 ore. Each obsidian robot costs 3 ore and 8 clay. Each geode robot costs 3 ore and 12 obsidian.""";

  Future<void> initialize() async {
    // input = await loadDayFileString();
    final digits = RegExp(r"(\d+)");

    blueprints = input
        .split('\n')
        .map(
          (line) => digits
              .allMatches(line)
              .map((e) => int.parse(e.group(1)!))
              .toList(),
        )
        .map((e) => Blueprint.parse(e[0], e[1], e[2], e[3], e[4], e[5], e[6]))
        .toList();
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();

    var totalQuality = 0;

    for (final bp in blueprints) {
      //debugPrint('----------- Blueprint ${bp.number} -----------');
      var minute = 0;

      final initialClone = BpRunCycle(
        bp: bp,
        id: '0',
        minute: 1,
        ore: 0,
        clay: 0,
        obs: 0,
        geode: 0,
        oreRobots: 1,
        clayRobots: 0,
        obsRobots: 0,
        geodeRobots: 0,
        maxGeodeLog: <int, int>{},
      );

      var clones = [initialClone];

      while (minute < 24) {
        //debugPrint(
        // '----------- Minute ${minute + 1}: ${clones.length} clones -----------');
        final potential =
            clones.map((e) => e.maxGeodesPossible).toSet().toList();
        potential.sort();
        //debugPrint('Potential: $potential');

        final nextCycles = <BpRunCycle>[];

        for (final cycle in clones) {
          nextCycles.addAll(cycle.cloningMachine());
        }
        final preSet = nextCycles.toList().length.toString();
        nextCycles.toSet().toList();

        final postSet = nextCycles.toList().length.toString();
        if (nextCycles.isEmpty) {
          break;
        }
        //debugPrint('preSet: $preSet, postSet: $postSet');
        final mostGeodes = nextCycles.map((e) => e.geode).reduce(max);

        clones = nextCycles.where((e) => e.geode == mostGeodes).toList();

        minute++;
      }

      final mostGeodes =
          clones.isEmpty ? 0 : clones.map((e) => e.geode).reduce(max);

      final matchingCycles = clones
          .where(
            (e) =>
                e.geodeRobots == 2 &&
                e.obsRobots == 2 &&
                e.clayRobots == 4 &&
                e.oreRobots == 1,
          )
          .toList();
      for (final cycle in matchingCycles) {
        //debugPrint(cycle.toString());
      }
      //debugPrint(
      //   'Blueprint quality for ${bp.number * mostGeodes}',
      // );

      totalQuality += bp.number * mostGeodes;
      clones.clear();
    }

    return PartResult(result: "$totalQuality");
  }

  @override
  Future<PartResult> partTwo() async {
    //await initialize();

    return PartResult(result: "not implemented");
  }
}
