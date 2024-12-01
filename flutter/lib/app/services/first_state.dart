import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'first_state.freezed.dart';
part 'first_state.g.dart';

@freezed
class FirstStateData with _$FirstStateData {
  factory FirstStateData({
    @Default(0) int counter,
  }) = _FirstStateData;
}

@riverpod
class FirstState extends _$FirstState {
  FirstStateData? _cachedState;

  @override
  FirstStateData build() {

    return _cachedState ?? FirstStateData();
  }

  void increment() {
    _cachedState = state.copyWith(counter: state.counter + 1);
    state = _cachedState!;
  }
}
