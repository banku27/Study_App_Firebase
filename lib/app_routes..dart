import 'package:get/get_navigation/get_navigation.dart';
import 'package:study_app_firebase/screens/introduction/introduction.dart';
import 'package:study_app_firebase/screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/introduction',
          page: () => const AppIntroductionScreen(),
        ),
      ];
}
