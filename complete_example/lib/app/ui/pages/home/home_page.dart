import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:complete_example/app/ui/pages/home/utils/logout.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'controller/home_provider.dart';
import 'package:flutter_meedu/router.dart' as router;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => router.pushNamed(
              Routes.PROFILE,
            ),
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: Consumer(
        builder: (_, ref, __) {
          final controller = ref.watch(homeProvider);

          final state = controller.state;

          if (!state.initialized) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.initialized && state.users == null) {
            return Center(
              child: TextButton(
                onPressed: () => controller.load(1),
                child: const Text("retry"),
              ),
            );
          }

          final users = state.users!;
          final scrollController = controller.scrollController;

          return NotificationListener(
            onNotification: (t) {
              if (t is ScrollEndNotification) {
                final offset = scrollController.position.pixels;
                final maxScrollExtent = scrollController.position.maxScrollExtent;

                if (offset >= maxScrollExtent) {
                  controller.load(state.page + 1);
                }
              }
              return true;
            },
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (_, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.firstName),
                  subtitle: Text(user.email),
                  onTap: () => router.pushNamed(
                    Routes.USER_DETAIL,
                    arguments: user,
                  ),
                );
              },
              itemCount: users.length,
              itemExtent: 250,
            ),
          );
        },
      ),
    );
  }
}
