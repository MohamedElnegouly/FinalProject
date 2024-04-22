import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/constants.dart';
import 'package:graduationproject/view/forget_password/view/view.dart';
import 'package:graduationproject/view/home/manager/home_cubit.dart';
import 'package:graduationproject/view/login/login_cubit.dart';
import 'package:graduationproject/view/login/view.dart';
import 'package:graduationproject/view/nav_bar/view.dart';
import 'package:graduationproject/view/register/register_cubit.dart';
import 'package:graduationproject/view/register/view.dart';
import 'package:graduationproject/view/search/search_screen.dart';
import 'package:graduationproject/view/profile/profile_screen.dart';
import 'package:graduationproject/view/welcome_screen.dart';
import 'package:graduationproject/view/workspac_details/view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  PreferenceUtils.getString(PreferenceKey.token);
  print('token is : ${token}');
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(create: (context) => HomeCubit()..getWorkspaces()),
        ],
        child: BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
          return ResponsiveSizer(builder: (context, orientation, screenType) {
            return MaterialApp(
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
                        titleTextStyle:
                            TextStyle(color: Colors.black87, fontSize: 20),
                        iconTheme: IconThemeData(color: Colors.black87)),
                    scaffoldBackgroundColor: Colors.white,
                    textTheme: TextTheme(
                        titleSmall: TextStyle(
                          color: Colors.black87.withOpacity(0.8),
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
                            fontWeight: FontWeight.bold)),
                    iconTheme: IconThemeData(color: mainColor)),
                home:
                // token == null
                //     ? SignInScreen()
                //     :
                WelcomeScreen()
            );
          });
        }));
  }
}
