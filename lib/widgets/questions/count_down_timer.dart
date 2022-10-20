import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:study_app_firebase/configs/themes/custom_text_style.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({
    Key? key,
    this.color,
    required this.time,
  }) : super(key: key);
  final Color? color;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: countDownTimerTs().copyWith(
            color: color,
          ),
        ),
      ],
    );
  }
}
