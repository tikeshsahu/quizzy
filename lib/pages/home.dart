import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/pages/quiz_intro.dart';
import 'package:my_quiz/pages/extras/sideNavBar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/quizData_pro.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isInit = true;
  var isLoading = false;
  var link = 'https://the-trivia-api.com/api/questions';
  // getQuiz() async {
  //   var response = await http.get(Uri.parse(link));
  //   if (response.statusCode == 200) {
  //     var quizData = jsonDecode(response.body.toString());
  //     print(quizData);
  //   } else {
  //     print('Error ');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   print('Jai ho');
  //   getQuiz();
  // }
  

  // List trail = [];
  // Future fetchData() async {
  //   await FirebaseFirestore.instance
  //       .collection("quizzes")
  //       .doc("NEET")
  //       .collection("questions")
  //       .add({"quiz": "newlyAdded"}).then((value) {
  //     trail.add(value);
  //   });
  //   print(trail);
  //   return trail;
  // }

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });

      // Provider.of<ProfileProvider>(
      //   context,
      // ).getUserDetails();
      Provider.of<QuizDataProvider>(
        context,
      ).getQuiz().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  List categories = [
    'Film & TV',
    'General Knowledge',
    'History & Geography',
    'Science',
    'Sports'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNav(),
      body: SafeArea(
        child: isLoading
            ? Center(child: Text('Loading'))
            : Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.0,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.amber,
                    child: Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3.2,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 24, 37, 176),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                              )),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.85, -0.85),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 14.5,
                            width: MediaQuery.of(context).size.width / 7,
                            child: IconButton(
                                onPressed: () {},
                                icon:
                                    Icon(Icons.open_with, color: Colors.white)),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 47, 58, 183),
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
                          alignment: AlignmentDirectional(0.85, -0.85),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 14.5,
                            width: MediaQuery.of(context).size.width / 7,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_active,
                                  color: Colors.white,
                                )),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 47, 58, 183),
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
                          alignment: AlignmentDirectional(-0.7, -0.35),
                          child: Text(
                            'Welcome Back !',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.85, 0.50),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.05,
                            height: MediaQuery.of(context).size.height / 5,
                            //color: Colors.black26,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1 / 1,
                                  //crossAxisSpacing: 10,
                                ),
                                itemCount: categories.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext ctx, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Text('${categories[index]}'),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Text(
                          'Choose Categories',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'See All',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ))
                    ],
                  ),
                  Align(
                      alignment: AlignmentDirectional(0, 0.35),
                      child: Consumer<QuizDataProvider>(
                        builder: (context, quiz, child) => Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: InkWell(
                              onTap: () async {
                                // await ques.generateQuestions(
                                //     (quiz.quizzes[0])["quiz_name"].toString());
                                await Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            QuizIntro()));
                              },
                              child: Container(
                                height: 150,
                                width: 150,
                                color: Colors.amber,
                                child: Image.network(
                                  (quiz.quizzes[0])["quiz_thumb"],
                                  // alignment: Alignment.center,
                                  // errorBuilder: (context, error, stackTrace) {
                                  //   return const Center(
                                  //     child: Text("Source code 202",
                                  //     style: TextStyle(
                                  //       fontSize: 25,
                                  //       color: Colors.black45,
                                  //     ),
                                  //     ),
                                  //   );
                                  // },
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )),
                      ))
                ],
              ),
      ),
    );
  }
}
