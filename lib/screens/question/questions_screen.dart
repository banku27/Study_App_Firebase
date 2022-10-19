import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/controllers/question%20papers/questions_controller.dart';
import 'package:study_app_firebase/widgets/background_decoration.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});

  static const String routeName = '/questions-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Container(),
      ),
    );
  }
}
