// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic_results.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calcLogicResultsHash() => r'47d768762a0dacb48ac3b686bd49a30051be8579';

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

/// See also [calcLogicResults].
@ProviderFor(calcLogicResults)
const calcLogicResultsProvider = CalcLogicResultsFamily();

/// See also [calcLogicResults].
class CalcLogicResultsFamily extends Family<AsyncValue<CalcDaysResults>> {
  /// See also [calcLogicResults].
  const CalcLogicResultsFamily();

  /// See also [calcLogicResults].
  CalcLogicResultsProvider call({
    required LogicCollection dayLogics,
  }) {
    return CalcLogicResultsProvider(
      dayLogics: dayLogics,
    );
  }

  @override
  CalcLogicResultsProvider getProviderOverride(
    covariant CalcLogicResultsProvider provider,
  ) {
    return call(
      dayLogics: provider.dayLogics,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'calcLogicResultsProvider';
}

/// See also [calcLogicResults].
class CalcLogicResultsProvider
    extends AutoDisposeFutureProvider<CalcDaysResults> {
  /// See also [calcLogicResults].
  CalcLogicResultsProvider({
    required LogicCollection dayLogics,
  }) : this._internal(
          (ref) => calcLogicResults(
            ref as CalcLogicResultsRef,
            dayLogics: dayLogics,
          ),
          from: calcLogicResultsProvider,
          name: r'calcLogicResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calcLogicResultsHash,
          dependencies: CalcLogicResultsFamily._dependencies,
          allTransitiveDependencies:
              CalcLogicResultsFamily._allTransitiveDependencies,
          dayLogics: dayLogics,
        );

  CalcLogicResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dayLogics,
  }) : super.internal();

  final LogicCollection dayLogics;

  @override
  Override overrideWith(
    FutureOr<CalcDaysResults> Function(CalcLogicResultsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CalcLogicResultsProvider._internal(
        (ref) => create(ref as CalcLogicResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dayLogics: dayLogics,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CalcDaysResults> createElement() {
    return _CalcLogicResultsProviderElement(this);
  }

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

mixin CalcLogicResultsRef on AutoDisposeFutureProviderRef<CalcDaysResults> {
  /// The parameter `dayLogics` of this provider.
  LogicCollection get dayLogics;
}

class _CalcLogicResultsProviderElement
    extends AutoDisposeFutureProviderElement<CalcDaysResults>
    with CalcLogicResultsRef {
  _CalcLogicResultsProviderElement(super.provider);

  @override
  LogicCollection get dayLogics =>
      (origin as CalcLogicResultsProvider).dayLogics;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
