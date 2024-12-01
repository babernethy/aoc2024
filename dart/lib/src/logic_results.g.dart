// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic_results.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $calcLogicResultsHash() => r'47d768762a0dacb48ac3b686bd49a30051be8579';

/// See also [calcLogicResults].
class CalcLogicResultsProvider
    extends AutoDisposeFutureProvider<CalcDaysResults> {
  CalcLogicResultsProvider({
    required this.dayLogics,
  }) : super(
          (ref) => calcLogicResults(
            ref,
            dayLogics: dayLogics,
          ),
          from: calcLogicResultsProvider,
          name: r'calcLogicResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $calcLogicResultsHash,
        );

  final LogicCollection dayLogics;

  @override
  bool operator ==(Object other) {
    return other is CalcLogicResultsProvider && other.dayLogics == dayLogics;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dayLogics.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef CalcLogicResultsRef = AutoDisposeFutureProviderRef<CalcDaysResults>;

/// See also [calcLogicResults].
final calcLogicResultsProvider = CalcLogicResultsFamily();

class CalcLogicResultsFamily extends Family<AsyncValue<CalcDaysResults>> {
  CalcLogicResultsFamily();

  CalcLogicResultsProvider call({
    required LogicCollection dayLogics,
  }) {
    return CalcLogicResultsProvider(
      dayLogics: dayLogics,
    );
  }

  @override
  AutoDisposeFutureProvider<CalcDaysResults> getProviderOverride(
    covariant CalcLogicResultsProvider provider,
  ) {
    return call(
      dayLogics: provider.dayLogics,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'calcLogicResultsProvider';
}
