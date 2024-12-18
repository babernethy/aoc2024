import 'dart:math';

import 'package:aoc2023/src/days/base_day.dart';

class Day04Logic extends BaseDayLogic {
  String input;
  List<List<String>> matrix = [];
  final Map<int, (String, String)> cards = {};
  final Map<int, int> cardCounts = {};

  Future<void> initialize() async {
    input = await loadDayFileString();

    final lines = input.split('\n');
    for (final line in lines) {
      final cardNumber = int.parse(line.split(':')[0].split(' ').last);
      final card = line.split(':')[1].trim();
      final cardParts = card.split('|');
      cards.addAll({cardNumber: (cardParts[0], cardParts[1])});
      cardCounts.addAll({cardNumber: 1});
    }
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

  Day04Logic(super.dayNumber, super.title)
      : input = """
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11""";

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    final lines = input.split('\n');
    int total = 0;
    for (final l in lines) {
      final lists = l.split(':')[1].split('|');
      final myNumbers = findNumbers(lists[0]);
      final winningNumbers = findNumbers(lists[1]);
      final sameNumbers =
          myNumbers.where((element) => winningNumbers.contains(element));
      total += sameNumbers.isEmpty ? 0 : pow(2, sameNumbers.length - 1).round();
    }
    return PartResult(result: "$total");
  }

  @override
  Future<PartResult> partTwo() async {
    await initialize();

    int totalCards = 0;
    for (final card in cards.keys) {
      final myCard = cards[card]!.$1;
      final winningCard = cards[card]!.$2;
      final myNums = findNumbers(myCard);
      final winningNums = findNumbers(winningCard);
      final sameNumbers =
          myNums.where((element) => winningNums.contains(element));
      if (sameNumbers.isNotEmpty) {
        for (var i = 1; i <= sameNumbers.length; i++) {
          if (cardCounts.containsKey(card + i)) {
            cardCounts[card + i] = cardCounts[card + i]! + cardCounts[card]!;
          }
        }
      }
      totalCards += cardCounts[card]!;
    }

    return PartResult(result: "$totalCards");
  }
}
