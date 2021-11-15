import 'package:complete_example/app/domain/models/user.dart';
import 'package:complete_example/app/domain/responses/users_per_page_response.dart';

abstract class AccountRepository {
  Future<User?> get user;

  Future<UsersPerPage?> getUsersPerPage(int page);
}
