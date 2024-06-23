import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduationproject/core/app_manager/app_cubit.dart';
import 'package:graduationproject/view/favorite/manager/favorite_cubit.dart';
import 'package:graduationproject/view/login/view.dart';
import 'package:graduationproject/view/register/view.dart';
import 'package:graduationproject/view/reservations/manager/reservation_cubit.dart';
import 'package:graduationproject/view/search/view/search_view.dart';
import 'package:graduationproject/view/welcome_screen/welcome_view.dart';
import 'package:graduationproject/view/workspac_details/view/details_view.dart';
import 'package:graduationproject/view/search/manager/search_cubit.dart';
import 'package:graduationproject/view/workspac_details/view/workspace_available.dart';
import 'package:graduationproject/view/workspace/manager/workspace_cubit.dart';
import 'package:graduationproject/view/login/login_cubit.dart';
import 'package:graduationproject/view/nav_bar/view.dart';
import 'package:graduationproject/view/register/register_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/constants/constants.dart';
import 'core/constants/themes.dart';
import 'core/shared/shared_preferences.dart';
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
          BlocProvider(create: (context) => LoginCubit(),),
          BlocProvider(create: (context) => WorkspaceCubit()..getWorkspacess(),),
          BlocProvider(create: (context) => RegisterCubit(),),
          BlocProvider(create: (context) => AppCubit()),
          BlocProvider(create: (context) => SearchCubit()..getProducts()),
          BlocProvider(create: (context) => FavoriteCubit()..getFavorites()),
          BlocProvider(create: (context) => ReservationCubit()..getReservation()),
        ],
        child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
          return ResponsiveSizer(builder: (context, orientation, screenType) {
            return MaterialApp(
              locale: Locale(PreferenceUtils.getString(PreferenceKey.language,'en')),
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
              routes: {
                NavBarView.id: (context) => const NavBarView(),
                SearchView.id: (context) =>  SearchView(),
                WelcomeScreen.id:(context)=> WelcomeScreen(),
                Details.id:(context) => const Details(),
              },
            //  initialRoute: WelcomeScreen.id,
               home:
              // NavBarView()
               token == null ?
               LoginScreen()
                  : NavBarView()
            );
          });
        }));
  }
}

