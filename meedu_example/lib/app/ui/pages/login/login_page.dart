import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'controller/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  TextField(
                    onChanged: loginProvider.read.onEmailChanged,
                    decoration: const InputDecoration(
                      hintText: "email",
                    ),
                  ),
                  TextField(
                    onChanged: loginProvider.read.onPasswordChanged,
                    decoration: const InputDecoration(
                      hintText: "password",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: loginProvider.read.submit,
                    child: const Text("SEND"),
                  ),
                  Consumer(
                    builder: (_, ref, __) {
                      print("🐶");
                      final controller = ref.watch(loginProvider);
                      return Column(
                        children: [
                          Text("email: ${controller.state.email}"),
                          Text("password: ${controller.state.password}"),
                        ],
                      );
                    },
                  )
                ],
              ),
              Consumer(
                builder: (_, ref, __) {
                  print("😛");
                  final loading = ref
                      .watch(
                        loginProvider.when(
                          (prev, current) {
                            return prev.loading != current.loading;
                          },
                        ),
                      )
                      .state
                      .loading;
                  if (loading) {
                    return Positioned.fill(
                      child: Container(
                        color: Colors.black26,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
