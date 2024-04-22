import 'package:flutter/material.dart';
import 'package:graduationproject/widget/profile_item.dart';
import 'package:graduationproject/widget/show_model_bottom_sheet.dart';

import '../core/shared_preferences.dart';
import '../view/language/view/view.dart';
import '../view/sub_pages/edit_screen.dart';
import '../view/sub_pages/notifications.dart';

class BodyOfContainer extends StatefulWidget {
  const BodyOfContainer({super.key,});
  @override
  State<BodyOfContainer> createState() => _BodyOfContainerState();
}

class _BodyOfContainerState extends State<BodyOfContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30, top: 20, right: 30),
            // height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
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
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=> EditScreen()));
                  },
                  icon: Icons.edit_note_outlined,
                  title: "Edit Profile Information"
              ),

              ProfileItem(
                  onTap: () => goToNotificationScreen(),
                  icon: Icons.notifications_on_outlined,
                  title: "Notification",
                  value: PreferenceUtils.getString(PreferenceKey.notification, 'ON')
              ),

              ProfileItem(
                  onTap: () => goToSelectLanguageScreen(),
                  icon: Icons.language,
                  title: "Language",
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
              color: Colors.white,
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
                  title: "Security"
              ),

              ProfileItem(
                  onTap: () => showChangeThemeBottomSheet(),
                  icon: Icons.color_lens_outlined,
                  title: "Theme",
                  value:  PreferenceUtils.getBool(PreferenceKey.darkTheme)
                      ? "Dark"
                      : "Light"),
              SizedBox(height: 10,),
            ],),
          ),
      Container(
        margin: EdgeInsets.only(left: 30, top: 20, right: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
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
              title: "Help & Support"
          ),

          ProfileItem(
            onTap: () {},
            icon: Icons.contact_mail_sharp,
            title: "Contact Us",
          ),

          ProfileItem(
            onTap: () {},
            icon: Icons.lock_outline,
            title: "Privacy Policy",
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

  goToSelectLanguageScreen() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context)=> SelectLanguageScreen())).then((value) => setState(() {}));
  }

  showChangeThemeBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return
            showThemeBottomSheet();
        }).then((value) => setState(() {}));
  }
}
