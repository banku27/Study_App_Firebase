import 'package:get/get.dart';
import 'package:study_app_firebase/controllers/auth_controller.dart';
import 'package:study_app_firebase/controllers/theme_controller.dart';
import 'package:study_app_firebase/services/firebase_storage_services.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}
