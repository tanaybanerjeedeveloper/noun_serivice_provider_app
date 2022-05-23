import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class StationDetailsScreen extends StatelessWidget {
  //const StationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: mediaQuery.height * 0.6,
        decoration: kContainer,
        // margin: EdgeInsets.symmetric(
        //     vertical: mediaQuery.height * 0.15, horizontal: 20.0),
        padding: EdgeInsets.symmetric(vertical: mediaQuery.height * 0.05),
        margin: EdgeInsets.symmetric(
            vertical: mediaQuery.height * 0.07,
            horizontal: mediaQuery.width * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Name'),
                Text('Lightning bolt'),
              ],
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        'Address',
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.red,
                    ),
                    flex: 2,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Container(
                      width: 110,
                      child: Text('489 banerjee para road, kolkata-41'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
