import 'package:aoc2022/screens/aoc_day.dart';
import 'package:aoc2022/screens/home.dart';
import 'package:aoc2022/src/days/logic_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: true,
    // refreshListenable: router,
    // redirect: router._redirectLogic,
    routes: router._routes,
  );
}

class RouterNotifier extends ChangeNotifier {
  final ProviderRef<GoRouter> _ref;

  RouterNotifier(this._ref) {
    // _ref.listen<AppState>(
    //   appStateNotifier,
    //   (_, __) => notifyListeners(),
    // );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    return null;
  }

  List<GoRoute> get _routes {
    final logic = _ref.read(logicCollectionProvider);

    return [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const MyHomePage(title: 'Advent of Code 2022'),
        ),
      ),
      GoRoute(
        path: '/day/:did',
        name: 'day',
        pageBuilder: (context, state) {
          final day = int.parse(state.params['did']!);
          return MaterialPage<void>(
            key: state.pageKey,
            child: AocDayScreen(
              day: day,
              logic: logic.get(day),
            ),
          );
        },
      ),
    ];
  }
}
