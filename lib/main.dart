import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/providers/shared_pref_provider.dart';
import 'package:chattopic/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  SharedPrefCubit getSharedPrefsCubit() {
    final sharedPrefCubit = SharedPrefCubit(SharedPrefProvider());
    sharedPrefCubit.loadSharedPrefs();

    return sharedPrefCubit;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SharedPrefCubit>(
          create: (context) => getSharedPrefsCubit(),
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
        home: const App(
          key: Key("Home"),
        ),
      ),
    );
  }
}
