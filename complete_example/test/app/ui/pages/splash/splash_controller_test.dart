import 'dart:async';
import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:complete_example/app/ui/pages/splash/controller/splash_controller.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../set_up_tests.dart';



void main() {
  setUpTests();

  test(
    'splash controller > not logged',
    () async {
      when(
        () => Get.i.find<AuthenticationRepository>().accessToken,
      ).thenAnswer(
        (_) => Future.value(null),
      );
      final controller = SplashController(
        SessionController(),
      );

      final c = Completer();
      controller.addListener(
        (_) {
          c.complete();
        },
      );

      await c.future;

      expect(controller.routeName, Routes.LOGIN);
    },
  );

  test(
    'splash controller >  logged',
    () async {
      final controller = SplashController(
        SessionController(),
      );

      final c = Completer();
      controller.addListener(
        (_) {
          c.complete();
        },
      );

      await c.future;

      expect(controller.routeName, Routes.HOME);
    },
  );

  test(
    'splash controller >  logged but user error',
    () async {
      when(
        () => Get.i.find<AccountRepository>().user,
      ).thenAnswer(
        (_) => Future.value(null),
      );
      final controller = SplashController(
        SessionController(),
      );

      final c = Completer();
      controller.addListener(
        (_) {
          c.complete();
        },
      );

      await c.future;

      expect(controller.routeName, Routes.LOGIN);
    },
  );
}
