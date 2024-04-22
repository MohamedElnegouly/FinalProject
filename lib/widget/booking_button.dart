import 'package:flutter/material.dart';

import '../constants.dart';

class BookingButton extends StatefulWidget {
  const BookingButton({super.key});

  @override
  State<BookingButton> createState() => _BookingButtonState();
}

class _BookingButtonState extends State<BookingButton> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () async{
          final DateTime? dateTime = await showDatePicker(context: context,
              initialDate: selectedDate, firstDate: DateTime(2000), lastDate:DateTime (3000)
          );
          if(dateTime != null ) {
            setState(() {
              selectedDate = dateTime;
            });
          }
          // Text("${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}"),
        },
        icon: const Icon(Icons.calendar_month_outlined,color: Colors.white,),
        label: const Text(
          "Booking Now",
          style: TextStyle(color: Colors.white),

        )
    );
  }
}
