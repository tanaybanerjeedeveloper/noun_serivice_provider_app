import 'package:flutter/material.dart';

import '../widgets/booking_list_item.dart';

class BookingUpcomingScreen extends StatelessWidget {
  //const BookingScreen({Key? key}) : super(key: key);
  static const routeName = 'booking_upcoming_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text('Upcoming Booking'),
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
