import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/configs/themes/custom_text_style.dart';
import 'package:study_app_firebase/configs/themes/ui_parameters.dart';

import 'package:study_app_firebase/models/question_paper_model.dart';
import 'package:study_app_firebase/widgets/app_icon_text.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  final QuestionPaperModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  child: SizedBox(
                    height: Get.height * 0.10,
                    width: Get.width * 0.15,
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
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: cartTitles(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 15),
                      child: Text(
                        model.description,
                      ),
                    ),
                    Row(
                      children: [
                        AppIconText(
                          icon: Icon(
                            Icons.help_outline_sharp,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                          text: Text(
                            '${model.questionsCount} questions',
                            style: detailText.copyWith(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        AppIconText(
                          icon: Icon(
                            Icons.timer,
                            color: Get.isDarkMode
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                          text: Text(
                            '${model.questionsCount} questions',
                            style: detailText.copyWith(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
