import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatToPic',
      debugShowCheckedModeBanner: false,
      key: const Key("MainApp"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(fontFamily: "NDS12"),
      locale: const Locale("ja"),
      home: const Home(
        key: Key("Home"),
      ),
    );
  }
}
