import'package:get/get.dart';
import 'package:quiz_u/app/screens/quiz/quiz_controller.dart';

class QuizBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController());
  }

}