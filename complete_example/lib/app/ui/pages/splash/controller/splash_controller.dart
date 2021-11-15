import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  SplashController(this._sessionController) {
    _init();
  }

  final AuthenticationRepository _auth = Get.i.find();
  final AccountRepository _account = Get.i.find();

  final SessionController _sessionController;

  String? _routeName;
  String? get routeName => _routeName;

  Future<void> _init() async {
    final accessToken = await _auth.accessToken;
    if (accessToken != null) {
      final user = await _account.user;
      if (user != null) {
        _sessionController.setUser(user);
        _routeName = Routes.HOME;
      } else {
        _routeName = Routes.LOGIN;
      }
    } else {
      _routeName = Routes.LOGIN;
    }

    notify();
  }
}
