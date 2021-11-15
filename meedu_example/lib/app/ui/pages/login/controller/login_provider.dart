import 'package:flutter_meedu/meedu.dart';
import 'login_state.dart';
import 'login_controller.dart';

final loginProvider = StateProvider<LoginController, LoginState>(
  (_) => LoginController(),
);
