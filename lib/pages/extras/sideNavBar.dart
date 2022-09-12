import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_quiz/pages/home.dart';
import 'package:my_quiz/pages/profile.dart';
import 'package:my_quiz/providers/profile_pro.dart';
import 'package:provider/provider.dart';

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.6,
      child: Material(
        color: Color.fromARGB(255, 10, 15, 52),
        child: Consumer<ProfileProvider>(
          builder: (context, user, child) => ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(user.proUrl),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              listItem(label: "Home", icon: Icons.home,page: Home()),
              listItem(label: "History", icon: Icons.history,),
              listItem(label: "Friend List", icon: Icons.people,),
              listItem(label: "Refer a Friend", icon: Icons.whatshot,),
              listItem(label: "Setting", icon: Icons.settings,page: Settings()),
              listItem(label: "Log Out", icon: Icons.logout,)
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(
      {required String label, required IconData icon,  page}) {
    final color = Colors.white;
    final hovercolor = Colors.white60;

    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
      hoverColor: hovercolor,
      title: Text(label, style: TextStyle(color: color, fontSize: 20)),
      onTap: () {
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (BuildContext context) => page));
      },
    );
  }
}
