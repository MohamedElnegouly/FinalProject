import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/shared/shared_preferences.dart';
import '../../../core/validator/validator.dart';
import '../../../widget/app_button.dart';
import '../../../widget/app_text.dart';
import '../../../widget/custom_text_field.dart';
import '../../../widget/square_tile.dart';
import '../../register/register_cubit.dart';
import '../models/CitiesModel.dart';
import '../models/country_state_model.dart' as cs_model;
import '../repositories/country_state_city_repo.dart';
import 'package:flutter/material.dart';

// class RegisterHomePage extends StatefulWidget {
//   const RegisterHomePage({super.key});
//
//   @override
//   State<RegisterHomePage> createState() => _RegisterHomePageState();
// }
//
// class _RegisterHomePageState extends State<RegisterHomePage> {
//   bool obscureText = false;
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final countryController = TextEditingController();
//   final cityController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   final CountryStateCityRepo _countryStateCityRepo = CountryStateCityRepo();
//
//   List<String> countries = [];
//   List<String> states = [];
//   List<String> cities = [];
//   cs_model.CountryStateModel countryStateModel =
//       cs_model.CountryStateModel(error: false, msg: '', data: []);
//
//   CitiesModel citiesModel = CitiesModel(error: false, msg: '', data: []);
//
//   String selectedCountry = 'Select Country';
//   String selectedState = 'Select State';
//   String selectedCity = 'Select City';
//   bool isDataLoaded = false;
//
//   String finalText = '';
//
//   getCountries() async {
//     //
//     countryStateModel = await _countryStateCityRepo.getCountriesStates();
//     countries.add('Select Country');
//     states.add('Select State');
//     cities.add('Select City');
//     for (var element in countryStateModel.data) {
//       countries.add(element.name);
//     }
//     isDataLoaded = true;
//     setState(() {});
//     //
//   }
//
//   getStates() async {
//     //
//     for (var element in countryStateModel.data) {
//       if (selectedCountry == element.name) {
//         //
//         setState(() {
//           resetStates();
//           resetCities();
//         });
//         //
//         for (var state in element.states) {
//           states.add(state.name);
//         }
//       }
//     }
//     //
//   }
//
//   getCities() async {
//     //
//     isDataLoaded = false;
//     citiesModel = await _countryStateCityRepo.getCities(
//         country: selectedCountry, state: selectedState);
//     setState(() {
//       resetCities();
//     });
//     for (var city in citiesModel.data) {
//       cities.add(city);
//     }
//     isDataLoaded = true;
//     setState(() {});
//     //
//   }
//
//   resetCities() {
//     cities = [];
//     cities.add('Select City');
//     selectedCity = 'Select City';
//     finalText = '';
//   }
//
//   resetStates() {
//     states = [];
//     states.add('Select State');
//     selectedState = 'Select State';
//     finalText = '';
//   }
//
//   @override
//   void initState() {
//     getCountries();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       BlocConsumer<RegisterCubit,RegisterState>(
//         listener: (context, state) {
//       if(state is RegisterSuccessState)
//       {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Account created"),
//               behavior: SnackBarBehavior.floating,
//             ));
//         //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
//       }
//       else if(state is RegisterFailedState)
//       {
//         showDialog(context: context, builder: (context)=>
//             AlertDialog(
//               content: Text(state.errorMessage,
//                 style: TextStyle(color: Colors.white),
//               ),
//               backgroundColor: Colors.red,
//             ));
//       }
//     },
//     builder: (context,state){
//     return
//     GestureDetector(
//     onTap: (){
//     FocusScope.of(context).unfocus();
//     },
//     child: Scaffold(
//     appBar: AppBar(
//     leading: IconButton(
//     onPressed: ()
//     {
//     Navigator.pop(context);
//     },
//     icon: const Icon(
//     Icons.keyboard_arrow_left,
//     ),
//     ),
//     toolbarHeight: 30,
//     ),
//     backgroundColor: Colors.white,
//     body:  Form(
//     key: formKey,
//     child:Padding(
//     padding:  EdgeInsets.all(15.sp),
//     child: ListView(
//     children: [
//     Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//     Text(
//     'Welcome! Glad to\n see you!',
//     style: TextStyle(
//     color: Colors.black,
//     fontWeight: FontWeight.bold,
//     fontSize: 25.sp,
//     ),
//     ),
//     ],
//     ),
//     SizedBox(height: 15.sp),
//     SizedBox(
//     height: 42.sp,
//     child:
//     CustomInputField(
//     labelText: "UserName",
//     hintText: 'enter your name',
//     controller: nameController,
//     validator: (value){
//     return Validator.validateName(value);}
//     )
//     ),
//
//     SizedBox(height: 10.sp),
//
//     SizedBox(
//     height: 42.sp,
//     child: CustomInputField(
//     labelText: "email",
//     hintText: "Enter your Email",
//     controller: emailController,
//     validator: (value){
//     return Validator.validateEmail(value);}
//     ),
//     ),
//     SizedBox(height: 10.sp),
//
//     SizedBox(
//     height: 42.sp,
//     child:
//     CustomInputField(
//     labelText: "password",
//     hintText: 'password',
//     obscureText: true,
//     suffixIcon: true,
//     controller: passwordController,
//     validator: (value) {
//     return Validator.validatePassword(value);
//     }
//     )
//     ),
//     SizedBox(height: 10.sp),
//
//
//       !isDataLoaded
//           ? const CircularProgressIndicator()
//           : Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Column(
//                     children: [
//                       DropdownButton(
//                           isExpanded: true,
//                           value: selectedCountry,
//                           items: countries
//                               .map((String country) => DropdownMenuItem(
//                               value: country, child: Text(country)))
//                               .toList(),
//                           onChanged: (selectedValue) {
//                             //
//                             setState(() {
//                               selectedCountry = selectedValue!;
//                             });
//                             // In Video we have used getStates();
//                             // getStates();
//                             // But for improvement we can use one extra check
//                             if (selectedCountry != 'Select Country') {
//                               getStates();
//                             }
//                             //
//                           }),
//                       const SizedBox(height: 20),
//                       DropdownButton(
//                           isExpanded: true,
//                           value: selectedState,
//                           items: states
//                               .map((String state) => DropdownMenuItem(
//                               value: state, child: Text(state)))
//                               .toList(),
//                           onChanged: (selectedValue) {
//                             //
//                             setState(() {
//                               selectedState = selectedValue!;
//                             });
//                             if (selectedState != 'Select State') {
//                               getCities();
//                             }
//                             //
//                           }),
//                       const SizedBox(height: 20),
//                       DropdownButton(
//                           isExpanded: true,
//                           value: selectedCity,
//                           items: cities
//                               .map((String city) => DropdownMenuItem(
//                               value: city, child: Text(city)))
//                               .toList(),
//                           onChanged: (selectedValue) {
//                             //
//                             setState(() {
//                               selectedCity = selectedValue!;
//                             });
//                             if (selectedCity != 'Select City') {
//                               finalText =
//                               "Country: $selectedCountry\nState: $selectedState\nCity: $selectedCity";
//                             }
//                             //
//                           }),
//                       Text(
//                         finalText,
//                         style: const TextStyle(fontSize: 22),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(25),
//                         margin: const EdgeInsets.symmetric(horizontal: 25),
//                         decoration:  BoxDecoration(
//                           color: Colors.cyanAccent[700],
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "complete",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//       ),
//
//       SizedBox(height: 20.sp),
//       AppButton(title:
//       state is RegisterLoadingState
//           ? "loading..."
//           : "Agree and Register",
//         onTap: (){
//           if(formKey.currentState!.validate())
//           {
//             saveUserData();
//             BlocProvider.of<RegisterCubit>(context).register(
//                 name: nameController.text,
//                 email: emailController.text,
//                 password: passwordController.text,
//                 country: countryController.text,
//                 city: cityController.text
//             ).then((value) => Navigator.pop(context));
//           }
//         },
//       ),
//       SizedBox(height: 20.sp),
//       Align(
//         alignment: Alignment.center,
//         child: AppText(
//           text: 'Or login with social account',
//         ),
//       ),
//
//       SizedBox(height: 15.sp),
//
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SquareTile(imagePath: AppAssets.faceBookAsset),
//           SquareTile(imagePath: AppAssets.googleAsset),
//           SquareTile(imagePath: AppAssets.appleAsset),
//         ],
//       ),
//
//     ],
//     ),
//     ),
//     ),
//     ),
//     );
//     },
//       );
//   }
//
//   void saveUserData() {
//     PreferenceUtils.setString(
//         PreferenceKey.name,
//         nameController.text
//     );
//     PreferenceUtils.setString(
//         PreferenceKey.email,
//         emailController.text
//     );
//
//   }
// }
//
