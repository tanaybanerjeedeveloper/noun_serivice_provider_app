import 'package:flutter/material.dart';

import '../widgets/booking_list_item.dart';

class BookingHistoryScreen extends StatelessWidget {
  //const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text('Booking History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return BookingListItem();
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
