import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

const String title = 'Flutter gen-l10n bug (dollar sign + select clause)';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Localizations.override(
        context: context,
        locale: const Locale('en'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(l10n.helloBugManifistation1('bla')),
            Text(l10n.helloBugManifistation2('bla')),
            Text(l10n.workaroundTheBug('bla')),
          ],
        ),
      ),
    );
  }
}
