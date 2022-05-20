import 'package:flutter/material.dart';

class StationScreen extends StatefulWidget {
  StationScreenState createState() => StationScreenState();
}

class StationScreenState extends State<StationScreen> {
  final Color color = Color(0xff00edff);
  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.height);
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      // decoration: const BoxDecoration(color: Colors.amber),
      child: Stack(
        children: [
          Positioned(
            left: width * 0.25,
            top: !tabLayout && !largeLayout ? height * 0.42 : height * 0.25,
            right: width * 0.25,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '15',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'slots remaining',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              width: width * 0.05,
              height: height * 0.15,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                border: Border.all(color: color, width: 3),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/semi.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color,
                    blurRadius: 10,
                    offset: Offset(1, 2),
                  )
                ],
              ),
            ),
          ),
          //start form here
          Positioned(
            left: width * 0.25,
            top: height * 0.09,
            right: width * 0.25,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.12, right: width * 0.12),
              child: Container(
                height:
                    !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
                width: width * 0.15,
                // color: Colors.amber,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02,
                          top: height * 0.002,
                          right: height * 0.01),
                      child: InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/present-orders'),
                        child: Container(
                          width: double.infinity,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              shape: BoxShape.circle,
                              border: Border.all(color: color, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: color,
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ]),
                          // child: Image.asset('assets/images/presentOrders.png',
                          //     scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.009),
                    Text(
                      'Booking',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: !tabLayout && !largeLayout ? 12 : 14),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: width * 0.05,
            top: height * 0.20,
            // right: width * 0.6,
            child: Container(
              height:
                  !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
              width: width * 0.25,
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.002,
                        right: height * 0.01),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/order-history'),
                      child: Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            shape: BoxShape.circle,
                            border: Border.all(color: color, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: color,
                                  blurRadius: 5,
                                  offset: Offset(1, 2))
                            ]),
                        // child: Image.asset('assets/images/orderHistory.png',
                        //     scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.009),
                  Text(
                    'Order\n History',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 12 : 14),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: width * 0.7,
            top: height * 0.20,
            // right: width * 0.6,
            child: Container(
              height:
                  !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
              width: width * 0.25,
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.002,
                        right: height * 0.01),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/cancelled-orders'),
                      child: Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            shape: BoxShape.circle,
                            border: Border.all(color: color, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: color,
                                  blurRadius: 5,
                                  offset: Offset(1, 2))
                            ]),
                        // child: Image.asset('assets/images/cancelledOrders.png',
                        //     scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.009),
                  Text(
                    'Cancelled\n Orders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 12 : 14),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: width * 0.7,
            top: height * 0.39,
            // right: width * 0.6,
            child: Container(
              height:
                  !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
              width: width * 0.25,
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.002,
                        right: height * 0.01),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/order-details'),
                      child: Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            shape: BoxShape.circle,
                            border: Border.all(color: color, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: color,
                                  blurRadius: 5,
                                  offset: Offset(1, 2))
                            ]),
                        // child: Image.asset('assets/images/orderDetails.png',
                        //     scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.009),
                  Text(
                    'Order\n Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 12 : 14),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: width * 0.05,
            top: height * 0.39,
            // right: width * 0.6,
            child: Container(
              height:
                  !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
              width: width * 0.25,
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.002,
                        right: height * 0.01),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/profile-screen'),
                      child: Container(
                        width: double.infinity,
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            shape: BoxShape.circle,
                            border: Border.all(color: color, width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: color,
                                  blurRadius: 5,
                                  offset: Offset(1, 2))
                            ]),
                        // child: Image.asset('assets/images/rating.png',
                        //     scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.009),
                  Text(
                    'Rating',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: !tabLayout && !largeLayout ? 12 : 14),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: width * 0.25,
            top: height * 0.45,
            right: width * 0.25,
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.12, right: width * 0.12),
              child: Container(
                height:
                    !tabLayout && !largeLayout ? height * 0.16 : height * 0.15,
                width: width * 0.15,
                // color: Colors.amber,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02,
                          top: height * 0.002,
                          right: height * 0.01),
                      child: InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/present-orders'),
                        child: Container(
                          width: double.infinity,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.tertiary,
                              shape: BoxShape.circle,
                              border: Border.all(color: color, width: 3),
                              boxShadow: [
                                BoxShadow(
                                    color: color,
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ]),
                          // child: Image.asset('assets/images/presentOrders.png',
                          //     scale: !tabLayout && !largeLayout ? 1.5 : 1.0),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.009),
                    Text(
                      'Booking',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: !tabLayout && !largeLayout ? 12 : 14),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
