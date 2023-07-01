import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/providers/shared_pref_provider.dart';
import 'package:chattopic/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sharedPreferencesProvider = SharedPrefProvider()..loadSharedPrefs();
    final sharedPrefCubit = SharedPrefCubit(sharedPreferencesProvider);

    return MultiBlocProvider(
      providers: [
        BlocProvider<SharedPrefCubit>(
          create: (context) => sharedPrefCubit,
        ),
      ],
      child: MaterialApp(
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
        home: const Home(
          key: Key("Home"),
        ),
      ),
    );
  }
}
