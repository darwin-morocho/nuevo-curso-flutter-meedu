import 'package:flutter/material.dart';
import 'controller/user_detail_provider.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = userDetailProvider.read;
    final user = controller.user;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(user.firstName),
      ),
    );
  }
}
