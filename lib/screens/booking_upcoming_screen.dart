import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/booking_list_item.dart';
import '../models/booking_item.dart';
import '../providers/booking_data_container.dart';

import '../widgets/booking_list_item.dart';

class BookingUpcomingScreen extends StatelessWidget {
  //const BookingScreen({Key? key}) : super(key: key);
  static const routeName = 'booking_upcoming_screen';

  @override
  Widget build(BuildContext context) {
    final bookingData = Provider.of<BookingDataContainer>(context);
    final bookings = bookingData.bookings;
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
            // return BookingListItem();
            return BookingListItem(
              bookingDate: bookings[index].bookingDate,
              bookingPower: bookings[index].bookingPower,
              bookingPrice: bookings[index].bookingPrice,
              bookingTime: bookings[index].bookingTime,
              carBrand: bookings[index].carBrand,
              carImg: bookings[index].carImg,
              carType: bookings[index].carType,
            );
          },
          itemCount: bookings.length,
        ),
      ),
    );
  }
}
