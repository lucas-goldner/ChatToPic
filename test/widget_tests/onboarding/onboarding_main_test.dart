import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/helper/extensions/string_extension.dart';
import 'package:chattopic/ui/onboarding/name/onboarding_name_input.dart';
import 'package:chattopic/ui/onboarding/onboarding_main.dart';
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

  testWidgets('Test renders onboarding', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(const OnboardingMain()));

    expect(find.byKey(const Key('OnboardingBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingBars')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingItem-0')), findsOneWidget);
    expect(find.byType(DSModal), findsOneWidget);
    expect(find.text(S.of(buildContext).beforeYouBegin), findsOneWidget);
    expect(find.byKey(const Key('OnboardingBackButton')), findsNothing);
    expect(find.byKey(const Key('OnboardingSelectButton')), findsNothing);
  });

  testWidgets('Test goes to next page', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(const OnboardingMain()));

    expect(find.byKey(const Key('OnboardingBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingBars')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingItem-0')), findsOneWidget);
    expect(find.byType(DSModal), findsOneWidget);
    expect(find.text(S.of(buildContext).beforeYouBegin), findsOneWidget);

    await tester.tap(find.byType(DSModal).first);
    await tester.pump();

    expect(find.byKey(const Key('OnboardingItem-1')), findsOneWidget);
    expect(find.byType(OnboardingNameInput), findsOneWidget);
    expect(find.byType(DSModal), findsNothing);
    expect(find.text(S.of(buildContext).beforeYouBegin), findsNothing);
  });

  testWidgets('Test go through pages', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(const OnboardingMain()));
    when(() => mockSharedPrefCubit.setUsername("LucasG"))
        .thenAnswer((_) => Future.value());
    when(() => mockSharedPrefCubit.setOnboardingDone(true))
        .thenAnswer((_) => Future.value());

    // Page 0
    expect(find.byKey(const Key('OnboardingBackground')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingBars')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingItem-0')), findsOneWidget);
    expect(find.byType(DSModal), findsOneWidget);
    expect(find.text(S.of(buildContext).beforeYouBegin), findsOneWidget);

    await tester.tap(find.byType(DSModal).first);
    await tester.pump();

    // Page 1
    expect(find.byKey(const Key('OnboardingItem-1')), findsOneWidget);
    expect(find.byType(OnboardingNameInput), findsOneWidget);
    expect(find.byType(DSModal), findsNothing);
    expect(find.text(S.of(buildContext).beforeYouBegin), findsNothing);

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

    // Page 2
    expect(find.byKey(const Key('OnboardingItem-2')), findsOneWidget);
    final onboardingBackButton = find.byKey(const Key('OnboardingBackButton'));
    await tester.tap(onboardingBackButton);
    await tester.pump();

    // Page 1
    expect(find.byKey(const Key('OnboardingItem-1')), findsOneWidget);
    await tester.enterText(textField, "LucasG");
    expect(find.text("LucasG"), findsOneWidget);
    await tester.tap(continueButton);
    await tester.pump();

    // Page 2
    expect(find.byKey(const Key('OnboardingItem-2')), findsOneWidget);
    final selectButton = find.byKey(const Key("OnboardingSelectButton"));
    await tester.tap(selectButton);
    await tester.pump();

    verify(() => mockSharedPrefCubit.setOnboardingDone(true)).called(1);
  });
}
