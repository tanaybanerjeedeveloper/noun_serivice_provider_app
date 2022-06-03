import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/config.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_data_container.dart';

import '../utilities/constants.dart';
import '../widgets/button.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'form_screen.dart';

class OtpScreen extends StatefulWidget {
  //OtpScreen({Key? key}) : super(key: key);
  static const routeName = 'otp_screen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  var _firstField;
  var _secondField;
  var _thirdField;
  var _fourthField;
  var phoneNumber;
  var otp;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    phoneNumber =
        Provider.of<UserDataContainer>(context, listen: false).phoneNumber;
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  Future<void> _submitOTP(
      {required BuildContext context,
      required String firstVal,
      required String secondVal,
      required String thirdVal,
      required String fourthVal}) async {
    otp = '$firstVal$secondVal$thirdVal$fourthVal';
    print('OTP: $otp');
    try {
      var response = await http.post(
        Uri.parse('$baseURL/station/verify-otp'),
        body: json.encode({
          "phone": phoneNumber,
          "otp": otp,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 202) {
        print('response: ${response.body}');
        print('otp verified');
        Navigator.pushNamed(context, FormScreen.routeName);
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: kScaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OTP VERIFICATION',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Text(
              'We need to send OTP to authenticate your number',
            ),
            SizedBox(
              height: mediaQuery.height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1f1f1f),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    width: 60,
                    child: TextFormField(
                      autofocus: true,
                      // obscureText: true,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: InputBorder.none),
                      onChanged: (value) {
                        _firstField = value;
                        nextField(value, pin2FocusNode);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1f1f1f),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    width: 60,
                    child: TextFormField(
                      focusNode: pin2FocusNode,
                      autofocus: true,
                      // obscureText: true,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: InputBorder.none),
                      onChanged: (value) {
                        _secondField = value;
                        nextField(value, pin3FocusNode);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1f1f1f),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    width: 60,
                    child: TextFormField(
                        focusNode: pin3FocusNode,
                        autofocus: true,
                        // obscureText: true,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          _thirdField = value;
                          nextField(value, pin4FocusNode);
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1f1f1f),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    width: 60,
                    child: TextFormField(
                      focusNode: pin4FocusNode,
                      autofocus: true,
                      // obscureText: true,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: InputBorder.none),
                      onChanged: (value) {
                        if (value.length == 1) {
                          _fourthField = value;
                          pin4FocusNode!.unfocus();
                          // Then you need to check is the code is correct or not
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.2,
            ),
            Button('VERIFY', () {
              Timer(const Duration(milliseconds: 500), () {
                print('firstField: $_firstField');
                print('secondField: $_secondField');
                print('thirdField: $_thirdField');
                print('fourthField: $_fourthField');
                print('phoneNumber: $phoneNumber');
                _submitOTP(
                    context: context,
                    firstVal: _firstField,
                    secondVal: _secondField,
                    thirdVal: _thirdField,
                    fourthVal: _fourthField);
              });
              // Timer(const Duration(milliseconds: 500),
              //     () => Navigator.pushNamed(context, FormScreen.routeName));
            }),
          ],
        ),
      ),
    );
  }
}
