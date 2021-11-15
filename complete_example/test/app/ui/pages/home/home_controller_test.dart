import 'dart:async';

import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../set_up_tests.dart';

void main() {
  setUpTests();

  test(
    'home controller > load fail',
    () async {
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
      final controller = HomeController();
      final completer = Completer();
      expect(controller.state.initialized, false);
      controller.addListener(
        (_) {
          completer.complete();
        },
      );

      await completer.future;

      expect(controller.state.initialized, true);
      expect(controller.state.users, isNull);
    },
  );

  test(
    'home controller > load ok',
    () async {
      final controller = HomeController();
      final completer = Completer();
      expect(controller.state.initialized, false);
      controller.addListener(
        (_) {
          if (!completer.isCompleted) {
            completer.complete();
          }
        },
      );

      await completer.future;

      expect(controller.state.initialized, true);
      expect(controller.state.users, isNotNull);

      await controller.load(2);
      expect(controller.state.page, 2);
      await controller.load(3);
      expect(controller.state.page, 2);
      controller.dispose();
      expect(controller.disposed, true);
    },
  );
}
