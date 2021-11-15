import '../pages/user_detail/user_detail_page.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;
import '../pages/home/home_page.dart';
import '../pages/login/login_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/splash/splash_page.dart';
import 'routes.dart';

/// WARNING: generated code don't modify directly
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.HOME: (_) => const HomePage(),
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.LOGIN: (_) => const LoginPage(),
    Routes.PROFILE: (_) => const ProfilePage(),
    Routes.USER_DETAIL: (_) => const UserDetailPage(),
  };
}
