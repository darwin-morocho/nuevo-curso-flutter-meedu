import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:complete_example/app/domain/responses/login_response.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:mocktail/mocktail.dart';

void setUpMockAuthenticationRepository() {
  final auth = Get.i.find<AuthenticationRepository>();
  when(() => auth.accessToken).thenAnswer(
    (_) => Future.value("token"),
  );

  when(() => auth.login(any(), any())).thenAnswer(
    (invocation) async {
      final args = invocation.positionalArguments;
      final email = args[0] as String;
      final password = args[1] as String;

      await Future.delayed(
        const Duration(milliseconds: 10),
      );

      if (email == "test@test.com" && password == "Test123@") {
        return LoginResponse.ok;
      }
      return LoginResponse.accessDenied;
    },
  );
}
