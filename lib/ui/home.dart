import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/ui/onboarding/onboarding_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: BlocSelector<SharedPrefCubit, SharedPrefState, bool>(
          selector: (state) => state.onboardingDone,
          builder: (context, onboardingDone) => onboardingDone
              ? const Center(child: Text("Moin"))
              : const OnboardingMain(),
        ),
        extendBodyBehindAppBar: true,
      );
}
