import 'package:flutter/material.dart';

class QuizMaker extends StatefulWidget {
  const QuizMaker({super.key});

  @override
  State<QuizMaker> createState() => _QuizMakerState();
}

class _QuizMakerState extends State<QuizMaker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}