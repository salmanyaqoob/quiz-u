import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/data/db/db_helper.dart';
import 'package:quiz_u/app/data/model/MyScore.dart';
import 'package:quiz_u/app/data/model/QuizQuestion.dart';
import 'package:quiz_u/app/data/model/ScoreResponse.dart';
import 'package:quiz_u/app/data/model/UserInfo.dart';
import 'package:quiz_u/app/data/remote/api_services.dart';
import 'package:quiz_u/app/screens/failure/failure.dart';
import 'package:quiz_u/app/screens/success/success.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../data/db/shared_preferences.dart';
import '../../data/model/TokenResponse.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuizController extends GetxController {
  var score = 0.obs;
  var pageController = PageController(initialPage: 0).obs;
  var counterController = CountdownController(autoStart: false).obs;
  var loadingQuiz = true.obs;
  var isQuizFinished = false.obs;
  List<QuizQuestion?>? quizQuestions = [new QuizQuestion()].obs;

  void increaseScore() {
    score.value++;
  }

  void quizTimeFinish() {
    isQuizFinished.value = true;
  }

  Future<List<QuizQuestion>?> getQuizQuestions() async {
    loadingQuiz.value = true;
    String? token = SharedPreferences().getToken();
    List<QuizQuestion>? quizQuestions =
        await ApiService().getQuizQuestions(token);

    this.quizQuestions = quizQuestions!;
    loadingQuiz.value = false;
    counterController.value.start();
    return quizQuestions;
  }

  void nextQuiz(String answer) {
    int currentQuizIndex = pageController.value.page!.toInt();
    String correct = this.quizQuestions!.elementAt(currentQuizIndex)!.correct!;
    int total = this.quizQuestions!.length;

    print("currentQuizIndex $currentQuizIndex");
    print("correct $correct");
    if (correct != null && !correct.isEmpty && correct == answer) {
      print("your answer is correct");
      increaseScore();

      if ((total - 1) == currentQuizIndex) {
        quizTimeFinish();
      } else {
        pageController.value.nextPage(
            duration: Duration(milliseconds: 250), curve: Curves.easeInExpo);
      }
    } else {
      pageController.value.dispose();
      resetData();
      Get.off(FailureScreen());
    }
  }

  void skip() {
    int currentQuizIndex = pageController.value.page!.toInt();
    int total = this.quizQuestions!.length;
    if ((total - 1) == currentQuizIndex) {
      quizTimeFinish();
    } else {
      pageController.value.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.easeInExpo);
    }
  }

  void submitScore() async {
    Get.snackbar("submission", "data");
    String? token = SharedPreferences().getToken();
    ScoreResponse? scoreResponse =
        await ApiService().submitScore(score.value.toString(), token);
    if (scoreResponse != null && scoreResponse.success) {
      MyScore myScore = MyScore(
          id: null,
          score: score.value.toInt(),
          datetime: DateTime.now().toString());
      DBHelper().insertScore(myScore);
      Get.off(SuccessScreen());
    } else {
      Get.snackbar("Error", "${scoreResponse!.message}");
    }
    resetData();
  }

  void resetData({bool nav = false, var context}){
    isQuizFinished.value = false;
    loadingQuiz.value = true;
    score.value = 0;
    pageController.value = PageController(initialPage: 0);
    counterController.value = CountdownController(autoStart: false);
    if(nav){
      Navigator.of(context).pop(true);
    }
  }
}
