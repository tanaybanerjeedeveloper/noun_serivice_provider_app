import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatelessWidget {
  //const PaymentHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text('Payment History'),
      ),
      body: Center(
        child: Text(
          'Payment History',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
