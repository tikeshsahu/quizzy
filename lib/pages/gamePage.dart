// import 'dart:async';

// import 'package:flutter/material.dart';

// class GamePage extends StatefulWidget {
//   const GamePage({super.key});

//   @override
//   State<GamePage> createState() => _GamePageState();
// }

// class _GamePageState extends State<GamePage> {
//   bool gameOver = false;
//   int seconds = 60;
//   Timer? timer;

//   startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (seconds > 0) {
//           seconds--;
//         } else {
//           //gotoNextQuestion();
//         }
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     //quiz = getQuiz();
//     startTimer();
//   }

//   @override
//   void dispose() {
//     timer!.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//             future: Future,
//             builder: ((context, snapshot) {
//               if (snapshot.hasData) {
//                 return SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       if (!gameOver)
//                         Container(
//                           height: MediaQuery.of(context).size.height,
//                           width: MediaQuery.of(context).size.height,
//                           child: Stack(
//                             children: [
//                               Container(
//                                 height:
//                                     MediaQuery.of(context).size.height / 3.7,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 33, 48, 214),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(-0.85, -0.82),
//                                 child: Text(
//                                   'Question 1',
//                                   style: TextStyle(
//                                       fontSize: 21, color: Colors.white),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(0.85, -0.82),
//                                 child: Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Text(
//                                       "$seconds",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 24,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 80,
//                                       height: 80,
//                                       child: CircularProgressIndicator(
//                                         value: seconds / 60,
//                                         valueColor:
//                                             const AlwaysStoppedAnimation(
//                                                 Colors.white),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 // Container(
//                                 //     color: Colors.amber,
//                                 //     height: 30,
//                                 //     width: 80,
//                                 //     child:
//                                 //     // CustomTimer(
//                                 //     //     controller: timeController,
//                                 //     //     begin: Duration(seconds: 0),
//                                 //     //     end: Duration(minutes: 30),
//                                 //     //     builder: (time) {
//                                 //     //       return Text("${time.minutes}:${time.seconds}",
//                                 //     //           style: TextStyle(fontSize: 24.0));
//                                 //     //     })
//                                 //       ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(0, 0.08),
//                                 child: Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 1.6,
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.1,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(18),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         height:
//                                             MediaQuery.of(context).size.height /
//                                                 7,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         //color: Colors.black26,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(30.0),
//                                           child: Center(
//                                             child: Text(
//                                               questionModel.question,
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 8,
//                                       ),
//                                       Container(
//                                         height:
//                                             MediaQuery.of(context).size.height /
//                                                 3,
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 1.28,
//                                         //color: Colors.black12,
//                                         child: ListView.builder(
//                                             physics:
//                                                 NeverScrollableScrollPhysics(),
//                                             itemCount: 4,
//                                             itemBuilder: ((context, index) {
//                                               return Column(
//                                                 children: [
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       // setState(() {
//                                                       //   optionTapped =
//                                                       //       !optionTapped;
//                                                       // });

//                                                       // if (options[index]
//                                                       //         .toString() ==
//                                                       //     questionModel
//                                                       //         .correctAnswer) {
//                                                       //   print('Correct Answer');
//                                                       //   setState(() {
//                                                       //     score += 20;
//                                                       //   });
//                                                       // } else {
//                                                       //   print(
//                                                       //       'Incorrect Answer');
//                                                       //   // showDialog(
//                                                       //   //     context: context,
//                                                       //   //     builder: (ctx) => AlertDialog(
//                                                       //   //           title: const Text(
//                                                       //   //               "Incorrect"),
//                                                       //   //         ));
//                                                       // }
//                                                     },
//                                                     child: Container(
//                                                         height: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height /
//                                                             13.5,
//                                                         width: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .width /
//                                                             1.28,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                            color: 
//                                                           // optionTapped
//                                                           //     ? Colors.amber
//                                                           //     : 
//                                                               Color.fromARGB(
//                                                                   70,
//                                                                   231,
//                                                                   227,
//                                                                   227),
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(18),
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(20.0),
//                                                           child: Text(
//                                                             options[index],
//                                                             style: TextStyle(
//                                                                 fontSize: 18,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                                 color: Color
//                                                                     .fromARGB(
//                                                                         255,
//                                                                         136,
//                                                                         134,
//                                                                         134)),
//                                                           ),
//                                                         )),
//                                                   ),
//                                                   SizedBox(
//                                                     height: 10,
//                                                   ),
//                                                 ],
//                                               );
//                                             })),
//                                       ),
//                                       SizedBox(
//                                         height: 28,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           // setState(() {
//                                           //   optionTapped = false;
//                                           //   questionData.removeAt(0);
//                                           //   shuffleAndSetAnswer();
//                                           //   if (questionData.isEmpty) {
//                                           //     gameOver = true;
//                                           //   }
//                                           // });
//                                         },
//                                         child: Container(
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height /
//                                                 15,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 1.4,
//                                             decoration: BoxDecoration(
//                                               color: Color.fromARGB(
//                                                   255, 33, 48, 214),
//                                               borderRadius:
//                                                   BorderRadius.circular(15),
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 'Next',
//                                                 style: TextStyle(
//                                                     fontSize: 18,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.white),
//                                               ),
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               // Align(
//                               //     alignment: AlignmentDirectional(0, 0.9),
//                               //     child: Container(
//                               //       height: MediaQuery.of(context).size.height / 18,
//                               //       width: MediaQuery.of(context).size.width / 3.7,
//                               //       decoration: BoxDecoration(
//                               //         color: Color.fromARGB(82, 197, 194, 194),
//                               //         borderRadius: BorderRadius.circular(8),
//                               //       ),
//                               //       child: Center(
//                               //         child: Text(
//                               //           'Exit',
//                               //           style: TextStyle(
//                               //               color: Color.fromARGB(255, 107, 105, 105),
//                               //               fontSize: 17,
//                               //               wordSpacing: 2,
//                               //               fontWeight: FontWeight.bold),
//                               //         ),
//                               //       ),
//                               //     ))
//                             ],
//                           ),
//                         ),
//                       if (gameOver)
//                         Container(
//                           height: MediaQuery.of(context).size.height,
//                           width: MediaQuery.of(context).size.width,
//                           color: Color.fromARGB(255, 24, 37, 176),
//                           child: Stack(
//                             children: [
//                               Align(
//                                 alignment: AlignmentDirectional(0.85, -0.95),
//                                 child: Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 18.5,
//                                   width: MediaQuery.of(context).size.width / 9,
//                                   child: IconButton(
//                                       onPressed: () {},
//                                       icon: Icon(
//                                         Icons.dangerous,
//                                         color: Colors.white,
//                                       )),
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFF3248DA),
//                                     borderRadius: BorderRadius.circular(15),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color: Colors.black45,
//                                         blurRadius: 10.0,
//                                         spreadRadius: 2.0,
//                                         offset: Offset(
//                                           10.0,
//                                           15.0,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(0, 0.61),
//                                 child: Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 1.9,
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.60,
//                                   decoration: BoxDecoration(
//                                     color: Color.fromARGB(255, 207, 202, 202),
//                                     //Color(0xFF1F2866),
//                                     borderRadius: BorderRadius.circular(18),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(0, 0.55),
//                                 child: Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 1.9,
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.35,
//                                   decoration: BoxDecoration(
//                                     color: Color.fromARGB(255, 229, 228, 228),
//                                     borderRadius: BorderRadius.circular(18),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                   alignment: AlignmentDirectional(0, 0.25),
//                                   child: Container(
//                                     height: MediaQuery.of(context).size.height /
//                                         1.5,
//                                     width: MediaQuery.of(context).size.width /
//                                         1.15,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(22),
//                                     ),
//                                   )),
//                               Align(
//                                 alignment: AlignmentDirectional(0, -0.80),
//                                 child: Image.asset("assets/goodJob.png"),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(0, 0),
//                                 child: Text('Your Score -- '),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(-0.4, 0.15),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               11.5,
//                                       width:
//                                           MediaQuery.of(context).size.width / 4,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(9),
//                                         color:
//                                             Color.fromARGB(255, 251, 195, 112),
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             color: Colors.black45,
//                                             blurRadius: 10.0,
//                                             offset: Offset(
//                                               5.0,
//                                               5.0,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: const [
//                                           Text(
//                                             //questionData.length.toString(),
//                                             '0',
//                                             style: TextStyle(
//                                                 fontSize: 28,
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           Text(
//                                             "Questions",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.white),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               11.5,
//                                       width:
//                                           MediaQuery.of(context).size.width / 4,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(9),
//                                         color: Color.fromARGB(255, 25, 221, 32),
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             color: Colors.black45,
//                                             blurRadius: 10.0,
//                                             offset: Offset(
//                                               5.0,
//                                               5.0,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: const [
//                                           Text(
//                                             '5',
//                                             style: TextStyle(
//                                                 fontSize: 28,
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           Text(
//                                             "Correct",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.white),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Container(
//                                       height:
//                                           MediaQuery.of(context).size.height /
//                                               11.5,
//                                       width:
//                                           MediaQuery.of(context).size.width / 4,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(9),
//                                         color: Color.fromARGB(255, 255, 97, 97),
//                                         boxShadow: const [
//                                           BoxShadow(
//                                             color: Colors.black45,
//                                             blurRadius: 10.0,
//                                             offset: Offset(
//                                               5.0,
//                                               5.0,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: const [
//                                           Text(
//                                             "5",
//                                             style: TextStyle(
//                                                 fontSize: 28,
//                                                 color: Colors.white,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           Text(
//                                             "Incorrect",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.white),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(0, 0.65),
//                                 child: Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 13.5,
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.5,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(9),
//                                     color: Color(0xFF3248DA),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color: Colors.black45,
//                                         blurRadius: 10.0,
//                                         offset: Offset(
//                                           5.0,
//                                           5.0,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 105, top: 20),
//                                     child: Text(
//                                       'Home',
//                                       style: TextStyle(
//                                           fontSize: 18, color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional(0, 0.43),
//                                 child: Container(
//                                   height:
//                                       MediaQuery.of(context).size.height / 13.5,
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.5,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(9),
//                                     color: Color(0xFF00CAF2),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                         color: Colors.black45,
//                                         blurRadius: 10.0,
//                                         offset: Offset(
//                                           5.0,
//                                           5.0,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 80, top: 20),
//                                     child: Text(
//                                       'LeaderBoard',
//                                       style: TextStyle(
//                                           fontSize: 18, color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                     ],
//                   ),
//                 );
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             })));
//   }
// }
