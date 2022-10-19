import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/controllers/question%20papers/questions_controller.dart';
import 'package:study_app_firebase/firebase_ref/loading_status.dart';
import 'package:study_app_firebase/widgets/background_decoration.dart';
import 'package:study_app_firebase/widgets/content_area.dart';
import 'package:study_app_firebase/widgets/question_paper_holder.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  static const String routeName = '/questions-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Column(
                        children: [
                          Text(
                            controller.currentQuestion.value!.question,
                          ),
                        ],
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