import 'package:get/get.dart';

import 'package:study_app_firebase/controllers/question%20papers/question_paper_controller.dart';
import 'package:study_app_firebase/screens/home/home_screen.dart';
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
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(
                QuestionPaperController(),
              );
            },
          ),
        ),
      ];
}
