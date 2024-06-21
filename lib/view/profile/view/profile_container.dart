import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/widget/change_language_bottom_sheet.dart';
import 'package:graduationproject/widget/profile_item.dart';
import 'package:graduationproject/widget/change_theme_bottom_sheet.dart';
import '../../../core/app_manager/app_cubit.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../generated/l10n.dart';
import '../../reservations/get_reservation/view/reservation_view.dart';
import '../../sub_pages/notifications.dart';

class BodyOfContainer extends StatefulWidget {
  const BodyOfContainer({super.key,});
  @override
  State<BodyOfContainer> createState() => _BodyOfContainerState();
}

class _BodyOfContainerState extends State<BodyOfContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
    color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
        ? Colors.black87
        : Colors.white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30, top: 20, right: 30),
            // height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? Colors.black38
                  : Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:
            Column(children: [
              ProfileItem(
                  onTap: () {
                    Navigator.pushNamed(context, ReservationView.id
                    );
                  },
                  icon: Icons.calendar_month_outlined,
                  title: "Reservations"
              ),

              ProfileItem(
                  onTap: () => goToNotificationScreen(),
                  icon: Icons.notifications_on_outlined,
                  title: S().Notification,
                  value: PreferenceUtils.getString(PreferenceKey.notification, S().on)
              ),

              ProfileItem(
                  onTap: () => showLanguageBottomSheet(),
                  icon: Icons.language,
                  title: S().Language,
                  value: PreferenceUtils.getString(PreferenceKey.language)
              ),
              SizedBox(height: 10,),
            ],),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 20, right: 30),
            // height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color:  PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? Colors.black38
                  : Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:
            Column(children: [
              ProfileItem(
                  onTap: () {},
                  icon: Icons.security,
                  title: S().Security
              ),

              ProfileItem(
                  onTap: () {
                    print('tappped');
                    showChangeThemeBottomSheet();
                    },
                  icon: Icons.color_lens_outlined,
                  title: S().Theme,
                  value:  PreferenceUtils.getBool(PreferenceKey.darkTheme)
                      ? S().Dark
                      : S().Light),
              SizedBox(height: 10,),
            ],),
          ),
      Container(
        margin: EdgeInsets.only(left: 30, top: 20, right: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
              ? Colors.black38
              : Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:
        Column(children: [
          ProfileItem(
              onTap: () {},
              icon: Icons.person_pin,
              title: S().help
          ),

          ProfileItem(
            onTap: () {},
            icon: Icons.contact_mail_sharp,
            title: S().contact,
          ),

          ProfileItem(
            onTap: () {},
            icon: Icons.lock_outline,
            title: S().privacy,
          ),
          SizedBox(height: 10,),
        ],),
      ),
        ],
      ),
    );
  }

  goToNotificationScreen() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => NotificationScreen())); }

  showLanguageBottomSheet(){
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return
            ChangeLanguageBottomSheet();
        }).then((value) {
      BlocProvider.of<AppCubit>(context).languageChanged();
    });
  }
  showChangeThemeBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return
            showThemeBottomSheet();
        }).then((value) {
      BlocProvider.of<AppCubit>(context).themeChanged();
    });

  }
}
