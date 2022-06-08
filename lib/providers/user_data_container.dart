import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screens/form_screen.dart';
import '../utilities/config.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

class UserDataContainer with ChangeNotifier {
  var phoneNumber = '';
  late int userID;
  late String _token;
  late String otp;

  bool get isAuthenticated {
    return token != null;
  }

  int get id {
    return userID;
  }

  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<void> submitOTP(
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
        //print('otp verified');

        final convertedData = json.decode(response.body); //parsing json data
        userID = convertedData['userData'][0]['id'];
        print('userID: $userID');
        print('${userID.runtimeType}');
        // userID = userID;
        _token = convertedData['token'];
        print('token: $_token');
        //print('status: ${convertedData['status']}');
        Navigator.pushNamed(context, FormScreen.routeName);
      } else {
        final text = 'Incorrect OTP';
        final snackBar = SnackBar(
          content: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.redAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print('failed');
      }
    } catch (e) {
      final text = 'Error occurred';
      final snackBar = SnackBar(content: Text(text));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print(e.toString());
    }
  }

  // void submitForm({
  //   required BuildContext context,
  //   filePath,
  //   filePathTwo,
  // }) {
  //   String fileName = basename(filePath.path);
  //   String fileNameTwo = basename(filePathTwo.path);
  //   var formData = FormData.fromMap({});
  // }
}
