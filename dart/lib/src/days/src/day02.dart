import 'package:aoc2022/src/days/base_day.dart';

class Day02Logic extends BaseDayLogic {
  final Map<String, int> rpsScores = <String, int>{};
  final Map<String, int> rpsChoiceValues = <String, int>{};
  final Map<String, String> rpsWinLoseMatrix = <String, String>{};
  final Map<String, int> p1Results = <String, int>{};
  final Map<String, int> p2Results = <String, int>{};

  Day02Logic(super.dayNumber, super.title) {
    rpsChoiceValues.addAll({"X": 1, "Y": 2, "Z": 3});

    rpsScores.addAll({
      "A X": 3,
      "A Y": 6,
      "A Z": 0,
      "B X": 0,
      "B Y": 3,
      "B Z": 6,
      "C X": 6,
      "C Y": 0,
      "C Z": 3
    });

    rpsWinLoseMatrix.addAll({
      "A X": "Z",
      "A Y": "X",
      "A Z": "Y",
      "B X": "X",
      "B Y": "Y",
      "B Z": "Z",
      "C X": "Y",
      "C Y": "Z",
      "C Z": "X"
    });

    p1Results.addAll({
      "A X": 1 + 3,
      "A Y": 2 + 6,
      "A Z": 3 + 0,
      "B X": 1 + 0,
      "B Y": 2 + 3,
      "B Z": 3 + 6,
      "C X": 1 + 6,
      "C Y": 2 + 0,
      "C Z": 3 + 3
    });

    p2Results.addAll({
      "A X": 3 + 0,
      "A Y": 1 + 3,
      "A Z": 2 + 6,
      "B X": 1 + 0,
      "B Y": 2 + 3,
      "B Z": 3 + 6,
      "C X": 2 + 0,
      "C Y": 3 + 3,
      "C Z": 1 + 6
    });
  }

  int scoreMatch(String matchString) {
    return rpsScores[matchString]! +
        rpsChoiceValues[matchString.split(' ')[1]]!;
  }

  int winLoseMatch(String matchString) {
    return scoreMatch(
      "${matchString.split(' ')[0]} ${rpsWinLoseMatrix[matchString]}",
    );
  }

  @override
  Future<PartResult> partOne() async {
    final input = await loadDayFileLines();

    final matchScore = input
        .map((i) => scoreMatch(i))
        .reduce((value, element) => value + element)
        .toString();

    final matchScoreCheat = input
        .map((i) => p1Results[i]!)
        .reduce((value, element) => value + element)
        .toString();

    return PartResult(result: '$matchScore - $matchScoreCheat');
  }

  @override
  Future<PartResult> partTwo() async {
    final input = await loadDayFileLines();

    final matchScore = input
        .map((i) => winLoseMatch(i))
        .reduce((value, element) => value + element)
        .toString();

    final matchScoreCheat = input
        .map((i) => p2Results[i]!)
        .reduce((value, element) => value + element)
        .toString();

    return PartResult(result: '$matchScore - $matchScoreCheat');
  }
}
