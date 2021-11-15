import 'package:complete_example/app/ui/global_controllers/session_controller.dart';
import 'package:faker/faker.dart';

void updateEmail() {
  final controller = sessionProvider.read;
  final user = controller.user!;

  final faker = Faker();
  final newEmail = faker.internet.email();

  controller.setUser(
    user.copyWith(
      email: newEmail,
    ),
  );
}
