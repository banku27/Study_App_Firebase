import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:study_app_firebase/configs/themes/app_colors.dart';
import 'package:study_app_firebase/controllers/my_zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: mainGradient(),
      ),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 20,
                right: 100,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Column(
                  children: [
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                top: 40,
                              ),
                              child: Text(
                                controller.user.value!.displayName ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: onSurfaceTextColor),
                              ),
                            ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    _DrawerButton(
                      icon: Icons.web,
                      label: "website",
                      onTap: () => controller.website(),
                    ),
                    _DrawerButton(
                      icon: Icons.link,
                      label: "LinkedIn",
                      onTap: () => controller.linkedIn(),
                    ),
                    _DrawerButton(
                      icon: Icons.email,
                      label: "email",
                      onTap: () => controller.email(),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: _DrawerButton(
                        icon: Icons.logout,
                        label: "Logout",
                        onTap: () => controller.signOut(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextButton.icon(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: 20,
          ),
          label: Text(label)),
    );
  }
}
