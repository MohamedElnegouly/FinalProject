import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:graduationproject/main_page.dart';
import 'package:graduationproject/screens/authentication/login_screen.dart';
import 'package:graduationproject/screens/nav_bar_screens/profile_screen.dart';
import 'package:graduationproject/screens/sub_pages/edit_screen.dart';
import 'package:graduationproject/screens/sub_pages/notifications.dart';
import 'package:graduationproject/screens/sub_pages/select_language.dart';
import 'package:graduationproject/screens/welcome_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/auth_cubit.dart';

void main() {
 runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
        ],
        child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
      return
      ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return
            MaterialApp(
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
              theme:
              ThemeData(
                  brightness: Brightness.light,
                  useMaterial3: true,
                  appBarTheme: AppBarTheme(
                      color: Colors.white,
                      titleTextStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 20
                      ),
                      iconTheme: IconThemeData(color: Colors.black87)
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  textTheme: TextTheme(
                      titleSmall: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                      titleMedium: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      titleLarge: TextStyle(
                          color: Colors.black87,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  iconTheme: IconThemeData(color: Colors.black87)

              ),
                home: SelectLanguageScreen()
            );
        }
    );
        })
    );
  }
}

