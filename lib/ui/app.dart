import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/ui/home/home.dart';
import 'package:chattopic/ui/onboarding/onboarding_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _HomePageState();
}

class _HomePageState extends State<App> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocSelector<SharedPrefCubit, SharedPrefState, bool>(
          selector: (state) => state.onboardingDone,
          builder: (context, onboardingDone) =>
              onboardingDone ? const Home() : const OnboardingMain(),
        ),
        extendBodyBehindAppBar: true,
      );
}
