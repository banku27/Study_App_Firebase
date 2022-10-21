import 'package:flutter/material.dart';

import 'package:study_app_firebase/configs/themes/app_colors.dart';
import 'package:study_app_firebase/configs/themes/ui_parameters.dart';

enum AnswerStatus {
  correct,
  wrong,
  answered,
  notAnswered;
}

class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard({
    Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: UIParameters.cardBorderRadius,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          border: Border.all(
            color: isSelected ? answerSelectedColor() : answerBorderColor(),
          ),
          color:
              isSelected ? answerSelectedColor() : Theme.of(context).cardColor,
        ),
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? onSurfaceTextColor : null,
          ),
        ),
      ),
    );
  }
}

class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({
    Key? key,
    required this.answer,
  }) : super(key: key);
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: correctAnswerColor.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10,
        ),
        child: Text(
          answer,
          style: const TextStyle(
            color: correctAnswerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WrongAnswer extends StatelessWidget {
  const WrongAnswer({
    Key? key,
    required this.answer,
  }) : super(key: key);
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: wrongAnswerColor.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10,
        ),
        child: Text(
          answer,
          style: const TextStyle(
            color: wrongAnswerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class NotAnswered extends StatelessWidget {
  const NotAnswered({
    Key? key,
    required this.answer,
  }) : super(key: key);
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: notAnswerColor.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10,
        ),
        child: Text(
          answer,
          style: const TextStyle(
            color: notAnswerColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
