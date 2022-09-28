import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/screens/quiz/quiz_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:intl/intl.dart';

class QuizScreen extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    controller.getQuizQuestions();
    return WillPopScope(
        onWillPop: () => _onWillPop(context),
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
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
                                Image.asset(
                                    'assets/images/timer.png', height: 80),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Obx(() =>
                                    Text(
                                      "My Score: ${controller.score}",
                                      style: TextStyle(fontSize: 20),
                                    )),
                                Countdown(
                                  seconds: 60 * 2,
                                  controller: controller.counterController
                                      .value,
                                  build: (BuildContext context, double time) =>
                                      Text(
                                          '${(Duration(seconds: time.toInt()))}'
                                              .split('.')[0]
                                              .padLeft(8, '0'),
                                          style: TextStyle(fontSize: 20)),
                                  interval: Duration(milliseconds: 1000),
                                  onFinished: () {
                                    print('Timer is done!');
                                    controller.quizTimeFinish();
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 500,
                            child: Obx(() => loadQuiz()),
                          ),
                          SizedBox(
                            height: 46,
                            child: Obx(() => skipOrSubmit(context)),
                          )
                        ],
                      ),
                    )))));
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await _showExitBottomSheet(context);
    return exitResult ?? false;
  }

  Future<bool?> _showExitBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: _buildBottomSheet(context),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          'Do you really want to exit from your quiz?',
          style: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('CANCEL'),
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => {controller.resetData(nav: true, context: context)}
            ,
              child: const Text('YES, EXIT'),
            ),
          ],
        ),
      ],
    );
  }

  Widget loadQuiz() {
    if (controller.isQuizFinished.value) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Your total is ${controller.score}",
            style: TextStyle(fontSize: 36),
          ),
          const Text(
            "Submit your score with us and share your score with your friends!",
            style: TextStyle(fontSize: 22, color: Colors.black54),
          ),
        ],
      );
    } else {
      if (controller.loadingQuiz.value) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      } else {
        return PageView.builder(
          controller: controller.pageController.value,
          onPageChanged: (page) {
            print("page $page");
          },
          physics: new NeverScrollableScrollPhysics(),
          itemCount: null == controller.quizQuestions
              ? 0
              : controller.quizQuestions?.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Text(
                  "${controller.quizQuestions?[index]?.question}",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                // Text("${controller.quizQuestions?[index]?.correct}"),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextButton(
                  style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Theme.of(context).buttonColor,
                        minimumSize: Size(double.infinity, 46),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        textStyle: TextStyle(fontSize: 26),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                  onPressed: () => {controller.nextQuiz('a')},
                  child: Text("${controller.quizQuestions?[index]?.a}"),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextButton(
                  style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Theme.of(context).buttonColor,
                        minimumSize: Size(double.infinity, 46),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        textStyle: TextStyle(fontSize: 26),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                  onPressed: () => {controller.nextQuiz('b')},
                  child: Text("${controller.quizQuestions?[index]?.b}"),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextButton(
                  style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Theme.of(context).buttonColor,
                        minimumSize: Size(double.infinity, 46),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        textStyle: TextStyle(fontSize: 26),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                  onPressed: () => {controller.nextQuiz('c')},
                  child: Text("${controller.quizQuestions?[index]?.c}"),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                TextButton(
                  style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Theme.of(context).buttonColor,
                        minimumSize: Size(double.infinity, 46),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        textStyle: TextStyle(fontSize: 26),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                      ),
                  onPressed: () => {controller.nextQuiz('d')},
                  child: Text("${controller.quizQuestions?[index]?.d}"),
                )
              ],
            );
          },
        );
      }
    }
  }

  Widget skipOrSubmit(BuildContext context) {
    if (controller.isQuizFinished.value) {
      return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.green,
          minimumSize: Size(88, 46),
          textStyle: TextStyle(fontSize: 26),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
        onPressed: () => {controller.submitScore()},
        child: Text('Submit my Score'),
      );
    } else {
      return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.orange,
          minimumSize: Size(88, 46),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          textStyle: TextStyle(fontSize: 26),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
        ),
        onPressed: () => {controller.skip()},
        child: Text('Skip'),
      );
    }
  }
}
