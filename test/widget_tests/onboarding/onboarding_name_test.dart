import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/helper/extensions/string_extension.dart';
import 'package:chattopic/ui/onboarding/name/onboarding_name_input.dart';
import 'package:chattopic/ui/shared/ds_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helper/widget_test_utils.dart';
import '../../mocks/cubit/mock_shared_pref_cubit.dart';
import '../../mocks/data/mock_shared_pref_data.dart';

void main() {
  final mockSharedPrefCubit = MockSharedPrefCubit();
  final mockSharedPrefData = MockSharedPrefData();
  late BuildContext buildContext;

  setUp(() {
    final data = mockSharedPrefData.getBasicData();
    when(() => mockSharedPrefCubit.state).thenAnswer(
      (_) => SharedPrefState(
          favoriteColor: data.favoriteColor.getFavoriteColorFromString(),
          onboardingDone: data.onboardingDone,
          username: data.username),
    );
  });

  Widget makeTestableWidget(Widget widget) => MultiBlocProvider(
        providers: [
          BlocProvider<SharedPrefCubit>(
            create: (context) => mockSharedPrefCubit,
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: localizationsDelegates,
          onGenerateRoute: (settings) => CupertinoPageRoute(
            builder: (_) => Container(),
            settings: settings,
          ),
          home: Localizations(
            delegates: localizationsDelegates,
            locale: const Locale('en'),
            child: Builder(
              builder: (context) {
                buildContext = context;
                return Scaffold(body: widget);
              },
            ),
          ),
        ),
      );

  testWidgets('Test renders onboarding name', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(OnboardingNameInput(() => {})));

    expect(
        find.byKey(const Key('OnboardingNameInputBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputBorders')), findsOneWidget);
    expect(
        find.byKey(const Key('OnboardingNameInputTextField')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputNamesSquares')),
        findsOneWidget);
    expect(
        find.byKey(const Key('OnboardingNameInputButtonRow')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputEraseButton')),
        findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputContinueButton')),
        findsOneWidget);
  });

  testWidgets('Test entering name', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(OnboardingNameInput(() => {})));
    final textField = find.byKey(const Key('OnboardingNameInputTextField'));
    expect(
        find.byKey(const Key('OnboardingNameInputBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputBorders')), findsOneWidget);
    expect(textField, findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputNamesSquares')),
        findsOneWidget);
    expect(
        find.byKey(const Key('OnboardingNameInputButtonRow')), findsOneWidget);

    await tester.enterText(textField, "LucasG");

    expect(find.text("LucasG"), findsOneWidget);
  });

  testWidgets('Test entering name goes over limit',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(OnboardingNameInput(() => {})));
    final textField = find.byKey(const Key('OnboardingNameInputTextField'));
    expect(
        find.byKey(const Key('OnboardingNameInputBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputBorders')), findsOneWidget);
    expect(textField, findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputNamesSquares')),
        findsOneWidget);
    expect(
        find.byKey(const Key('OnboardingNameInputButtonRow')), findsOneWidget);

    await tester.enterText(textField, "LucasGoldn");

    expect(find.text("ucasGoldnL"), findsOneWidget);
  });

  testWidgets('Test entering name and remove letter',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(OnboardingNameInput(() => {})));
    final textField = find.byKey(const Key('OnboardingNameInputTextField'));
    expect(
        find.byKey(const Key('OnboardingNameInputBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputBorders')), findsOneWidget);
    expect(textField, findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputNamesSquares')),
        findsOneWidget);
    expect(
        find.byKey(const Key('OnboardingNameInputButtonRow')), findsOneWidget);

    await tester.enterText(textField, "LucasG");
    expect(find.text("LucasG"), findsOneWidget);

    final eraseButton = find.byKey(const Key('OnboardingNameInputEraseButton'));
    expect(eraseButton, findsOneWidget);
    await tester.tap(eraseButton);
    await tester.pump();

    expect(find.text("Lucas"), findsOneWidget);
  });

  testWidgets('Test entering name and continue', (WidgetTester tester) async {
    when(() => mockSharedPrefCubit.setUsername("LucasG"))
        .thenAnswer((_) => Future.value());
    int i = 0;
    void onContinueCallback() => i++;
    await tester.pumpWidget(
        makeTestableWidget(OnboardingNameInput(onContinueCallback)));
    final textField = find.byKey(const Key('OnboardingNameInputTextField'));
    expect(
        find.byKey(const Key('OnboardingNameInputBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputBorders')), findsOneWidget);
    expect(textField, findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputNamesSquares')),
        findsOneWidget);
    expect(
        find.byKey(const Key('OnboardingNameInputButtonRow')), findsOneWidget);

    await tester.enterText(textField, "LucasG");
    expect(find.text("LucasG"), findsOneWidget);

    final continueButton =
        find.byKey(const Key('OnboardingNameInputContinueButton'));
    expect(continueButton, findsOneWidget);
    await tester.tap(continueButton);
    await tester.pump();

    verify(() => mockSharedPrefCubit.setUsername("LucasG")).called(1);
    expect(i, 1);
  });

  testWidgets('Test entering name and continue but no username was entered',
      (WidgetTester tester) async {
    when(() => mockSharedPrefCubit.setUsername("LucasG"))
        .thenAnswer((_) => Future.value());
    int i = 0;
    void onContinueCallback() => i++;
    await tester.pumpWidget(
        makeTestableWidget(OnboardingNameInput(onContinueCallback)));
    final textField = find.byKey(const Key('OnboardingNameInputTextField'));
    expect(
        find.byKey(const Key('OnboardingNameInputBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputBorders')), findsOneWidget);
    expect(textField, findsOneWidget);
    expect(find.byKey(const Key('OnboardingNameInputNamesSquares')),
        findsOneWidget);
    expect(
        find.byKey(const Key('OnboardingNameInputButtonRow')), findsOneWidget);

    final continueButton =
        find.byKey(const Key('OnboardingNameInputContinueButton'));
    expect(continueButton, findsOneWidget);
    await tester.tap(continueButton);
    await tester.pump();

    expect(find.byType(DSModal), findsOneWidget);
    expect(find.text(S.of(buildContext).pleaseEnterName), findsOneWidget);
  });
}
