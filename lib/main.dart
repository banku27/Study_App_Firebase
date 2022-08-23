import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/app_routes..dart';
import 'package:study_app_firebase/bindings/initial_bindings.dart';
import 'package:study_app_firebase/configs/themes/app_light_theme.dart';
import 'package:study_app_firebase/controllers/theme_controller.dart';
import 'package:study_app_firebase/data_uploader_screen.dart';
import 'package:study_app_firebase/firebase_options.dart';
import 'package:study_app_firebase/screens/home/home_screen.dart';
import 'package:study_app_firebase/screens/introduction/introduction.dart';
import 'package:study_app_firebase/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,

      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   InitialBindings().dependencies();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     GetMaterialApp(
//       getPages: AppRoutes.routes(),
//       theme: Get.find<ThemeController>().darkTheme,
//     ),
//   );
// }
