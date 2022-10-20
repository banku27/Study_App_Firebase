import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/configs/themes/app_colors.dart';
import 'package:study_app_firebase/configs/themes/custom_text_style.dart';
import 'package:study_app_firebase/configs/themes/ui_parameters.dart';
import 'package:study_app_firebase/controllers/question%20papers/questions_controller.dart';
import 'package:study_app_firebase/firebase_ref/loading_status.dart';
import 'package:study_app_firebase/widgets/background_decoration.dart';
import 'package:study_app_firebase/widgets/content_area.dart';
import 'package:study_app_firebase/widgets/custom_app_bar.dart';
import 'package:study_app_firebase/widgets/main_button.dart';
import 'package:study_app_firebase/widgets/question_paper_holder.dart';
import 'package:study_app_firebase/widgets/questions/answer_card.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  static const String routeName = '/questions-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const ShapeDecoration(
            shape: StadiumBorder(
              side: BorderSide(
                color: onSurfaceTextColor,
                width: 2,
              ),
            ),
          ),
          child: const Text('timer'),
        ),
        showActionIcon: true,
        titleWidget: Obx(
          () => Text(
            'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
            style: appBarTs,
          ),
        ),
      ),
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              if (controller.loadingStatus.value == LoadingStatus.loading)
                const Expanded(
                  child: ContentArea(child: QuestionScreenHolder()),
                ),
              if (controller.loadingStatus.value == LoadingStatus.completed)
                Expanded(
                  child: ContentArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: Column(
                        children: [
                          Text(
                            controller.currentQuestion.value!.question,
                            style: questionTS,
                          ),
                          GetBuilder<QuestionsController>(
                            id: 'answers_list',
                            builder: (context) {
                              return ListView.separated(
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 25),
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                                itemCount: controller
                                    .currentQuestion.value!.answers.length,
                                itemBuilder: (context, index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers[index];
                                  return AnswerCard(
                                    answer:
                                        '${answer.identifier}. ${answer.answer}',
                                    onTap: () {
                                      controller
                                          .selectedAnswer(answer.identifier);
                                    },
                                    isSelected: answer.identifier ==
                                        controller.currentQuestion.value!
                                            .selectedAnswer,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: Row(
                    children: [
                      Visibility(
                        visible: controller.isFirstQuestion,
                        child: SizedBox(
                          width: 55,
                          height: 55,
                          child: MainButton(
                            onTap: () {
                              controller.prevQuestion();
                            },
                            color: Get.isDarkMode
                                ? onSurfaceTextColor
                                : Theme.of(context).primaryColor,
                            child: const Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          child: MainButton(
                            onTap: () {
                              controller.isLastQuestion
                                  ? Container()
                                  : controller.nextQuestion();
                            },
                            title:
                                controller.isLastQuestion ? 'Complete' : 'Next',
                          ),
                        ),
                      )
                    ],
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
