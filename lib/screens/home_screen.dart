import 'package:flutter/material.dart';

import 'station_screen.dart';
import 'station_details.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  //TabBarScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              Icon(
                Icons.location_on,
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Salt Lake',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          bottom: TabBar(indicatorColor: Theme.of(context).primaryColor, tabs: [
            Tab(text: 'Station'),
            Tab(text: 'Station Details'),
            Tab(text: 'About'),
          ]),
        ),
        body: TabBarView(children: [
          StationScreen(),
          StationDetailsScreen(),
          AboutScreen(),
        ]),
      ),
    );
  }
}
