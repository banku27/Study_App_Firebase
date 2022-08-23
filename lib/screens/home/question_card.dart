import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:study_app_firebase/models/question_paper_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            ClipRRect(
              child: Container(
                color: Colors.red,
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: model.imageUrl!,
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/app_splash_logo.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
