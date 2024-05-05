import 'package:flutter/material.dart';
import 'package:graduationproject/widget/booking_button.dart';
import 'package:graduationproject/widget/show_time_picker.dart';

class BookingScreen extends StatefulWidget {
  static String id = 'booking view';

  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        BookingButton(),
        SizedBox(height: 20,),
        ShowTimePickerApp()
      ],),
    );
  }
}
