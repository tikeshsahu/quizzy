import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  bool toggleSwitch(bool truu) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 15, 52),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 15, 52),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, -0.28),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.9,
                width: MediaQuery.of(context).size.width / 1.65,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 23, 29, 77),
                  //Color(0xFF1F2866),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.35),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.9,
                width: MediaQuery.of(context).size.width / 1.35,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 23, 29, 77),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.68),
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width / 1.15,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 23, 29, 77),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: ListView(
                    
                    children: ListTile.divideTiles(context: context, tiles: [
                      ListTile(
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        tileColor: Colors.white24,
                        leading: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.music_note,
                                  size: 40,
                                ),
                                Text(
                                  "Music",
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                            Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: Colors.blue,
                                  activeTrackColor: Colors.yellow,
                                  inactiveThumbColor: Colors.redAccent,
                                  inactiveTrackColor: Colors.orange,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                         textColor: Colors.white,
                        iconColor: Colors.white,
                        tileColor: Colors.white24,
                        leading: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.music_note,
                                  size: 40,
                                ),
                                Text(
                                  "Music",
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                            Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: Colors.blue,
                                  activeTrackColor: Colors.yellow,
                                  inactiveThumbColor: Colors.redAccent,
                                  inactiveTrackColor: Colors.orange,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                         textColor: Colors.white,
                        iconColor: Colors.white,
                        tileColor: Colors.white24,
                        leading: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.music_note,
                                  size: 40,
                                ),
                                Text(
                                  "Music",
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                            Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: Colors.blue,
                                  activeTrackColor: Colors.yellow,
                                  inactiveThumbColor: Colors.redAccent,
                                  inactiveTrackColor: Colors.orange,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                         textColor: Colors.white,
                        iconColor: Colors.white,
                        tileColor: Colors.white24,
                        leading: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.music_note,
                                  size: 40,
                                ),
                                Text(
                                  "Music",
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                            Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: Colors.blue,
                                  activeTrackColor: Colors.yellow,
                                  inactiveThumbColor: Colors.redAccent,
                                  inactiveTrackColor: Colors.orange,
                                )),
                          ],
                        ),
                      ),
                      ListTile(
                         textColor: Colors.white,
                        iconColor: Colors.white,
                        tileColor: Colors.white24,
                        leading: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.music_note,
                                  size: 40,
                                ),
                                Text(
                                  "Music",
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                            Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: Colors.blue,
                                  activeTrackColor: Colors.yellow,
                                  inactiveThumbColor: Colors.redAccent,
                                  inactiveTrackColor: Colors.orange,
                                )),
                          ],
                        ),
                      ),
                    ]).toList(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
