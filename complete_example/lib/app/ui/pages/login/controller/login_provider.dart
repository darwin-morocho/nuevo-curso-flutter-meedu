import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'login_controller.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(
    sessionProvider.read,
  ),
);
