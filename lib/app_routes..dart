import 'package:get/get.dart';
import 'package:study_app_firebase/controllers/my_zoom_drawer_controller.dart';

import 'package:study_app_firebase/controllers/question%20papers/question_paper_controller.dart';
import 'package:study_app_firebase/controllers/question%20papers/questions_controller.dart';
import 'package:study_app_firebase/screens/home/home_screen.dart';
import 'package:study_app_firebase/screens/introduction/introduction.dart';
import 'package:study_app_firebase/screens/login/login_screen.dart';
import 'package:study_app_firebase/screens/question/questions_screen.dart';
import 'package:study_app_firebase/screens/question/test_overview_screen.dart';
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
              Get.put(MyZoomDrawerController());
            },
          ),
        ),
        GetPage(
          page: () => const AppIntroductionScreen(),
          name: AppIntroductionScreen.routeName,
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: QuestionsScreen.routeName,
          page: () => const QuestionsScreen(),
          binding: BindingsBuilder(
            () {
              Get.put<QuestionsController>(
                QuestionsController(),
              );
            },
          ),
        ),
        GetPage(
            name: TestOverviewScreen.routeName,
            page: () => const TestOverviewScreen())
      ];
}
