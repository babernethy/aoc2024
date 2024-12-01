import 'package:aoc2023/app/aoc_utils.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_day.freezed.dart';

@freezed
class DayResult with _$DayResult {
  factory DayResult({
    required String result,
    required num computeTime,
    Object? extra,
  }) = _DayResult;
}

@freezed
class PartResult with _$PartResult {
  factory PartResult({
    required String result,
    Object? extra,
  }) = _PartResult;
}

class BaseDayLogic {
  BaseDayLogic(this.dayNumber, this.title);
  final int dayNumber;
  final String title;
  String get fileString => "${dayNumber.toString().padLeft(2, '0')}.txt";
  Future<String> loadDayFileString() async {
    return loadFileString(fileString);
  }

  Widget dayImage() {
    const imgHeight = 300.0;
    return Image(
      height: imgHeight,
      image: AssetImage('assets/images/$dayNumber.png'),
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Image(
          height: imgHeight,
          image: AssetImage('assets/images/default.png'),
        );
      },
    );
  }

  Future<List<String>> loadDayFileLines() async {
    final file = await loadDayFileString();
    return file.split('\n');
  }

  Future<List<String>> loadDayFileChunks() async {
    final file = await loadDayFileString();
    return file.split('\n\n');
  }

  Future<List<List<String>>> loadDayFileChunksLines() async {
    final chunks = await loadDayFileChunks();
    final chunkList = chunks.map((e) => e.split("\n")).toList();
    return chunkList;
  }

  Future<DayResult> processPartOne() async {
    final start = DateTime.now();
    final result = await partOne();
    return DayResult(
      result: result.result,
      extra: result.extra,
      computeTime: DateTime.now().difference(start).inMilliseconds,
    );
  }

  Future<DayResult> processPartTwo() async {
    final start = DateTime.now();
    final result = await partTwo();
    return DayResult(
      result: result.result,
      extra: result.extra,
      computeTime: DateTime.now().difference(start).inMilliseconds,
    );
  }

  Future<PartResult> partOne() async {
    return PartResult(result: 'not implemented');
  }

  Future<PartResult> partTwo() async {
    return PartResult(result: 'not implemented');
  }
}
