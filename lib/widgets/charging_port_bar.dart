import 'package:flutter/material.dart';

class ChargingPortBar extends StatelessWidget {
  // const ChargingPortBar({Key? key}) : super(key: key);
  final String title;

  ChargingPortBar({required this.title});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          const BoxShadow(
            color: Color(0xff00ffba),
            offset: Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          const BoxShadow(
              color: Colors.black,
              offset: Offset(-4, -4),
              blurRadius: 10,
              spreadRadius: 1)
        ],
      ),
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}
