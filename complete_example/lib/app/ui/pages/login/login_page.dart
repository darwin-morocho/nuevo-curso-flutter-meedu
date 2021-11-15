import 'package:complete_example/app/ui/pages/login/utils/send_login_form.dart';
import 'package:flutter/material.dart';

import 'controller/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = loginProvider.read;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      key: const Key('login-input-email'),
                      decoration: const InputDecoration(
                        label: Text("email"),
                      ),
                      onChanged: controller.onEmailChanged,
                      validator: (text) {
                        final email = text ?? "";
                        if (email.contains("@")) {
                          return null;
                        }
                        return "Invalid email";
                      },
                    ),
                    TextFormField(
                      key: const Key('login-input-password'),
                      decoration: const InputDecoration(
                        label: Text("password"),
                      ),
                      onChanged: controller.onPassowrChanged,
                      validator: (text) {
                        final password = text ?? "";
                        if (password.replaceAll(" ", "").length >= 6) {
                          return null;
                        }
                        return "Invalid password";
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      key: const Key('login-submit-button'),
                      onPressed: () => sendLoginForm(context),
                      child: const Text("SEND"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
