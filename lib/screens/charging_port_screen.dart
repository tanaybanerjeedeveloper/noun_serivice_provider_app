import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../models/charging_port.dart';
import '../widgets/charging_port_bar.dart';

class ChargingPortScreen extends StatelessWidget {
  static const routeName = 'charging_port_screen';
  //const ChargingPortScreen({Key? key}) : super(key: key);
  final List<ChargingPort> chargingPortList = [
    ChargingPort(title: 'CCS', price: 123),
    ChargingPort(title: 'CHAdeMO', price: 123),
    ChargingPort(title: 'J1772', price: 123),
    ChargingPort(title: 'GB/T', price: 123),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Charging Port', true),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ChargingPortBar(title: chargingPortList[index].title);
        },
        itemCount: chargingPortList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
