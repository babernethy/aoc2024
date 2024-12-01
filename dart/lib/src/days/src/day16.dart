import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day16.freezed.dart';

@unfreezed
class MagmaValve with _$MagmaValve {
  factory MagmaValve({
    required String name,
    required List<String> tunnelsTo,
    required int flowRate,
    required Map<String, int> shortestPath,
  }) = _MagmaValve;
//  MagmaValves._();
}

class Day16Logic extends BaseDayLogic {
  String input;
  List<MagmaValve> valves = [];
  Day16Logic(super.dayNumber, super.title)
      : input = """
Valve AA has flow rate=0; tunnels lead to valves DD, II, BB
Valve BB has flow rate=13; tunnels lead to valves CC, AA
Valve CC has flow rate=2; tunnels lead to valves DD, BB
Valve DD has flow rate=20; tunnels lead to valves CC, AA, EE
Valve EE has flow rate=3; tunnels lead to valves FF, DD
Valve FF has flow rate=0; tunnels lead to valves EE, GG
Valve GG has flow rate=0; tunnels lead to valves FF, HH
Valve HH has flow rate=22; tunnel leads to valve GG
Valve II has flow rate=0; tunnels lead to valves AA, JJ
Valve JJ has flow rate=21; tunnel leads to valve II""";

  Future<void> initialize() async {
    //input = await loadDayFileString();

    final rName = RegExp("Valve (.*) has");
    final rFlowRate = RegExp(r"[-]?\d+");
    final rTunnels = RegExp("to valves? (.*)");

    valves = input
        .split('\n')
        .map(
          (line) => MagmaValve(
            name: rName.firstMatch(line)!.group(1)!,
            tunnelsTo: rTunnels.firstMatch(line)!.group(1)!.split(", "),
            flowRate: int.parse(rFlowRate.firstMatch(line)!.group(0)!),
            shortestPath: <String, int>{},
          ),
        )
        .toList();

    calculateShortestPath(valves);
  }

  void calculateShortestPath(List<MagmaValve> valves) {
    for (final v in valves) {
      final target = v;
      final current = getValveByName(target.name)!;
      // current.shortestPath.addAll({v.name: 0});
      addUpdateShortestDistance(current.name, v.name, 0);
      shortestPath(valves, current, target);
    }
  }

  void addUpdateShortestDistance(String source, String target, int distance) {
    final vm = valves.where((v) => v.name == source);
    if (vm.isEmpty) {
      debugPrint("addUpdateShortestDistance: $source not found");
      return;
    }
    final v = vm.first;
    v.shortestPath.update(
      target,
      (value) => distance,
      ifAbsent: () => distance,
    );
  }

  MagmaValve? getValveByName(String name) {
    final vm = valves.where((v) => v.name == name);
    if (vm.isEmpty) {
      debugPrint("getValve $name not found");
      return null;
    }
    final v = vm.first;
    return v;
  }

  void shortestPath(
    List<MagmaValve> valves,
    MagmaValve start,
    MagmaValve target,
  ) {
    final visited = <String>{};
    var current = start;
    while (visited.length < valves.length) {
      visited.add(current.name);
      final distance = current.shortestPath[target] ?? 0 + 1;
      for (final t in current.tunnelsTo) {
        if (!visited.contains(t)) {
          final c = getValveByName(t)!;
          if (c.shortestPath.containsKey(target.name)) {
            if (distance < c.shortestPath[target.name]!) {
              addUpdateShortestDistance(c.name, target.name, distance);
            }
          } else {
            addUpdateShortestDistance(c.name, target.name, distance);
          }
        }
      }
      final currentNew = valves
          .where(
            (c) =>
                !visited.contains(c.name) && c.shortestPath.containsKey(target),
          )
          .toList();
      if (currentNew.isEmpty) {
        break;
      }
      currentNew
          .sort((a, b) => a.shortestPath[target]! - b.shortestPath[target]!);

      current = currentNew.first;
    }
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();

    return PartResult(result: "not implemented");
  }

  @override
  Future<PartResult> partTwo() async {
    //await initialize();

    return PartResult(result: "not implemented");
  }
}
