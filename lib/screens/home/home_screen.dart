import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/controllers/question%20papers/question_paper_controller.dart';
import 'package:study_app_firebase/screens/home/question_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
          shrinkWrap: true,
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
    );
  }
}
