import 'package:aoc2023/src/days/base_day.dart';
import 'package:aoc2023/src/days/logic_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logic_results.freezed.dart';
part 'logic_results.g.dart';

@riverpod
Future<CalcDaysResults> calcLogicResults(
  CalcLogicResultsRef ref, {
  required LogicCollection dayLogics,
}) async {
  final outLogicResults = <int, DaysResults>{};
  dayLogics.logics.forEach((key, value) async {
    outLogicResults.addAll({
      key: DaysResults(
        partOneResult: await value.processPartOne(),
        partTwoResult: await value.processPartTwo(),
      ),
    });
  });
  return CalcDaysResults(results: outLogicResults, isInitialized: true);
}

final logicResultsProvider =
    NotifierProvider<LogicResultsNotifier, CalcDaysResults>(
  LogicResultsNotifier.new,
);

class LogicResultsNotifier extends Notifier<CalcDaysResults> {
  LogicResultsNotifier();

  CalcDaysResults? _cachedState;

  @override
  CalcDaysResults build() {
    if (_cachedState == null) {
      ref
          .read(
        calcLogicResultsProvider(
          dayLogics: ref.read(logicCollectionProvider),
        ).future,
      )
          .then((value) async {
        _cachedState = CalcDaysResults(
          results: value.results,
          isInitialized: true,
        );
        state = state.copyWith(results: value.results, isInitialized: true);
      });
    }

    return _cachedState ?? CalcDaysResults();
  }
}

@freezed
class DaysResults with _$DaysResults {
  factory DaysResults({
    required DayResult partOneResult,
    required DayResult partTwoResult,
  }) = _DaysResults;
}

@freezed
class CalcDaysResults with _$CalcDaysResults {
  factory CalcDaysResults({
    Map<int, DaysResults>? results,
    @Default(false) bool isInitialized,
  }) = _CalcDaysResults;
}
