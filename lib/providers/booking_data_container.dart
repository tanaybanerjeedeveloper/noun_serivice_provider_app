import 'package:flutter/material.dart';

import '../models/booking_item.dart';

class BookingDataContainer with ChangeNotifier {
  List<BookingItem> _bookings = [
    BookingItem(
        bookingDate: '2/3/2022',
        bookingPower: '50KwH',
        bookingPrice: '456',
        bookingTime: '9:40 pm',
        carBrand: 'Gimenez',
        carImg: 'assets/images/car.png',
        carType: 'Lamborghini Sian',
        id: '1'),
    BookingItem(
        bookingDate: '2/3/2022',
        bookingPower: '50KwH',
        bookingPrice: '456',
        bookingTime: '9:40 pm',
        carBrand: 'Gimenez',
        carImg: 'assets/images/car.png',
        carType: 'Lamborghini Sian',
        id: '2'),
    BookingItem(
        bookingDate: '2/3/2022',
        bookingPower: '50KwH',
        bookingPrice: '456',
        bookingTime: '9:40 pm',
        carBrand: 'Gimenez',
        carImg: 'assets/images/car.png',
        carType: 'Lamborghini Sian',
        id: '3'),
    BookingItem(
        bookingDate: '2/3/2022',
        bookingPower: '50KwH',
        bookingPrice: '456',
        bookingTime: '9:40 pm',
        carBrand: 'Gimenez',
        carImg: 'assets/images/car.png',
        carType: 'Lamborghini Sian',
        id: '4'),
    BookingItem(
        bookingDate: '2/3/2022',
        bookingPower: '50KwH',
        bookingPrice: '456',
        bookingTime: '9:40 pm',
        carBrand: 'Gimenez',
        carImg: 'assets/images/car.png',
        carType: 'Lamborghini Sian',
        id: '5'),
  ];

  List<BookingItem> get bookings {
    return [..._bookings];
  }
}
