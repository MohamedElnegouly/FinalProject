import '../models/CitiesModel.dart';
import '../models/country_state_model.dart' as cs_model;
import '../repositories/country_state_city_repo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CountryStateCityRepo _countryStateCityRepo = CountryStateCityRepo();

  List<String> countries = [];
  List<String> states = [];
  List<String> cities = [];
  cs_model.CountryStateModel countryStateModel =
      cs_model.CountryStateModel(error: false, msg: '', data: []);

  CitiesModel citiesModel = CitiesModel(error: false, msg: '', data: []);

  String selectedCountry = 'Select Country';
  String selectedState = 'Select State';
  String selectedCity = 'Select City';
  bool isDataLoaded = false;

  String finalText = '';

  getCountries() async {
    //
    countryStateModel = await _countryStateCityRepo.getCountriesStates();
    countries.add('Select Country');
    states.add('Select State');
    cities.add('Select City');
    for (var element in countryStateModel.data) {
      countries.add(element.name);
    }
    isDataLoaded = true;
    setState(() {});
    //
  }

  getStates() async {
    //
    for (var element in countryStateModel.data) {
      if (selectedCountry == element.name) {
        //
        setState(() {
          resetStates();
          resetCities();
        });
        //
        for (var state in element.states) {
          states.add(state.name);
        }
      }
    }
    //
  }

  getCities() async {
    //
    isDataLoaded = false;
    citiesModel = await _countryStateCityRepo.getCities(
        country: selectedCountry, state: selectedState);
    setState(() {
      resetCities();
    });
    for (var city in citiesModel.data) {
      cities.add(city);
    }
    isDataLoaded = true;
    setState(() {});
    //
  }

  resetCities() {
    cities = [];
    cities.add('Select City');
    selectedCity = 'Select City';
    finalText = '';
  }

  resetStates() {
    states = [];
    states.add('Select State');
    selectedState = 'Select State';
    finalText = '';
  }

  @override
  void initState() {
    getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: !isDataLoaded
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Select your Country\n State and City!',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],

                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        DropdownButton(
                            isExpanded: true,
                            value: selectedCountry,
                            items: countries
                                .map((String country) => DropdownMenuItem(
                                value: country, child: Text(country)))
                                .toList(),
                            onChanged: (selectedValue) {
                              //
                              setState(() {
                                selectedCountry = selectedValue!;
                              });
                              // In Video we have used getStates();
                              // getStates();
                              // But for improvement we can use one extra check
                              if (selectedCountry != 'Select Country') {
                                getStates();
                              }
                              //
                            }),
                        const SizedBox(height: 20),
                        DropdownButton(
                            isExpanded: true,
                            value: selectedState,
                            items: states
                                .map((String state) => DropdownMenuItem(
                                value: state, child: Text(state)))
                                .toList(),
                            onChanged: (selectedValue) {
                              //
                              setState(() {
                                selectedState = selectedValue!;
                              });
                              if (selectedState != 'Select State') {
                                getCities();
                              }
                              //
                            }),
                        const SizedBox(height: 20),
                        DropdownButton(
                            isExpanded: true,
                            value: selectedCity,
                            items: cities
                                .map((String city) => DropdownMenuItem(
                                value: city, child: Text(city)))
                                .toList(),
                            onChanged: (selectedValue) {
                              //
                              setState(() {
                                selectedCity = selectedValue!;
                              });
                              if (selectedCity != 'Select City') {
                                finalText =
                                "Country: $selectedCountry\nState: $selectedState\nCity: $selectedCity";
                              }
                              //
                            }),
                        Text(
                          finalText,
                          style: const TextStyle(fontSize: 22),
                        ),
                        Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration:  BoxDecoration(
                            color: Colors.cyanAccent[700],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "complete",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
        ),
      );
  }
}
