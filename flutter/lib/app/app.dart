import 'package:aoc2023/app/router/router.dart';
//import 'package:aoc2023/app/router/router_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_helpers/flutter_helpers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Define your seed colors.
const Color primarySeedColor = Color(0xFF0f0f23);
const Color secondarySeedColor = Color(0xFF009900);
const Color tertiarySeedColor = Color(0xFFffff66);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme =
        GoogleFonts.sourceCodeProTextTheme(Theme.of(context).textTheme);
    final router = ref.read(goRouterProvider);

    return MaterialApp.router(
      title: 'Advent of Code 2023',
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      //routerConfig: ref.watch(routerProvider),
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      themeMode: ThemeMode.dark,
      theme: ThemeData.from(
        colorScheme: schemeDark(
          primarySeedColor: primarySeedColor,
          secondarySeedColor: secondarySeedColor,
          tertiarySeedColor: tertiarySeedColor,
          keepAllOnColorsBW: true,
        ),
        useMaterial3: true,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData.from(
        colorScheme: schemeDark(
          primarySeedColor: primarySeedColor,
          secondarySeedColor: secondarySeedColor,
          tertiarySeedColor: tertiarySeedColor,
          keepAllOnColorsBW: true,
        ),
        useMaterial3: true,
        textTheme: textTheme,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        //Locale('es'), // Spanish
      ],
    );
  }
}
