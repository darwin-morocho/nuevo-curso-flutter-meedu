import 'package:complete_example/app/domain/responses/login_response.dart';
import 'package:complete_example/app/my_app.dart';
import 'package:complete_example/app/ui/pages/login/login_page.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../set_up_tests.dart';

void main() {
  setUpTests();

  final emailInputFinder = find.byKey(
    const Key('login-input-email'),
  );

  final passwordInputFinder = find.byKey(
    const Key('login-input-password'),
  );

  final submitButtonFinder = find.byKey(
    const Key('login-submit-button'),
  );

  testWidgets(
    'LoginPage > invalid form',
    (tester) async {
      await _initApp(tester);
      await tester.tap(submitButtonFinder);
      await tester.pump();
      expect(find.text("Invalid email"), findsOneWidget);
      expect(find.text("Invalid password"), findsOneWidget);
    },
  );

  testWidgets(
    'LoginPage > ok',
    (tester) async {
      await _initApp(tester);

      await tester.enterText(emailInputFinder, "test@test.com");
      await tester.enterText(passwordInputFinder, "Test123@");
      await tester.pump();
      await tester.tap(submitButtonFinder);
      await tester.pump();
      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );

      await tester.pumpAndSettle();

      expect(find.text("HOME_PAGE"), findsOneWidget);
    },
  );

  testWidgets(
    'LoginPage > fail',
    (tester) async {
      await _initApp(tester);

      await tester.enterText(emailInputFinder, "test@test.com");
      await tester.enterText(passwordInputFinder, "Test123");
      await tester.pump();
      await tester.tap(submitButtonFinder);
      await tester.pump();
      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );

      await tester.pumpAndSettle();

      expect(
        find.text(LoginResponse.accessDenied.toString()),
        findsOneWidget,
      );
    },
  );
}

Future<void> _initApp(WidgetTester tester) {
  return tester.pumpWidget(
    MyApp(
      initialRoute: Routes.LOGIN,
      routes: {
        Routes.LOGIN: (_) => const LoginPage(),
        Routes.HOME: (_) => const Scaffold(
              body: Center(
                child: Text("HOME_PAGE"),
              ),
            ),
      },
    ),
  );
}
