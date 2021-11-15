import 'package:complete_example/app/ui/pages/home/controller/home_state.dart';
import 'package:flutter_meedu/meedu.dart';
import 'home_controller.dart';

final homeProvider = StateProvider<HomeController, HomeState>(
  (_) => HomeController(),
);
