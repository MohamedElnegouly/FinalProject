import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/constants/colors.dart';
import 'package:graduationproject/core/shared_preferences.dart';
import 'package:graduationproject/widget/profile_container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/app_manager/app_cubit.dart';
import '../../core/intl/generated/l10n.dart';

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
                        backgroundColor: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                            ? Colors.grey
                            : Colors.grey[300],
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
                          backgroundColor: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                              ? Colors.grey
                              : Colors.grey[300],
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 45,
                            color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                             ? Colors.black54
                             : mainColor,
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
                        backgroundColor: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                        ? Colors.grey
                        : Colors.grey.withOpacity(0.5),
                        child: Icon(Icons.edit_outlined,
                          size: 16,
                          color: Colors.black87
                          ,)
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.sp,),

              Text(S().yourname,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,),
              Text("Youremail@gmail.com | +01234565643",
                style:TextStyle(color:PreferenceUtils.getBool(PreferenceKey.darkTheme)
                    ? Colors.white
                    : Colors.black,),
              ),
              SizedBox(height: 10,),
              BodyOfContainer(),
            ]),
      );
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final returnedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

}