import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Application Localization',
      home: HomeView(),
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('id', ''), // Indo, no country code
        Locale('en', ''), // English, no country code
      ],
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)?.helloWorld("Jokowi", "Semarang") ??
                  "Dika",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '${AppLocalizations.of(context)?.myNumber(1203048)}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              '${AppLocalizations.of(context)?.todayDate(DateTime.now())}',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
