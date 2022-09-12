import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFF2F46D6),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.03, -0.90),
                child: Text(
                  "LeaderBoard",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.03, -0.4),
                child: ToggleSwitch(
                  minWidth: 90.0,
                  minHeight: 40.0,
                  fontSize: 15.0,
                  initialLabelIndex: 1,
                  activeBgColor: [Color(0xFF14D8FF)],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Color(0xFF068EF1),
                  inactiveFgColor: Colors.white,
                  totalSwitches: 3,
                  labels: ['Local', 'Global', 'Friends'],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.03, 0.215),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  ),
                  radius: 53,
                ),
              ),
              Align(
                  alignment: AlignmentDirectional(0, 0.6),
                  child: Image.asset("assets/L1.png")),
              Align(
                alignment: AlignmentDirectional(-0.85, 0.33),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  ),
                  radius: 46,
                ),
              ),
              Align(
                  alignment: AlignmentDirectional(-1, 0.65),
                  child: Image.asset("assets/L2.png")),
              Align(
                alignment: AlignmentDirectional(0.918, 0.33),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                  ),
                  radius: 46,
                ),
              ),
              Align(
                  alignment: AlignmentDirectional(1, 0.65),
                  child: Image.asset("assets/L3.png"))
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(
                '4',
                style: TextStyle(fontSize: 15),
              ),
              title: Row(children: [
                CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 22,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Falana Dimkana',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ]),
              trailing: Text(
                'Rank',
                style: TextStyle(color: Color(0xFF14D8FF)),
              ),
            );
          },
        ))
      ]),
    );
  }
}
