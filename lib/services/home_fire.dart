import 'package:cloud_firestore/cloud_firestore.dart';

class HomeFire {
  static Future<List<Map<String, dynamic>>> getQuizzes() async {
    List<Map<String, dynamic>> all_quiz = [];
    await FirebaseFirestore.instance
        .collection("quizzes")
        .get()
        .then((querySnapshot) => querySnapshot.docs.forEach((quiz) {
              Map<String, dynamic> myQuiz = quiz.data();
              myQuiz["Quizid"] = quiz.reference.id;
              //print(myQuiz["Quizid"]);

              all_quiz.add(myQuiz);
            }));
    return all_quiz;
  }
}
