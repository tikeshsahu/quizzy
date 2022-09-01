import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:my_quiz/pages/homie.dart';
import 'package:my_quiz/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //     width: 320,
            //     height: 300,
            //     child: Image.asset('assets/quizzy.gif', fit: BoxFit.contain)),
            // SizedBox(
            //   height: 22,
            // ),
            Text(
              'Welcome, To Quizzy',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 150,
            ),
            SignInButton(Buttons.GoogleDark, onPressed: () async {
              await signWithGoogle();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Homie()));
            })
          ],
        ),
      )),
    );
  }
}
