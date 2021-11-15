import 'package:complete_example/app/data/data_source/local/authentication_client.dart';
import 'package:complete_example/app/data/data_source/remote/authentication_api.dart';
import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:complete_example/app/domain/responses/login_response.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationAPI _api;
  final AuthenticationClient _authClient;

  AuthenticationRepositoryImpl(this._api, this._authClient);

  @override
  Future<String?> get accessToken async {
    return _authClient.accessToken;
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    final result = await _api.login(email, password);
    if (result.item1 == LoginResponse.ok) {
      await _authClient.saveToken(result.item2!);
    }
    return result.item1;
  }

  @override
  Future<void> logout() {
    return _authClient.clearData();
  }
}
