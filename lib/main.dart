import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduationproject/constants/constants.dart';
import 'package:graduationproject/constants/themes.dart';
import 'package:graduationproject/core/app_manager/app_cubit.dart';
import 'package:graduationproject/view/workspace/work_screen.dart';
import 'package:graduationproject/view/workspac_details/details_view/details_cubit.dart';
import 'package:graduationproject/view/home/manager/home_cubit.dart';
import 'package:graduationproject/view/login/login_cubit.dart';
import 'package:graduationproject/view/nav_bar/view.dart';
import 'package:graduationproject/view/register/register_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/shared_preferences.dart';
import 'generated/l10n.dart';

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
          BlocProvider(
              create: (context) =>DetailsCubit(),
          ),
          BlocProvider(create: (context) => AppCubit()),
          //BlocProvider(create: (context) => HomeCubit()..getWorkspaces()),
          BlocProvider(create: (context) => DetailsCubit()..getWorkspacesDetail(id: '661fb22e7ce19a0ee9a1d78c')),
        ],
        child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
          return ResponsiveSizer(builder: (context, orientation, screenType) {
            return MaterialApp(
              locale: Locale(PreferenceUtils.getString(PreferenceKey.language)),
              supportedLocales :S.delegate.supportedLocales,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
              themeMode: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? ThemeMode.dark
                  : ThemeMode.light,
                home:
                // token == null
                //     ? SignInScreen()
                //     :
                NavBarView(),
            );
          });
        }));
  }
}
