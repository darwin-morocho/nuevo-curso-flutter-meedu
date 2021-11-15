import 'package:complete_example/app/domain/responses/login_response.dart';
import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:complete_example/app/ui/pages/login/controller/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../set_up_tests.dart';

void main() {
  late LoginController controller;

  setUpTests();
  setUp(() {
    controller = LoginController(
      SessionController(),
    );
  });

  test(
    'login > fail',
    () async {
      controller.onEmailChanged("test@test.com");
      controller.onPassowrChanged("test");
      final response = await controller.submit();
      expect(response, LoginResponse.accessDenied);
    },
  );

  test(
    'login > ok',
    () async {
      controller.onEmailChanged("test@test.com");
      controller.onPassowrChanged("Test123@");
      final response = await controller.submit();
      expect(response, LoginResponse.ok);
    },
  );
}
