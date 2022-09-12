import 'package:flutter/material.dart';
import 'package:my_quiz/providers/profile_pro.dart';
import 'package:my_quiz/providers/quizData_pro.dart';
import 'package:provider/provider.dart';

import 'questionPage.dart';

class QuizIntro extends StatefulWidget {
  const QuizIntro({Key? key}) : super(key: key);

  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
  // @override
  // void setState(VoidCallback fn) {
  //   super.setState(fn);
  //   Provider.of<QuizDataProvider>(
  //     context,
  //   ).getQuiz();
  //   // Provider.of<ProfileProvider>(
  //   //   context,
  //   // ).getUserDetails();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text(
          "START",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) 
          => Question(
            quizzName: Provider.of<QuizDataProvider>(context).quizName,
          )));
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Consumer<QuizDataProvider>(
              builder: (context, value, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value.quizName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Image.network(
                    value.quizImage,
                    fit: BoxFit.cover,
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.topic_outlined),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Exams covered -",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text(
                          value.quizTopics,
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.topic_outlined),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Duration -",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text(
                          '${value.quizDuration} Minutes',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 17),
                        ),
                        Text('quiz id - ${value.quizID}')
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.topic_outlined),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Topics Covered -",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text(
                          value.quizAbout,
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
