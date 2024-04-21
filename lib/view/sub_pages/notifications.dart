import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../core/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List common = [
    'General Notification',
    'Sound',
    "Vibrate"
    ];
  List system = [
    'App Update',
    'Bill Reminder',
    "Promotion",
    "Discount Available",
    "Payment Request"
    ];
  List others = [
    'New Service Available',
    "New Tips Available"
  ];
  bool viewVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text("Notifications",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        body:
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text("Common",
                style: Theme.of(context).textTheme.titleMedium,),
            ),
            ListView.builder(
                itemCount:
                common.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return SwitchItem(title:common[index]);
                }),

         Padding(
           padding:  EdgeInsets.only(right: 10.sp,left: 10.sp,top: 8.sp,bottom: 8.sp),
           child: Divider(height: 1,),
         ),

            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text("System & Services Update",
                style: Theme.of(context).textTheme.titleMedium,),
            ),
            ListView.builder(
                itemCount:
                system.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return SwitchItem(title:system[index]);
                }),

            Padding(
              padding:  EdgeInsets.only(right: 10.sp,left: 10.sp,top: 8.sp,bottom: 8.sp),
              child: Divider(height: 1,),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text("Others",
                style: Theme.of(context).textTheme.titleMedium,),
            ),
            ListView.builder(
                itemCount:
                others.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return SwitchItem(title:others[index]);
                }),
          ],
        )
    );
  }
}

class SwitchItem extends StatefulWidget {
  final String title;
  const SwitchItem({super.key, required this.title});

  @override
  State<SwitchItem> createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  bool isSelected = false;
  void itemSwitch(bool value){
    setState(() {
      isSelected = !isSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      //subtitle: Text(isSelected ? "ON":"OFF"),
      trailing: Switch(value: isSelected,
        onChanged: itemSwitch,
        activeColor: Colors.white,
        activeTrackColor: Colors.blue,
      ),
    );
  }

}

