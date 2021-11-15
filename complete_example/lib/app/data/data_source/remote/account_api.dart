import 'package:complete_example/app/data/data_source/local/authentication_client.dart';
import 'package:complete_example/app/data/helpers/http.dart';
import 'package:complete_example/app/domain/models/user.dart';
import 'package:complete_example/app/domain/responses/users_per_page_response.dart';

class AccountAPI {
  final Http _http;
  final AuthenticationClient _authClient;
  AccountAPI(this._http, this._authClient);

  Future<User?> getUser() async {
    final accessToken = await _authClient.accessToken;
    final result = await _http.request<User>(
      '/api/users/2',
      headers: {
        'token': accessToken ?? "",
      },
      parser: (data) {
        return User.fromJson(data['data']);
      },
    );
    return result.data;
  }

  Future<UsersPerPage?> getUsersPerPage(int page) async {
    final result = await _http.request<UsersPerPage>(
      '/api/users',
      queryParameters: {
        "page": "$page",
      },
      parser: (json) {
        print(json);
        return UsersPerPage.fromJson(json);
      },
    );

    return result.data;
  }
}
