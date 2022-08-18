import 'package:flutter/material.dart';
import 'package:study_app_firebase/configs/themes/app_dark_theme.dart';
import 'package:study_app_firebase/configs/themes/app_light_theme.dart';
import 'package:study_app_firebase/configs/themes/ui_parameters.dart';

const mainGradientLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryLightColorLight,
    primaryColorLight,
  ],
);

const mainGradientDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    primaryDarkColorDark,
    primaryColorDark,
  ],
);

LinearGradient mainGradient(BuildContext context) {
  return UIParameters.isDarkMode(context)
      ? mainGradientDark
      : mainGradientLight;
}
