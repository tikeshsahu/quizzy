import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 24, 37, 176),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.85, -0.95),
              child: Container(
                height: MediaQuery.of(context).size.height / 18.5,
                width: MediaQuery.of(context).size.width / 9,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.dangerous,
                      color: Colors.white,
                    )),
                decoration: BoxDecoration(
                  color: Color(0xFF3248DA),
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
              alignment: AlignmentDirectional(0, 0.61),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.9,
                width: MediaQuery.of(context).size.width / 1.60,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 207, 202, 202),
                  //Color(0xFF1F2866),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.55),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.9,
                width: MediaQuery.of(context).size.width / 1.35,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 229, 228, 228),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            Align(
                alignment: AlignmentDirectional(0, 0.25),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width / 1.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                )),
            Align(
              alignment: AlignmentDirectional(0, -0.80),
              child: Image.asset("assets/goodJob.png"),
            ),
            Align(
              alignment: AlignmentDirectional(-0.4, 0.15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 11.5,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color.fromARGB(255, 251, 195, 112),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10.0,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "15",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Questions",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 11.5,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color.fromARGB(255, 25, 221, 32),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10.0,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Correct",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 11.5,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color.fromARGB(255, 255, 97, 97),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10.0,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "03",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Incorrect",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.65),
              child: Container(
                height: MediaQuery.of(context).size.height / 13.5,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xFF3248DA),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10.0,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 105, top: 20),
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.43),
              child: Container(
                height: MediaQuery.of(context).size.height / 13.5,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xFF00CAF2),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 10.0,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80, top: 20),
                  child: Text(
                    'LeaderBoard',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
