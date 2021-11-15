import 'package:complete_example/app/domain/models/user.dart';
import 'package:complete_example/app/domain/repositories/account_repository.dart';
import 'package:complete_example/app/domain/responses/users_per_page_response.dart';
import 'package:faker/faker.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:mocktail/mocktail.dart';

final mockUser = User.fromJson(
  {
    "id": 2,
    "email": "janet.weaver@reqres.in",
    "first_name": "Janet",
    "last_name": "Weaver",
    "avatar": "https://reqres.in/img/faces/2-image.jpg"
  },
);

void setUpMockAccountRepository() {
  final account = Get.i.find<AccountRepository>();
  when(() => account.user).thenAnswer(
    (_) => Future.value(mockUser),
  );

  when(
    () => account.getUsersPerPage(any()),
  ).thenAnswer(
    (_) async {
      await Future.delayed(
        const Duration(milliseconds: 10),
      );

      final page = _.positionalArguments.first as int;

      final faker = Faker();
      List<User> data = [];

      for (int i = 0; i < 6; i++) {
        final user = User(
          id: (i + 1) + (page * 6),
          avatar: "https://reqres.in/img/faces/7-image.jpg",
          email: faker.internet.email(),
          firstName: faker.person.firstName(),
          lastName: faker.person.lastName(),
        );

        data.add(user);
      }

      return UsersPerPage(
        page: page,
        perPage: 6,
        total: 12,
        totalPages: 2,
        data: data,
      );
    },
  );
}
