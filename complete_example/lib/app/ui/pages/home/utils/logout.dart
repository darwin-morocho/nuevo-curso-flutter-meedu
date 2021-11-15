import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:complete_example/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/router.dart' as router;

void logout(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = sessionProvider.read;
  final AuthenticationRepository auth = Get.i.find();
  await auth.logout();
  controller.signOut();
  router.pushNamedAndRemoveUntil(
    Routes.LOGIN,
  );
}
