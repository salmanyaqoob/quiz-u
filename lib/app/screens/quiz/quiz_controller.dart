import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/data/model/QuizQuestion.dart';
import 'package:quiz_u/app/data/model/UserInfo.dart';
import 'package:quiz_u/app/data/remote/api_services.dart';

import '../../data/db/shared_preferences.dart';
import '../../data/model/TokenResponse.dart';

class QuizController extends GetxController {
  var name = "".obs;
  var pageController = PageController(initialPage: 0).obs;
  var loadingQuiz = true.obs;
  List<QuizQuestion?>? quizQuestions = [new QuizQuestion(question: "", a: "a", b: "b", c: "c", d: "d", correct: Correct.A)].obs as List<QuizQuestion>;

  void updateName(var name) {
    name.value = name;
  }

  Future<List<QuizQuestion>?> getQuizQuestions() async{
    loadingQuiz.value = true;
    String? token = SharedPreferences().getToken();
    List<QuizQuestion>? quizQuestions = await ApiService().getQuizQuestions(token);

    this.quizQuestions = quizQuestions!;
    loadingQuiz.value = false;
    return quizQuestions;
  }


}
