import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/helper/extensions/string_extension.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/onboarding/color/onboarding_color.dart';
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

  testWidgets('Test renders onboarding color', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(const OnboardingColor()));

    expect(find.byKey(const Key('OnboardingColorSelect')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingColorDisplaySelectedColor')),
        findsOneWidget);
    expect(find.byType(OnboardingColor), findsOneWidget);
    expect(find.text(S.of(buildContext).chooseColor), findsOneWidget);
  });

  testWidgets('Test select color', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(const OnboardingColor()));
    when(() => mockSharedPrefCubit.setFavoriteColor(FavoriteColor.blue))
        .thenAnswer((_) => Future.value());

    expect(find.byKey(const Key('OnboardingColorSelect')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingColorDisplaySelectedColor')),
        findsOneWidget);
    expect(find.byType(OnboardingColor), findsOneWidget);
    expect(find.text(S.of(buildContext).chooseColor), findsOneWidget);

    expect(
        find.byKey(Key(
            "OnboardingColorSelected-${FavoriteColor.purple.color.toString()}")),
        findsOneWidget);

    final colorToTap = find.byKey(Key(
        "OnboardingColorFavoriteColorsOptions-${FavoriteColor.blue.color.toString()}"));
    expect(colorToTap, findsOneWidget);

    await tester.tap(colorToTap);
    await tester.pump();

    verify(() => mockSharedPrefCubit.setFavoriteColor(FavoriteColor.blue))
        .called(1);
  });
}
