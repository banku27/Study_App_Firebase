import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/configs/themes/custom_text_style.dart';
import 'package:study_app_firebase/controllers/question%20papers/question_controller_extension.dart';
import 'package:study_app_firebase/controllers/question%20papers/questions_controller.dart';
import 'package:study_app_firebase/widgets/background_decoration.dart';
import 'package:study_app_firebase/widgets/content_area.dart';
import 'package:study_app_firebase/widgets/custom_app_bar.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routeName = '/result-screen';

  @override
  Widget build(BuildContext context) {
    Color _textcolor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
      body: BackgroundDecoration(
        child: Column(
          children: [
            CustomAppBar(
              leading: const SizedBox(
                height: 80,
              ),
              title: controller.correctAnsweredQuestions,
            ),
            Expanded(
              child: ContentArea(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/bulb.svg',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 5,
                      ),
                      child: Text(
                        'Congratulations',
                        style: headerText.copyWith(
                          color: _textcolor,
                        ),
                      ),
                    ),
                    Text(
                      'You have ${controller.points} Points',
                      style: TextStyle(
                        color: _textcolor,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Tap below question numbers to view correct answers',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
