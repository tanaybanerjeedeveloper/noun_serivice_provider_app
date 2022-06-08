import 'package:flutter/material.dart';
import 'package:noun_service_app/screens/booking_history_screen.dart';
import 'package:noun_service_app/screens/booking_upcoming_screen.dart';
import 'package:noun_service_app/screens/login_screen.dart';
import 'package:noun_service_app/screens/otp_screen.dart';
import 'package:noun_service_app/screens/slot_booking_screen.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/add_station_screen.dart';
import 'screens/form_screen.dart';
import 'screens/qr_code_screen.dart';
import 'screens/dashboard_screen.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'screens/just_for.dart';
import 'screens/charging_port_screen.dart';
import 'screens/payment_history_screen.dart';
import 'providers/booking_data_container.dart';
import 'providers/charging_port_type_data_container.dart';
import 'providers/user_data_container.dart';
import 'screens/after_slots_remaining_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => BookingDataContainer()),
        ChangeNotifierProvider(create: (ctx) => ChargingPortDataContainer()),
        ChangeNotifierProvider(create: (ctx) => UserDataContainer()),
      ],
      child: Consumer<UserDataContainer>(
        builder: (ctx, userData, _) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xff11131b),
            primaryColor: Color(0xff00ffba),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: const Color(0xff1f1f1f),
              tertiary: const Color(0xff11131b),
            ),
          ),
          // home: BottomNavigation(),
          home: LoginScreen(),
          routes: {
            AddStationScreen.routeName: (context) => AddStationScreen(),
            FormScreen.routeName: (context) => FormScreen(),
            BottomNavigation.routeName: (context) => BottomNavigation(),
            OtpScreen.routeName: (context) => OtpScreen(),
            QRCodeScreen.routeName: (context) => QRCodeScreen(),
            DashboardScreen.routeName: (context) => DashboardScreen(),
            JustFor.routeName: (context) => JustFor(),
            ChargingPortScreen.routeName: (context) => ChargingPortScreen(),
            SlotBookingScreen.routeName: (context) => SlotBookingScreen(),
            BookingUpcomingScreen.routeName: (context) =>
                BookingUpcomingScreen(),
            BookingHistoryScreen.routeName: (context) => BookingHistoryScreen(),
            PaymentHistoryScreen.routeName: (context) => PaymentHistoryScreen(),
            AfterSlotsRemaining.routeName: (context) => AfterSlotsRemaining(),
          },
        ),
      ),
    );
  }
}
