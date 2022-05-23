import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: const Color(0xff1f1f1f),
  hintText: 'Your Name',
  hintStyle: TextStyle(color: Color(0xff62676e)),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(35.0),
    ),
    borderSide: BorderSide.none,
  ),
);

final kContainer = BoxDecoration(
  color: const Color(0xff1f1f1f),
  borderRadius: BorderRadius.circular(20),
  boxShadow: const [
    BoxShadow(
      color: Color(0xff00ffba),
      offset: Offset(0, 0),
      blurRadius: 15,
      spreadRadius: 0.5,
    ),
    BoxShadow(
      color: Colors.black,
      offset: Offset(-4, -4),
      blurRadius: 10,
    )
  ],
);
