import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../widgets/3rd_party_login_btn.dart';
import '../widgets/button.dart';
import 'home_screen.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'otp_screen.dart';
import '../utilities/config.dart';

class LoginScreen extends StatefulWidget {
  //LoginScreen({Key? key}) : super(key: key);
  static const id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _isElevated = true;
  var _checkBoxValue = false;
  String? _phoneNumber;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> _login(String phone) async {
    print('phone: $phone');
    try {
      var response =
          await http.post(Uri.parse('$baseURL/station/service-provider-login'),
              body: json.encode(
                {"phone": phone},
              ),
              headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201) {
        print('response: ${response.body}');
        print('account created successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Form(
        key: key,
        child: SingleChildScrollView(
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
                    child: TextFormField(
                      // onChanged: (value) {
                      //   _phoneNumber = value;
                      // },
                      validator: (value) {
                        print('value: $value');
                        if (value!.isEmpty) {
                          return 'Enter number';
                        } else {
                          _phoneNumber = value;
                          print('no: $_phoneNumber');
                        }
                      },
                      decoration:
                          kTextFieldDecoration.copyWith(hintText: 'Phone'),
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
                          data: ThemeData(
                              unselectedWidgetColor: Color(0xff1f1f1f)),
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
                  Button(
                    'LOGIN',
                    () {
                      print('from here: $_phoneNumber');
                      if (key.currentState!.validate()) {
                        _login(_phoneNumber!);
                      }
                    },
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       print('from here: $_phoneNumber');
                  //       if (key.currentState!.validate()) {
                  //         _login(_phoneNumber!);
                  //       }
                  //     },
                  //     child: Text('data')),
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
      ),
    );
  }
}
