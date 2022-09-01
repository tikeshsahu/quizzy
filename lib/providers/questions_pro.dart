// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';

// class QuizQuestionsProvider with ChangeNotifier {
//   Future<List?> generateQuestions(String quizName) async {
//     List<Map> questionData;
//     await FirebaseFirestore.instance
//         .collection("quizzes")
//         .doc(quizName)
//         .collection('questions')
//         .get()
//         .then((value) {
//       questionData = [value.docs.elementAt(0).data()];
//       //print(questionData);
//       return questionData;
//     });
//     notifyListeners();
//   }
// }
