import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graduationproject/book_screen.dart';
import 'package:graduationproject/constants/constants.dart';
import 'package:graduationproject/constants/themes.dart';
import 'package:graduationproject/core/app_manager/app_cubit.dart';
import 'package:graduationproject/view/get_reservations/manager/reservation_cubit.dart';
import 'package:graduationproject/view/get_reservations/view/reservation_view.dart';
import 'package:graduationproject/widget/show_time_picker.dart';
//import 'package:graduationproject/book_screen.dart';
import 'package:graduationproject/constants/constants.dart';
import 'package:graduationproject/constants/themes.dart';
import 'package:graduationproject/core/app_manager/app_cubit.dart';
// import 'package:graduationproject/view/get_reservations/manager/reservation_cubit.dart';
// import 'package:graduationproject/view/get_reservations/view/reservation_view.dart';
// import 'package:graduationproject/widget/show_time_picker.dart';
import 'package:graduationproject/view/favorite/favorite_view.dart';
import 'package:graduationproject/view/profile/view/profile_screen.dart';
import 'package:graduationproject/view/search/search_view.dart';
import 'package:graduationproject/view/welcome_screen/welcome_view.dart';
import 'package:graduationproject/view/workspac_details/view/details_view.dart';
import 'package:graduationproject/view/search/search_cubit.dart';
import 'package:graduationproject/view/workspace/manager/workspace_cubit.dart';
import 'package:graduationproject/view/workspace/view/workspace_screen.dart';
import 'package:graduationproject/view/home/manager/home_cubit.dart';
import 'package:graduationproject/view/login/login_cubit.dart';
import 'package:graduationproject/view/nav_bar/view.dart';
import 'package:graduationproject/view/register/register_cubit.dart';
<<<<<<< HEAD
import 'package:graduationproject/view/register/view.dart';
import 'package:graduationproject/view/search/cubit/search_cubit.dart';
import 'package:graduationproject/view/search/repos/search_repo_implement.dart';
import 'package:graduationproject/view/search/search_screen.dart';
import 'package:graduationproject/view/profile/profile_screen.dart';
import 'package:graduationproject/view/welcome_screen.dart';
import 'package:graduationproject/view/workspace/manager/workspace_cubit.dart';
=======
>>>>>>> 9ccc7b2672632b396963307426f363ce873b9867
import 'package:responsive_sizer/responsive_sizer.dart';
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
  MyApp({super.key});
  SearchRepoImplement search = SearchRepoImplement();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
<<<<<<< HEAD
          BlocProvider(create: (context) => LoginCubit(),),
          BlocProvider(create: (context) => RegisterCubit(),),
=======
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(search)..getWorkspaces(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
<<<<<<< HEAD
          BlocProvider(
            create: (context) => WorkspaceDetailsCubit(),
          ),
          BlocProvider(create: (context) => HomeCubit()..getWorkspaces()),
        ],
        child: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
=======
>>>>>>> 72e2be945975d366cdcc11922d13fdd309e92bcd
          BlocProvider(create: (context) => AppCubit()),
          //BlocProvider(create: (context) => LayoutCubit()..getProducts()),
          BlocProvider(create: (context) => GetReservationCubit()..getReservations()),
          BlocProvider(create: (context) => WorkspaceCubit()..getWorkspacess(),),
          BlocProvider(create: (context) => RegisterCubit(),),
          BlocProvider(create: (context) => AppCubit()),
          BlocProvider(create: (context) => SearchCubit()..getProducts()),
         // BlocProvider(create: (context) => GetReservationCubit()..getReservations()),
        ],
        child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
>>>>>>> 9ccc7b2672632b396963307426f363ce873b9867
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
<<<<<<< HEAD
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
=======
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
<<<<<<< HEAD
                theme: ThemeData(
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
                    SearchScreen());
=======
                theme: lightTheme,
                darkTheme: darkTheme,
>>>>>>> 72e2be945975d366cdcc11922d13fdd309e92bcd
              themeMode: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? ThemeMode.dark
                  : ThemeMode.light,
              routes: {
                NavBarView.id: (context) => const NavBarView(),
                SearchView.id: (context) =>  SearchView(),
                FavoriteScreen.id:(context) => const FavoriteScreen(),
                Details.id:(context) => const Details(),
                ReservationView.id:(context) => const ReservationView(),
                ProfileScreen.id:(context) => const ProfileScreen(),
                BookingScreen.id:(context) => const BookingScreen(),
              },
             // home:
              //ShowTimePickerApp(),
              //NavBarView(),
                //ReservationView.id:(context) => const ReservationView(),
               // ProfileScreen.id:(context) => const ProfileScreen(),
              //  BookingScreen.id:(context) => const BookingScreen(),

              initialRoute: NavBarView.id,
              //  home:
              //  NavBarView(),
            );
>>>>>>> 9ccc7b2672632b396963307426f363ce873b9867
          });
        }));
  }
}
