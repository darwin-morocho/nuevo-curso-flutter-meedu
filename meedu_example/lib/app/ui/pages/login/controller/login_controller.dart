import 'package:flutter_meedu/meedu.dart';
import 'login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState.initialState) {}

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  Future<void> submit() async {
    state = state.copyWith(loading: true);
    await Future.delayed(
      const Duration(seconds: 1),
    );
    state = state.copyWith(loading: false);
  }
}
