import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/configs/themes/custom_text_style.dart';
import 'package:study_app_firebase/configs/themes/ui_parameters.dart';
import 'package:study_app_firebase/controllers/question%20papers/questions_controller.dart';
import 'package:study_app_firebase/widgets/background_decoration.dart';
import 'package:study_app_firebase/widgets/content_area.dart';
import 'package:study_app_firebase/widgets/custom_app_bar.dart';
import 'package:study_app_firebase/widgets/main_button.dart';
import 'package:study_app_firebase/widgets/questions/answer_card.dart';
import 'package:study_app_firebase/widgets/questions/count_down_timer.dart';
import 'package:study_app_firebase/widgets/questions/question_number_card.dart';

class TestOverviewScreen extends GetView<QuestionsController> {
  const TestOverviewScreen({super.key});
  static const String routeName = '/test-overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
        child: Column(
          children: [
            Expanded(
              child: ContentArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CountDownTimer(
                          time: '',
                          color: UIParameters.isDarkMode()
                              ? Theme.of(context).textTheme.bodyText1!.color
                              : Theme.of(context).primaryColor,
                        ),
                        Obx(
                          () => Text(
                            '${controller.time} Remaining',
                            style: countDownTimerTs(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.allQuestions.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 70,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) {
                            AnswerStatus? answerStatus;
                            if (controller.allQuestions[index].selectedAnswer !=
                                null) {
                              answerStatus = AnswerStatus.answered;
                            }
                            return QuestionNumberCard(
                              index: index + 1,
                              onTap: () {
                                controller.jumpToQuestion(index);
                              },
                              status: answerStatus,
                            );
                          }),
                    ),
                    ColoredBox(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: UIParameters.mobileScreenPadding,
                        child: MainButton(
                          onTap: () {
                            controller.complete();
                          },
                          title: 'Complete',
                        ),
                      ),
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
