import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/screens/quiz/quiz_controller.dart';

class QuizScreen extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    controller.getQuizQuestions();
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Quiz U",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Image.asset('assets/images/timer.png', height: 80),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: PageView.builder(
              controller: controller.pageController.value,
              onPageChanged: (page) {
                print("page $page");
              },
              physics: new NeverScrollableScrollPhysics(),
              itemCount: null == controller.quizQuestions
                  ? 0
                  : controller.quizQuestions?.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                    "Question ${controller.quizQuestions?[index]?.question}");
              },
            ),
          ),
          SizedBox(
            height: 46,
            child:  TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black87,
                backgroundColor: Colors.grey,
                minimumSize: Size(88, 46),
                textStyle: TextStyle(fontSize: 26),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
              ),
              onPressed: () => {
                //Get.to(QuizScreen(), binding: QuizBinding(), routeName: "/quiz")
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (BuildContext context) {
                //       return SuccessScreen();
                //     }))
              },
              child: Text('Skip'),
            ),
          )
        ],
      ),
    ))));
  }
}
