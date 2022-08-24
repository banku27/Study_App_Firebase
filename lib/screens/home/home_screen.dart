import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/configs/app_icons.dart';
import 'package:study_app_firebase/configs/themes/app_colors.dart';
import 'package:study_app_firebase/configs/themes/custom_text_style.dart';
import 'package:study_app_firebase/configs/themes/ui_parameters.dart';
import 'package:study_app_firebase/controllers/question%20papers/question_paper_controller.dart';
import 'package:study_app_firebase/screens/home/question_card.dart';
import 'package:study_app_firebase/widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(mobileScreenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      AppIcons.menuLeft,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          const Icon(
                            AppIcons.peace,
                          ),
                          Text(
                            'Hello friend',
                            style: detailText.copyWith(
                              color: onSurfaceTextColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Text(
                      'What do you want to learn today?',
                      style: headerText,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ContentArea(
                    addPadding: false,
                    child: Obx(
                      () => ListView.separated(
                        padding: UIParameters.mobileScreenPadding,
                        itemCount: _questionPaperController.allPapers.length,
                        itemBuilder: (context, index) {
                          return QuestionCard(
                            model: _questionPaperController.allPapers[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
