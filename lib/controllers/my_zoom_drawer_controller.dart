import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    super.onReady();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}

  void signIn() {}

  void gitHub() {}

  // void email() {
  //   final Uri emailLaunchUri = Uri(
  //     scheme: 'mailto',
  //     path: 'pankaj2706parihar@gmail.com',
  //   );
  //   _launch(emailLaunchUri);
  // }

  // _launch(String url){

  // }
}
