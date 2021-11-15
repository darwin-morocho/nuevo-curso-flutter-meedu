import 'dart:async';
import 'dart:io';

import 'package:complete_example/app/data/helpers/http.dart';
import 'package:complete_example/app/data/helpers/http_method.dart';
import 'package:complete_example/app/domain/responses/login_response.dart';
import 'package:tuple/tuple.dart';

class AuthenticationAPI {
  final Http _http;
  AuthenticationAPI(this._http);

  Future<Tuple2<LoginResponse, String?>> login(String email, String password) async {
    final result = await _http.request<String>(
      '/api/login',
      // queryParameters: {
      //   "delay": "5",
      // },
      method: HttpMethod.post,
      body: {
        "email": email,
        "password": password,
      },
      parser: (data) {
        return data['token'];
      },
    );

    if (result.error == null) {
      return Tuple2(
        LoginResponse.ok,
        result.data,
      );
    }

    if (result.statusCode == 400) {
      return const Tuple2(LoginResponse.accessDenied, null);
    }

    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return const Tuple2(LoginResponse.networkError, null);
    }

    return const Tuple2(LoginResponse.unknownError, null);
  }
}
