import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/shared/shared_preferences.dart';
import '../../data/reservation_model.dart';
import '../../manager/reservation_cubit.dart';

class ReservationView extends StatefulWidget {
  static String id = 'Reservation view';

  const ReservationView({super.key});

  @override
  State<ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ReservationCubit>(context);
    return BlocConsumer<ReservationCubit,ReservationState>(
        listener: (context,state){},
        builder:(context,state){
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text("reservation view"),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                child: ListView(
                  shrinkWrap: true,
                  children:
                  [
                    const SizedBox(height: 15,),
                    //cubit.reservationList.isEmpty ?
                    cubit.reservList.isEmpty ?
                    const Center(child: CupertinoActivityIndicator(),) :
                    ListView.builder(
                        itemCount:
                      //  cubit.reservationList.length,
                        cubit.reservList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index)
                        {
                          return _reservationItem(
                              model: cubit.reservList[index],
                              cubit: cubit
                          );
                        }
                    )
                  ],
                ),
              )
          );
        }
    );
  }
}

Widget _reservationItem({required ReservationModel model,required ReservationCubit cubit}){
  return Padding(
    padding: EdgeInsets.all(2.sp),
    child: Container(
      decoration: BoxDecoration(
          color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
              ? Colors.black38
              : Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            Stack(
                alignment: Alignment.topRight,
                children:[
                  SizedBox(
                    width: double.infinity,
                    height: 170,
                    child:
                    model.cover == null
                        ? Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 40.sp,
                        ),
                      ),
                    )
                        :
                    CachedNetworkImage(
                      imageUrl: model.cover!,
                      fit: BoxFit.cover,
                    ),
                  ),

                ]
            ),

          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
               model.name!,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Icon(Icons.location_on),
                Text(
                  model.address!.length > 15
                      ? model.address!.substring(0, 20) + '...'
                      :model.address!,
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 15),
            child:
            Text(model.date!,
              style: TextStyle(
                  color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                      ? Colors.white
                      : Colors.black54,
                  fontWeight: FontWeight.w900, fontSize: 15),),

          ),

          Padding(
            padding: EdgeInsets.only(left: 15,bottom: 15),
            child:
                Text(model.status!,
                  style: TextStyle(
                    color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                        ? Colors.white
                        : Colors.black54,
                    fontWeight: FontWeight.w900, fontSize: 15),),

          ),
        ],
      ),
    ),
  );
}
