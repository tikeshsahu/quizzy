import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var link = 'https://the-trivia-api.com/api/questions';

getQuiz() async {
  var response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    var quizData = jsonDecode(response.body.toString());
    print(quizData);
    return quizData;
  } else {
    print('Error');
  }
  
}
