import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/pages/extras/resultScreen.dart';
import 'package:provider/provider.dart';
import '../providers/quizData_pro.dart';

class Question extends StatefulWidget {
  //const Question({Key? key}) : super(key: key);
  String quizzName;
  Question({
    Key? key,
    required this.quizzName,
  }) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final CustomTimerController timeController = CustomTimerController();
  List questionData = [];
  QuestionModel questionModel = QuestionModel();
  int ansIndex = 0;
  int score = 0;
  bool gameOver = false;
  bool optionTapped = false;
  List options = [];

  shuffleAndSetAnswer() {
    questionData.shuffle();
    questionModel.question = questionData[0]["question"];
    questionModel.correctAnswer = questionData[0]["correct_ans"];
    options = [
      questionData[0]["opt1"],
      questionData[0]["opt2"],
      questionData[0]["opt3"],
      questionData[0]["opt4"]
    ];
    options.shuffle();
    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];

    var newRandom = Random();
    var random = 1 + newRandom.nextInt(4 - 1);
    ansIndex = random;
  }

  

  Future<List> generateQuestions(String quizName) async {
    await FirebaseFirestore.instance
        .collection("quizzes")
        .doc(quizName)
        .collection('questions')
        .get()
        .then((value) {
      for (int i = 0; i < 4; i++) {
        questionData.add(value.docs.elementAt(i).data());
      }
      //questionData = [value.docs.elementAt(0).data()];

      //print(questionData);
      setState(() {
        questionModel.question = questionData[0]["question"];
        questionModel.correctAnswer = questionData[0]["correct_ans"];
        options = [
          questionData[0]["opt1"],
          questionData[0]["opt2"],
          questionData[0]["opt3"],
          questionData[0]["opt4"]
        ];
        options.shuffle();
        questionModel.option1 = options[0];
        questionModel.option2 = options[1];
        questionModel.option3 = options[2];
        questionModel.option4 = options[3];
      });
    });
    questionData.shuffle();
    return questionData;
  }

  @override
  void initState() {
    super.initState();
    generateQuestions(widget.quizzName);
    timeController.start();
  }

  @override
  Widget build(BuildContext context) {
    //if (score == 60) gameOver = true;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 242, 242),
      body: Column(
        children: [
          if (!gameOver)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 33, 48, 214),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.85, -0.82),
                    child: Text(
                      'Question 1',
                      style: TextStyle(fontSize: 21, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.85, -0.82),
                    child: Container(
                        color: Colors.amber,
                        height: 30,
                        width: 80,
                        child: CustomTimer(
                            controller: timeController,
                            begin: Duration(seconds: 0),
                            end: Duration(minutes: 30),
                            builder: (time) {
                              return Text("${time.minutes}:${time.seconds}",
                                  style: TextStyle(fontSize: 24.0));
                            })),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.08),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.6,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            width: MediaQuery.of(context).size.width,
                            //color: Colors.black26,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Center(
                                child: Text(
                                  questionModel.question,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width / 1.28,
                            //color: Colors.black12,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 4,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            optionTapped = !optionTapped;
                                          });

                                          if (options[index].toString() ==
                                              questionModel.correctAnswer) {
                                            print('Correct Answer');
                                            setState(() {
                                              score += 20;
                                            });
                                          } else {
                                            print('Incorrect Answer');
                                            // showDialog(
                                            //     context: context,
                                            //     builder: (ctx) => AlertDialog(
                                            //           title: const Text(
                                            //               "Incorrect"),
                                            //         ));
                                          }
                                        },
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                13.5,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.28,
                                            decoration: BoxDecoration(
                                              color: optionTapped
                                                  ? Colors.amber
                                                  : Color.fromARGB(
                                                      70, 231, 227, 227),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                options[index],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 136, 134, 134)),
                                              ),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  );
                                })),
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                optionTapped = false;
                                questionData.removeAt(0);
                                shuffleAndSetAnswer();
                                if (questionData.isEmpty) {
                                  gameOver = true;
                                }
                              });
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 15,
                                width: MediaQuery.of(context).size.width / 1.4,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 33, 48, 214),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Align(
                  //     alignment: AlignmentDirectional(0, 0.9),
                  //     child: Container(
                  //       height: MediaQuery.of(context).size.height / 18,
                  //       width: MediaQuery.of(context).size.width / 3.7,
                  //       decoration: BoxDecoration(
                  //         color: Color.fromARGB(82, 197, 194, 194),
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       child: Center(
                  //         child: Text(
                  //           'Exit',
                  //           style: TextStyle(
                  //               color: Color.fromARGB(255, 107, 105, 105),
                  //               fontSize: 17,
                  //               wordSpacing: 2,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ))
                ],
              ),
            ),
          if (gameOver)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 24, 37, 176),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.85, -0.95),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 18.5,
                      width: MediaQuery.of(context).size.width / 9,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.dangerous,
                            color: Colors.white,
                          )),
                      decoration: BoxDecoration(
                        color: Color(0xFF3248DA),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(
                              10.0,
                              15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.61),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.9,
                      width: MediaQuery.of(context).size.width / 1.60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 207, 202, 202),
                        //Color(0xFF1F2866),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.55),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.9,
                      width: MediaQuery.of(context).size.width / 1.35,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 229, 228, 228),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  Align(
                      alignment: AlignmentDirectional(0, 0.25),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width / 1.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                      )),
                  Align(
                    alignment: AlignmentDirectional(0, -0.80),
                    child: Image.asset("assets/goodJob.png"),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text('Your Score -- $score'),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.4, 0.15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 11.5,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Color.fromARGB(255, 251, 195, 112),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                questionData.length.toString(),
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Questions",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 11.5,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Color.fromARGB(255, 25, 221, 32),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '5',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Correct",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 11.5,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Color.fromARGB(255, 255, 97, 97),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 10.0,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "5",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Incorrect",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.65),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 13.5,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Color(0xFF3248DA),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10.0,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 105, top: 20),
                        child: Text(
                          'Home',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.43),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 13.5,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Color(0xFF00CAF2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10.0,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 80, top: 20),
                        child: Text(
                          'LeaderBoard',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}

class QuestionModel {
  String question = '';
  String option1 = '';
  String option2 = '';
  String option3 = '';
  String option4 = '';
  String correctAnswer = '';
}

// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({Key? key}) : super(key: key);

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   var currentQuestionIndex = 0;
//   int seconds = 60;
//   Timer? timer;
//   late Future quiz;

//   int points = 0;

//   var isLoaded = false;

//   var optionsList = [];

//   var optionsColor = [
//     Colors.white,
//     Colors.white,
//     Colors.white,
//     Colors.white,
//     Colors.white,
//   ];

//   var link = "https://opentdb.com/api.php?amount=20";

//   getQuiz() async {
//     var res = await http.get(Uri.parse(link));
//     if (res.statusCode == 200) {
//       var data = jsonDecode(res.body.toString());
//       print("data is loaded");
//       return data;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     quiz = getQuiz();
//     startTimer();
//   }

//   @override
//   void dispose() {
//     timer!.cancel();
//     super.dispose();
//   }

//   resetColors() {
//     optionsColor = [
//       Colors.white,
//       Colors.white,
//       Colors.white,
//       Colors.white,
//       Colors.white,
//     ];
//   }

//   startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (seconds > 0) {
//           seconds--;
//         } else {
//           gotoNextQuestion();
//         }
//       });
//     });
//   }

//   gotoNextQuestion() {
//     isLoaded = false;
//     currentQuestionIndex++;
//     resetColors();
//     timer!.cancel();
//     seconds = 60;
//     startTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         padding: const EdgeInsets.all(12),
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Colors.blue, Color.fromARGB(255, 14, 29, 110)],
//         )),
//         child: FutureBuilder(
//           future: quiz,
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData) {
//               var data = snapshot.data["results"];

//               if (isLoaded == false) {
//                 optionsList = data[currentQuestionIndex]["incorrect_answers"];
//                 optionsList.add(data[currentQuestionIndex]["correct_answer"]);
//                 optionsList.shuffle();
//                 isLoaded = true;
//               }

//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             border: Border.all(width: 2),
//                           ),
//                           child: IconButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               icon: const Icon(
//                                 CupertinoIcons.xmark,
//                                 color: Colors.white,
//                                 size: 28,
//                               )),
//                         ),
//                         Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             Text(
//                               "$seconds",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 80,
//                               height: 80,
//                               child: CircularProgressIndicator(
//                                 value: seconds / 60,
//                                 valueColor:
//                                     const AlwaysStoppedAnimation(Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16),
//                             border: Border.all(width: 2),
//                           ),
//                           child: TextButton.icon(
//                             onPressed: null,
//                             icon: const Icon(CupertinoIcons.heart_fill,
//                                 color: Colors.white, size: 18),
//                             label: Text(
//                               "$seconds",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 24,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Image.network(
//                         'https://images.unsplash.com/photo-1661630803143-de2704595708?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
//                         width: 200),
//                     const SizedBox(height: 20),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Question ${currentQuestionIndex + 1} of ${data.length}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       data[currentQuestionIndex]["question"],
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: optionsList.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         var answer =
//                             data[currentQuestionIndex]["correct_answer"];

//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               if (answer.toString() ==
//                                   optionsList[index].toString()) {
//                                 optionsColor[index] = Colors.green;
//                                 points = points + 10;
//                               } else {
//                                 optionsColor[index] = Colors.red;
//                               }

//                               if (currentQuestionIndex < data.length - 1) {
//                                 Future.delayed(const Duration(seconds: 1), () {
//                                   gotoNextQuestion();
//                                 });
//                               } else {
//                                 timer!.cancel();
//                                 //here you can do whatever you want with the results
//                               }
//                             });
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.only(bottom: 20),
//                             alignment: Alignment.center,
//                             width: size.width - 100,
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: optionsColor[index],
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Text(
//                               optionsList[index].toString(),
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation(Colors.white),
//                 ),
//               );
//             }
//           },
//         ),
//       )),
//     );
//   }
// }
