import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app/data/repositories_impl/mock_account_repository_impl.dart';
import 'app/data/repositories_impl/mock_authentication_repositoty_impl.dart';
import 'app/domain/repositories/mock_repositories.dart';

void setUpTests() {
  setUp(() {
    ProviderScope.clear();
    Get.i.clear();

    Get.i.put<AuthenticationRepository>(
      MockAuthenticationRepository(),
    );

    Get.i.put<AccountRepository>(
      MockAccountRepository(),
    );

    setUpMockAuthenticationRepository();
    setUpMockAccountRepository();
  });
}
