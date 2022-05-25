import 'dart:async';

import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../widgets/3rd_party_login_btn.dart';
import '../widgets/button.dart';
import 'home_screen.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  //LoginScreen({Key? key}) : super(key: key);
  static const id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isElevated = true;
  var _checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.size.height * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 45.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 0.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      const BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: 0.2),
                      const BoxShadow(
                        color: Colors.black,
                        offset: Offset(-4, -4),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {},
                    decoration:
                        kTextFieldDecoration.copyWith(hintText: 'Phone/Email'),
                  ),
                ),
                const SizedBox(
                  height: 55.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallButton('assets/images/fb.png'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    SmallButton('assets/images/gmail.png'),
                  ],
                ),
                const SizedBox(
                  height: 55.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Theme(
                        child: Checkbox(
                          value: _checkBoxValue,
                          shape: CircleBorder(),
                          activeColor: Color(0xff00ffba),
                          onChanged: (value) {
                            setState(() {
                              _checkBoxValue = value!;
                            });
                          },
                        ),
                        data:
                            ThemeData(unselectedWidgetColor: Color(0xff1f1f1f)),
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Color(0xff1f1f1f),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            const BoxShadow(
                              color: Color(0xff00ffba),
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: 0.5,
                            ),
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset(-4, -4),
                              blurRadius: 10,
                            )
                          ]),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Terms and Condition',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 14.0),
                    )
                  ],
                ),
                const SizedBox(
                  height: 75.0,
                ),
                Button('LOGIN', () {
                  // Navigator.pushNamed(context, BottomNavigation.id);
                  // Timer(const Duration(milliseconds: 500),
                  //     () => Navigator.pushNamed(context, BottomNavigation.id));
                  Timer(const Duration(milliseconds: 500),
                      () => Navigator.pushNamed(context, OtpScreen.routeName));
                }),
                const SizedBox(
                  height: 35.0,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Dont Have an account? ',
                    //style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
