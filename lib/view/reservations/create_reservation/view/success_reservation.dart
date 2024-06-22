import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/widget/app_text.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/colors.dart';
import '../../manager/reservation_cubit.dart';

class SuccessReservation extends StatefulWidget {
  const SuccessReservation({super.key});

  @override
  State<SuccessReservation> createState() => _SuccessReservationState();
}

class _SuccessReservationState extends State<SuccessReservation> {
  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<ReservationCubit>(context);
    // return BlocConsumer<ReservationCubit,ReservationState>(
    // final cubit = BlocProvider.of<ReservationCubit>(context);
    // return BlocConsumer<ReservationCubit,ReservationState>(
    //     listener: (context,state){},
    // builder:(context,state) {
      return Scaffold(
        body: Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: "created successfully", fontSize: 25, color: mainColor,),
            Lottie.asset('assets/animations/success.json'),
          ],)
        ),
      );
    // } );


  }
}
