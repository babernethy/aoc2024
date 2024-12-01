import 'package:aoc2023/src/days/base_day.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

class Hand {
  final List<CamelCards> cards;
  final int bid;
  int? value;
  HandType? handType;

  Hand({required this.cards, required this.bid});
}

enum HandType {
  highCard(1),
  onePair(2),
  twoPair(3),
  threeOfAKind(4),
  fullHouse(5),
  fourOfAKind(6),
  fiveOfAKind(7);

  const HandType(this.value);
  final int value;
}

enum CamelCards {
  A(14),
  K(13),
  Q(12),
  J(11),
  T(10),
  nine(9),
  eight(8),
  seven(7),
  six(6),
  five(5),
  four(4),
  three(3),
  two(2);

  const CamelCards(this.value);
  final int value;
}

CamelCards camelCardsFromString(String value) {
  if (int.tryParse(value) == null) {
    return CamelCards.values
        .firstWhere((e) => e.toString() == 'CamelCards.$value');
  }
  return CamelCards.values.firstWhere(
    (e) =>
        e.toString() ==
        'CamelCards.${NumberToWordsEnglish.convert(int.parse(value))}',
  );
}

class Day07Logic extends BaseDayLogic {
  String input;
  final List<Hand> hands = List.empty(growable: true);

  Future<void> initialize() async {
    final lines = input.split('\n');
    hands.clear();
    for (final line in lines) {
      final split = line.split(' ');
      final cards =
          split[0].split('').map((e) => camelCardsFromString(e)).toList();
      final bid = int.parse(split[1]);
      final hand = Hand(cards: cards, bid: bid);
      final thisHand = getHandType(hand);
      hand.handType = thisHand;

      hands.add(hand);
    }
  }

  int jokerValue(CamelCards card) {
    if (card == CamelCards.J) {
      return 0;
    }
    return card.value;
  }

  int handCompare(Hand hand1, Hand hand2, {bool doApplyJokers = false}) {
    if (doApplyJokers) {
      final jHand1 = applyJokers(hand1);
      final jHand2 = applyJokers(hand2);
      if (jHand1.handType!.value > jHand2.handType!.value) {
        return 1;
      } else if (jHand1.handType!.value < jHand2.handType!.value) {
        return -1;
      }
    } else {
      if (hand1.handType!.value > hand2.handType!.value) {
        return 1;
      } else if (hand1.handType!.value < hand2.handType!.value) {
        return -1;
      }
    }
    if (doApplyJokers) {
      int cardIndex = 0;
      while (cardIndex < hand1.cards.length) {
        if (jokerValue(hand1.cards[cardIndex]) >
            jokerValue(hand2.cards[cardIndex])) {
          return 1;
        } else if (jokerValue(hand1.cards[cardIndex]) <
            jokerValue(hand2.cards[cardIndex])) {
          return -1;
        }
        cardIndex++;
      }
    } else {
      int cardIndex = 0;
      while (cardIndex < hand1.cards.length) {
        if (hand1.cards[cardIndex].value > hand2.cards[cardIndex].value) {
          return 1;
        } else if (hand1.cards[cardIndex].value <
            hand2.cards[cardIndex].value) {
          return -1;
        }
        cardIndex++;
      }
    }
    return 0;
  }

  Hand applyJokers(Hand hand) {
    final Map<CamelCards, int> cardValueCounts =
        hand.cards.fold({}, (map, element) {
      if (map.containsKey(element)) {
        map[element] = map[element]! + 1;
      } else {
        map[element] = 1;
      }
      return map;
    });

    if (!cardValueCounts.keys.contains(CamelCards.J) ||
        cardValueCounts.length == 1) {
      return hand;
    }

    final jokerCount = cardValueCounts[CamelCards.J]!;
    cardValueCounts.remove(CamelCards.J);

    final sortedByValueMap = Map.fromEntries(
      cardValueCounts.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value)),
    );

    final List<CamelCards> newCards = List.empty(growable: true);
    for (final entry in sortedByValueMap.entries) {
      if (entry.key == sortedByValueMap.entries.first.key) {
        for (int i = 0; i < jokerCount; i++) {
          newCards.add(entry.key);
        }
      }
      for (int i = 0; i < entry.value; i++) {
        newCards.add(entry.key);
      }
    }

    final outHand = Hand(cards: newCards, bid: hand.bid);
    final thisHand = getHandType(outHand);
    outHand.handType = thisHand;

    return outHand;
  }

  HandType getHandType(Hand hand) {
    final cardValueCounts = hand.cards.fold({}, (map, element) {
      if (map.containsKey(element)) {
        map[element] = map[element]! + 1;
      } else {
        map[element] = 1;
      }
      return map;
    });

    switch (cardValueCounts.length) {
      case 1:
        return HandType.fiveOfAKind;
      case 2:
        if (cardValueCounts.containsValue(4)) {
          return HandType.fourOfAKind;
        } else {
          return HandType.fullHouse;
        }
      case 3:
        if (cardValueCounts.containsValue(3)) {
          return HandType.threeOfAKind;
        } else {
          return HandType.twoPair;
        }
      case 4:
        return HandType.onePair;
    }

    return HandType.highCard;
  }

  Day07Logic(super.dayNumber, super.title)
      : input = """
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483""";

  @override
  Future<PartResult> partOne() async {
    input = await loadDayFileString();
    initialize();
    hands.sort((a, b) => handCompare(a, b));
    int rank = 1;
    int total = 0;
    for (final hand in hands) {
      total += hand.bid * rank;
      rank++;
    }
    return PartResult(result: "$total");
  }

  @override
  Future<PartResult> partTwo() async {
    input = await loadDayFileString();
    initialize();
    hands.sort((a, b) => handCompare(a, b, doApplyJokers: true));
    int rank = 1;
    int total = 0;
    for (final hand in hands) {
      total += hand.bid * rank;
      rank++;
    }
    return PartResult(result: "$total");
  }
}
