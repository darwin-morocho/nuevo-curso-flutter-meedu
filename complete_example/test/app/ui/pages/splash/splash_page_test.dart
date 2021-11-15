import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:complete_example/app/my_app.dart';
import 'package:complete_example/app/ui/pages/splash/splash_page.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../set_up_tests.dart';

void main() {
  setUpTests();

  testWidgets(
    'SplashPage > logged',
    (tester) async {
      await tester.pumpWidget(
        MyApp(
          routes: {
            Routes.SPLASH: (_) => const SplashPage(),
            Routes.HOME: (_) => const Scaffold(
                  body: Center(
                    child: Text("HOME_PAGE"),
                  ),
                ),
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text("HOME_PAGE"), findsOneWidget);
    },
  );

  testWidgets(
    'SplashPage > not logged',
    (tester) async {
      when(
        () => Get.i.find<AuthenticationRepository>().accessToken,
      ).thenAnswer(
        (_) => Future.value(null),
      );
      await tester.pumpWidget(
        MyApp(
          routes: {
            Routes.SPLASH: (_) => const SplashPage(),
            Routes.LOGIN: (_) => const Scaffold(
                  body: Center(
                    child: Text("LOGIN_PAGE"),
                  ),
                ),
          },
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text("LOGIN_PAGE"), findsOneWidget);
    },
  );
}
