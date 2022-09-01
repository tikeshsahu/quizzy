import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_quiz/pages/home.dart';
import 'package:my_quiz/pages/homie.dart';
import 'package:my_quiz/pages/login.dart';
import 'package:my_quiz/pages/profile.dart';
import 'package:my_quiz/pages/questionPage.dart';
import 'package:my_quiz/providers/profile_pro.dart';
import 'package:my_quiz/providers/quizData_pro.dart';
import 'package:provider/provider.dart';
import 'providers/questions_pro.dart';
import 'services/localdb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loggedIn = false;

  getLoggedInState() async {
    await LocalDB.getUserID().then((value) {
      setState(() {
        loggedIn = value.toString() != "null";
      });
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    getLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (ctx) => QuizDataProvider()),
         ChangeNotifierProvider(create: (ctx) => ProfileProvider()),
         //ChangeNotifierProvider(create: (ctx) => QuizQuestionsProvider()),
      ],
      //create: (context) => ProfileProvider(),
      child: MaterialApp(
          title: 'Quizzy', debugShowCheckedModeBanner: false, 
          home: Homie()
          //loggedIn ? Homie() : const LoginPage(),
          ),
    );
  }
}
