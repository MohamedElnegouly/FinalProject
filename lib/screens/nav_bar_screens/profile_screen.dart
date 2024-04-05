import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:graduationproject/screens/sub_pages/edit_screen.dart';
import 'package:graduationproject/screens/sub_pages/notifications.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app_core/app_cubit.dart';
import '../../models/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {

  final usernameController = TextEditingController();
  final nameController = TextEditingController();

  String imageUrl = '';
  bool uploading = false;

  File ? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.notifications_none,
            size: 30,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.alarm, size: 25,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert, size: 25,),
            ),
          ],
        ),

        body:
        Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child:
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    GestureDetector(
                      onTap: () => pickImage(),
                      child: CircleAvatar(
                        radius: 40,
                        child:
                        _selectedImage != null
                            ? ClipOval(
                          child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.file(
                                _selectedImage!, fit: BoxFit.cover,)
                          ),
                        )
                            : CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 45,
                          ),
                        ),
                      ),
                    ),

                    CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: Icon(Icons.edit_outlined,
                          size: 16,
                          color: Colors.black87,)
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.sp,),

              Text("Puerto Rico",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,),
              Text("Youremail@gmail.com | +01234565643",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,),

              SizedBox(height: 10,),

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
                   // value: PreferenceUtils.getString(PreferenceKey.notification, 'ON')
                  ),

                  ProfileItem(
                    onTap: () => goToSelectLanguageScreen(),
                    icon: Icons.language,
                    title: "Language",
                    // value: PreferenceUtils.getString(PreferenceKey.language,'en')
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
                    onTap: () => selectTheme(),
                    icon: Icons.color_lens_outlined,
                    title: "Theme",
                    //value: PreferenceUtils.getString(PreferenceKey.theme, 'Light mode')
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

            ]),
      );
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final returnedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Widget ProfileItem({
    required GestureTapCallback onTap,
    required IconData icon,
    required String title,
    String value = '',
  }) {
    //print('Theme => ${Theme.of(context).brightness}');
    return InkWell(
        onTap: onTap,
        child:
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: [
              Icon(
                icon,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
              const Spacer(),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: mainColor
                ),
              ),
            ],
          ),
        )
    );
  }

  goToNotificationScreen() {
    Navigator.push(context,
      MaterialPageRoute(
          builder: (context) =>
              NotificationScreen()),
    ).then((value) {
      BlocProvider.of<AppCubit>(context).notificationChanged();
    });
  }

  goToSelectLanguageScreen() {

  }


  selectTheme() {

  }



}