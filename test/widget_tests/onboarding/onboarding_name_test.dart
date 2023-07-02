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
    expect(find.byKey(const Key('OnboardingBars')), findsOneWidget);
    expect(find.byKey(const Key('OnboardingItem-0')), findsOneWidget);
    expect(find.byType(DSModal), findsOneWidget);
    expect(find.text(S.of(buildContext).beforeYouBegin), findsOneWidget);
    expect(find.byKey(const Key('OnboardingBackButton')), findsNothing);
    expect(find.byKey(const Key('OnboardingSelectButton')), findsNothing);
  });
}
