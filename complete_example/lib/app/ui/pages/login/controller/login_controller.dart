import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:complete_example/app/domain/responses/login_response.dart';
import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthenticationRepository _auth = Get.i.find();
  final AccountRepository _account = Get.i.find();

  String _email = '', _password = '';

  LoginController(this._sessionController);

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPassowrChanged(String text) {
    _password = text;
  }

  Future<LoginResponse> submit() async {
    final response = await _auth.login(_email, _password);
    if (response == LoginResponse.ok) {
      final user = await _account.user;
      if (user != null) {
        _sessionController.setUser(user);
      } else {
        return LoginResponse.unknownError;
      }
    }
    return response;
  }
}
