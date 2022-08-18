import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app_firebase/widgets/app_circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.star,
                size: 65,
                color: Colors.amber,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'This is a study app. You can use it as you want. If you understand how is this works, you would be able to scale it.',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 40,
              ),
              AppCircleButton(
                // onTap: ,
                width: 2,
                child: Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
