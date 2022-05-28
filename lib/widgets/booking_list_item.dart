import 'package:flutter/material.dart';

class BookingListItem extends StatelessWidget {
  // const BookingListItem({Key? key}) : super(key: key);
  final String carImg;
  final String carBrand;
  final String carType;
  final String bookingDate;
  final String bookingPrice;
  final String bookingTime;
  final String bookingPower;

  BookingListItem({
    required this.bookingDate,
    required this.carBrand,
    required this.carType,
    required this.bookingPower,
    required this.bookingPrice,
    required this.bookingTime,
    required this.carImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          color: const Color(0xff1f1f1f),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 15,
              spreadRadius: 0.5,
            ),
          ]),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      carImg,
                      width: 70,
                      height: 70,
                    ),
                    VerticalDivider(
                      color: Theme.of(context).primaryColor,
                      width: 20,
                      thickness: 1,
                      indent: 1,
                      endIndent: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          carBrand,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          carType,
                          style: TextStyle(color: Colors.grey, fontSize: 13.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Date:',
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            bookingDate,
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Time:',
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            bookingTime,
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Power:',
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            bookingPower,
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  VerticalDivider(
                    color: Theme.of(context).primaryColor,
                    width: 20,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      FittedBox(
                        child: Text(
                          '₹ $bookingPrice',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
