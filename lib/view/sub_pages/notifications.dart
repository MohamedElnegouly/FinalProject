import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../generated/l10n.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List common = [
    S().general,
    S().sound,
    S().vib
    ];
  List system = [
    S().update,
    S().reminder,
    S().promotion,
    S().discount,
    S().payment
    ];
  List others = [
    S().newservice,
    S().newtips,
  ];
  bool viewVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(S().Notification,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        body:
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text(S().common,
                style: Theme.of(context).textTheme.titleMedium,),
            ),
            ListView.builder(
                itemCount:
                common.length,
                shrinkWrap: true,
                physics: PageScrollPhysics(),
                itemBuilder: (context,index){
                  return SwitchItem(title:common[index]);
                }),

         Padding(
           padding:  EdgeInsets.only(right: 10.sp,left: 10.sp,top: 8.sp,bottom: 8.sp),
           child: Divider(height: 1,),
         ),

            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text(S().system,
                style: Theme.of(context).textTheme.titleMedium,),
            ),
            ListView.builder(
                itemCount:
                system.length,
                shrinkWrap: true,
                physics: PageScrollPhysics(),
                itemBuilder: (context,index){
                  return SwitchItem(title:system[index]);
                }),

            Padding(
              padding:  EdgeInsets.only(right: 10.sp,left: 10.sp,top: 8.sp,bottom: 8.sp),
              child: Divider(height: 1,),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10),
              child: Text(S().others,
                style: Theme.of(context).textTheme.titleMedium,),
            ),
            ListView.builder(
                itemCount:
                others.length,
                shrinkWrap: true,
                physics: PageScrollPhysics(),
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

