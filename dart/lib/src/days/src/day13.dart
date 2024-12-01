import 'dart:convert';
import 'package:aoc2022/src/days/base_day.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'day13.freezed.dart';

@unfreezed
class Packet with _$Packet {
  factory Packet({
    required String? left,
    required String? right,
    String? leftMatch,
    String? rightMatch,
  }) = _Packet;
}

class Day13Logic extends BaseDayLogic {
  String input;
  List<Packet> packets = [];
  Day13Logic(super.dayNumber, super.title)
      : input = """
[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]""";

  Future<void> initialize() async {
    // input = await loadDayFileString();
    packets = input
        .split("\n\n")
        .map((e) => e.split("\n"))
        .map((e) => Packet(left: e[0], right: e[1]))
        .toList();
  }

  String? partToMatch(String? packetString) {
    if (packetString == null ||
        packetString == "[]" ||
        packetString == "[[]]") {
      return null;
    }
    final parts = jsonDecode(packetString) as List<dynamic>;
    if (parts.isEmpty) {
      return null;
    }
    if (parts[0] is List) {
      return partToMatch(jsonEncode(parts[0]));
    }
    return parts[0].toString();
  }

  String? remainderString(String? packetString) {
    if (packetString == null || packetString == "[]") {
      return null;
    }
    final outList = [];
    final parts = jsonDecode(packetString) as List<dynamic>;
    if (parts[0] is List && (parts[0] as List).length > 1) {
      outList.add(reduceByOne(parts[0] as List<dynamic>));
    }
    for (var i = 1; i < parts.length; i++) {
      outList.add(parts[i]);
    }
    return jsonEncode(outList);
  }

  List<dynamic> reduceByOne(List<dynamic> inList) {
    final outList = [];
    for (var i = 1; i < inList.length; i++) {
      outList.add(inList[i]);
    }
    return outList;
  }

  Packet partsToMatch(Packet packet) {
    return Packet(
      left: remainderString(packet.left),
      right: remainderString(packet.right),
      leftMatch: partToMatch(packet.left),
      rightMatch: partToMatch(packet.right),
    );
  }

  bool isValidPacket(Packet packet) {
    var isDone = false;
    var isValid = false;
    var currentPacket = packet;
    while (!isDone) {
      final checkPacket = partsToMatch(currentPacket);
      if (checkPacket.rightMatch == null) {
        // debugPrint('false: right is null or empty: $checkPacket');
        isDone = true;
        isValid = false;
      } else if (checkPacket.leftMatch == null) {
        // debugPrint('true: left is null or empty: $checkPacket');
        isDone = true;
        isValid = true;
      } else {
        final leftVal = int.parse(checkPacket.leftMatch!);
        final rightVal = int.parse(checkPacket.rightMatch!);
        if (leftVal > rightVal) {
          isDone = true;
          isValid = false;
        } else if (leftVal < rightVal) {
          isDone = true;
          isValid = true;
        } else if (leftVal != rightVal) {
          //  debugPrint("what happened?");
        }
      }
      currentPacket = checkPacket;
    }
    return isValid;
  }

  @override
  Future<PartResult> partOne() async {
    await initialize();

    final test0 = partsToMatch(packets[0]);
    final test1 = partsToMatch(packets[1]);
    final test2 = partsToMatch(packets[2]);
    final test3 = partsToMatch(packets[3]);

    final iv0 = isValidPacket(packets[0]);
    final iv1 = isValidPacket(packets[1]);

    var i = 1;
    var total = 0;
    for (final p in packets) {
      final isValid = isValidPacket(p);
      if (isValid) {
        total += i;
      }
      //debugPrint('$i $p: ${isValidPacket(p).toString()}');
      i++;
    }

    return PartResult(result: total.toString());
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();

    return PartResult(result: "not implemented");
  }
}
