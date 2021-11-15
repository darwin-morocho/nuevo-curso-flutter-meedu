import 'package:complete_example/app/domain/models/user.dart';
import 'package:flutter_meedu/meedu.dart';

class UserDetailController extends SimpleNotifier {
  final User user;
  UserDetailController(this.user);
}
