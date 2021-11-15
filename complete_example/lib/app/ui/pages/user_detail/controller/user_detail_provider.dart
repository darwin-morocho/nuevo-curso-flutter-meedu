import 'package:complete_example/app/domain/models/user.dart';
import 'package:flutter_meedu/meedu.dart';
import 'user_detail_controller.dart';
import 'package:flutter_meedu/router.dart' as router;

// coverage:ignore-start
final userDetailProvider = SimpleProvider(
  (_) => UserDetailController(router.arguments as User),
);
// coverage:ignore-end