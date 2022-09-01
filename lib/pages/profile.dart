import 'package:flutter/material.dart';
import 'package:my_quiz/pages/login.dart';
import 'package:my_quiz/providers/profile_pro.dart';
import 'package:my_quiz/services/auth.dart';
import 'package:my_quiz/services/localdb.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var isInit = true;
  var isLoading = false;

  @override
  void didChangeDependencies() {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      // Provider.of<ProfileProvider>(context, )
      //     .getUserDetails()
      Provider.of<ProfileProvider>(
        context,
      ).getUserDetails().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 230, 230),
        body: SafeArea(
          child: isLoading
              ? Center(child: Text('Loading'))
              : Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.height,
                  child: Consumer<ProfileProvider>(
                    builder: (context, value, child) => Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3.7,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 33, 48, 214),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.0, -0.82),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                            alignment: AlignmentDirectional(0, -0.55),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3.4,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      backgroundImage:
                                          NetworkImage(value.proUrl),
                                      radius: 60,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    value.name,
                                    style: TextStyle(
                                        wordSpacing: 4,
                                        fontSize: 26,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              22,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 33, 48, 214),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Rank - #${value.rank}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              22,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 53, 238, 195),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Level - ${value.level}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            )),
                        Align(
                            alignment: AlignmentDirectional(0, 0.65),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 2.8,
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    child: Text('Money --- ${value.money}'),
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height /
                                        6.8,
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () async {
                              await signOut();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginPage()));
                            },
                            child: Text('Sign out'))
                      ],
                    ),
                  ),
                ),
        ));
  }
}
