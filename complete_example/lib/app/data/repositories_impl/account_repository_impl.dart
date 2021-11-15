import 'package:complete_example/app/data/data_source/remote/account_api.dart';
import 'package:complete_example/app/domain/models/user.dart';
import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/domain/responses/users_per_page_response.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountAPI _api;

  AccountRepositoryImpl(this._api);

  @override
  Future<User?> get user => _api.getUser();

  @override
  Future<UsersPerPage?> getUsersPerPage(int page) {
    return _api.getUsersPerPage(page);
  }
}
