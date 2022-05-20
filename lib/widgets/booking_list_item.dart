import 'package:flutter/material.dart';

class BookingListItem extends StatelessWidget {
  // const BookingListItem({Key? key}) : super(key: key);

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
                      'assets/images/car.png',
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
                          'Gimenez',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Lamborghini Sian',
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
                            '2/2/2022',
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
                            '9:30 pm',
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
                            '50KwH',
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
                          '₹ 852',
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
