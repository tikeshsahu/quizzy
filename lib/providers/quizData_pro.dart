import 'package:flutter/material.dart';
import 'package:my_quiz/services/home_fire.dart';

class QuizDataProvider with ChangeNotifier {
  List quizzes = [];
  String quizName = '';
  String quizImage = '';
  String quizTopics = '';
  String quizDuration = '';
  String quizAbout = '';
  String quizID = '';

  getQuiz() async {
    await HomeFire.getQuizzes().then((returned_quizzes) {
      quizzes = returned_quizzes;
      quizName = quizzes[0]["quiz_name"].toString();
      quizImage = quizzes[0]["quiz_thumb"].toString();
      quizTopics = quizzes[0]["topics"].toString();
      quizDuration = quizzes[0]["duration"].toString();
      quizAbout = quizzes[0]["about_quiz"].toString();
      quizID = quizzes[0]["quiz_id"];
    });
    notifyListeners();
    //print(quizDuration);
  }
}
