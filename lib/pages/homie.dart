import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/pages/home.dart';
import 'package:my_quiz/pages/profile.dart';


class Homie extends StatefulWidget {
  Homie({Key? key}) : super(key: key);

  @override
  State<Homie> createState() => _HomieState();
}

class _HomieState extends State<Homie> {
  int currentIndex = 0;

  navigate(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const Home(),
      const Profile(),
//const QuizScreen(),
      const Profile(),
      const Profile(),
    ];
    return Scaffold(
        bottomNavigationBar: GNav(
          onTabChange: (index) {
            navigate(index);
          },
          tabBorderRadius: 15,
          curve: Curves.easeInCubic,
          selectedIndex: currentIndex,
          gap: 8,
          tabBackgroundColor: const Color.fromARGB(255, 45, 139, 216),
          tabs: const [
            GButton(text: 'Home', icon: Icons.home),
            GButton(text: 'Explore', icon: Icons.apps),
            GButton(text: 'Leaderboard', icon: Icons.chat_bubble),
            GButton(text: 'Profile', icon: Icons.settings),
          ],
        ),
        endDrawerEnableOpenDragGesture: true,
        body: pages[currentIndex]);
  }
}
