import 'package:complete_example/app/domain/responses/login_response.dart';
import 'package:complete_example/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:complete_example/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:complete_example/app/ui/pages/login/controller/login_provider.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  if (controller.formKey.currentState!.validate()) {
    ProgressDialog.show(context);
    final response = await controller.submit();

    router.pop();
    if (response == LoginResponse.ok) {
      router.pushReplacementNamed(Routes.HOME);
    } else {
      Dialogs.alert(
        context,
        title: response.toString(),
      );
    }
  }
}
