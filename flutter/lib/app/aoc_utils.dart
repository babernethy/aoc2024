import 'dart:async' show Future;
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadFileString(String name) async {
  return rootBundle.loadString('assets/data/$name');
  //  return rootBundle.loadString('assets/data/$name');
}

List<int> findNumbersInString(String input) {
  final List<int> numbers = List.empty(growable: true);
  final matches = RegExp(r'\d+').allMatches(input);
  for (final Match m in matches) {
    final match = int.parse(m[0]!);
    numbers.add(match);
  }
  return numbers;
}

Future<List<String>> loadFileStringList(String name) async {
  final file = await loadFileString(name);

  const LineSplitter ls = LineSplitter();
  final List<String> lines = ls.convert(file);

  return lines;
}

Future<List<int>> loadFileIntList(String name) async {
  final list = await loadFileStringList(name);

  return list.map(int.parse).toList();
}

class Stack<T> {
  final _queue = Queue<T>();

  void push(T element) {
    _queue.addLast(element);
  }

  T? pop() {
    return isEmpty ? null : _queue.removeLast();
  }

  T? peek() {
    return isEmpty ? null : _queue.last;
  }

  void clear() {
    _queue.clear();
  }

  bool get isEmpty => _queue.isEmpty;
  bool get isNotEmpty => _queue.isNotEmpty;
  int get length => this._queue.length;
}
