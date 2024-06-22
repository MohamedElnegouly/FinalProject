import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/shared/shared_preferences.dart';
import 'package:graduationproject/view/profile/view/profile_container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/constants/colors.dart';
import '../../../generated/l10n.dart';
import '../../reservations/get_reservation/view/reservation_view.dart';
import '../../sub_pages/edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  static String id = 'profile view';

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
        backgroundColor: PreferenceUtils.getBool(PreferenceKey.darkTheme)
            ? Colors.black87
            : Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: (){},
            child: Icon(Icons.notifications_none,
              size: 30,
            ),
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
        Container(
          color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
              ? Colors.black87
              : Colors.white,
          child: Column(
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
                                  _selectedImage!,
                                  fit: BoxFit.cover,)
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
                          child: IconButton(
                            color: Colors.black87,
                            onPressed: () { Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=> EditScreen()));
                              },
                            icon: Icon(Icons.edit_outlined,
                            size: 17,
                            )
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
        ),
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