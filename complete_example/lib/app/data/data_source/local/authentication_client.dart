import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: constant_identifier_names
const TOKEN = 'TOKEN';

class AuthenticationClient {
  final FlutterSecureStorage _storage;

  AuthenticationClient(this._storage);

  Future<String?> get accessToken async {
    return _storage.read(key: TOKEN);
  }

  Future<void> saveToken(String token) async {
    await _storage.write(
      key: TOKEN,
      value: token,
    );
  }

  Future<void> clearData() {
    return _storage.deleteAll();
  }
}
