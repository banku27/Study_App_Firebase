import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/app_routes..dart';
import 'package:study_app_firebase/bindings/initial_bindings.dart';
import 'package:study_app_firebase/data_uploader_screen.dart';
import 'package:study_app_firebase/firebase_options.dart';
import 'package:study_app_firebase/screens/introduction/introduction.dart';
import 'package:study_app_firebase/screens/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.routes(),
      debugShowCheckedModeBanner: false,
      // home: const AppIntroductionScreen(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     GetMaterialApp(
//       home: DataUploaderScreen(),
//     ),
//   );
// }
