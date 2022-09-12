import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -0.67),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.35,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 105, 123, 245),
                    //Color(0xFF1F2866),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.715),
                child: Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.15,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 59, 82, 233),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              Align(
                  alignment: AlignmentDirectional(0, -1.06),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.15,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 12, 42, 240),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(28),
                          bottomRight: Radius.circular(28)),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.8, -0.6),
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: 'Qui',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55,
                                    color: Color(0xFF00CAF2))),
                            TextSpan(
                                text: 'zzy',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 55))
                          ])),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.7, 0.8),
                          child: Container(
                            //color: Colors.black26,
                            height: 90,
                            width: 230,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                            color: Color(0xFF00CAF2),
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Align(
                alignment: AlignmentDirectional(0, 0.5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    //color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                          focusColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.mail_outline_outlined,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.grey,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                          focusColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: Colors.grey,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: "verdana_regular",
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {}, child: Text('Remember me')),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Color(0xFF00CAF2),
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 13.5,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Color.fromARGB(255, 12, 42, 240),
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
                              padding:
                                  const EdgeInsets.only(left: 100, top: 20),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
