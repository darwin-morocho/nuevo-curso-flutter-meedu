import 'package:complete_example/app/data/data_source/local/authentication_client.dart';
import 'package:complete_example/app/data/data_source/remote/account_api.dart';
import 'package:complete_example/app/data/data_source/remote/authentication_api.dart';
import 'package:complete_example/app/data/helpers/http.dart';
import 'package:complete_example/app/data/repositories_impl/account_repository_impl.dart';
import 'package:complete_example/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> injectDependencies() async {
  final http = Http(baseUrl: 'https://reqres.in');
  final authClient = AuthenticationClient(
    const FlutterSecureStorage(),
  );
  Get.i.lazyPut<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      AuthenticationAPI(http),
      authClient,
    ),
  );

  Get.i.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      AccountAPI(http, authClient),
    ),
  );
}
