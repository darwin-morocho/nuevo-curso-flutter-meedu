import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/my_app.dart';
import 'package:complete_example/app/ui/pages/home/controller/home_provider.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../set_up_tests.dart';

void main() {
  setUpTests();

  testWidgets(
    'HomePage > load fail',
    (tester) async {
      when(
        () => Get.i.find<AccountRepository>().getUsersPerPage(any()),
      ).thenAnswer(
        (_) async {
          await Future.delayed(
            const Duration(milliseconds: 10),
          );
          return null;
        },
      );
      await _initApp(tester);
      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );
      await tester.pump(
        const Duration(milliseconds: 20),
      );
      expect(
        find.text("retry"),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'HomePage > load ok',
    (tester) async {
      await _initApp(tester);
      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );
      await tester.pump(
        const Duration(milliseconds: 20),
      );
      expect(
        find.text("retry"),
        findsNothing,
      );

      final controller = homeProvider.read;
      final scrollController = controller.scrollController;
      final maxScrollExtent = scrollController.position.maxScrollExtent;
      expect(controller.state.page, 1);
      await tester.dragFrom(
        const Offset(10, 100),
        Offset(10, -(maxScrollExtent + 100)),
      );
      await tester.pumpAndSettle();
      expect(controller.state.page, 2);
    },
  );
}

Future<void> _initApp(WidgetTester tester) {
  return tester.pumpWidget(
    const MyApp(
      initialRoute: Routes.HOME,
    ),
  );
}
