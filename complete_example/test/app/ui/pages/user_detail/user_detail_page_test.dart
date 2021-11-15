import 'package:complete_example/app/my_app.dart';
import 'package:complete_example/app/ui/pages/user_detail/controller/user_detail_controller.dart';
import 'package:complete_example/app/ui/pages/user_detail/controller/user_detail_provider.dart';
import 'package:complete_example/app/ui/routes/routes.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../set_up_tests.dart';
import '../../../data/repositories_impl/mock_account_repository_impl.dart';

void main() {
  setUpTests();

  setUp(() {
    userDetailProvider.overrideProvider(
      (_) => UserDetailController(mockUser),
    );
  });

  testWidgets(
    'user detail',
    (tester) async {
      await tester.pumpWidget(
        const MyApp(
          initialRoute: Routes.USER_DETAIL,
        ),
      );
      expect(find.text(mockUser.firstName),findsOneWidget);
    },
  );
}
