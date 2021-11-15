import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'splash_controller.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(
    sessionProvider.read,
  ),
);
