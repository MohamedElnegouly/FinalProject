import 'package:flutter/material.dart';

import '../constants.dart';
import '../core/shared_preferences.dart';

class showThemeBottomSheet extends StatelessWidget {
  const showThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Text('Select Theme',style: TextStyle(color: mainColor,fontWeight: FontWeight.bold),),
                    InkWell(
                      onTap: () async {
                        await PreferenceUtils.setBool(
                          PreferenceKey.darkTheme,
                          false,
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        // color: Colors.grey[200],
                        child: const Text(
                          'Light',
                          style: TextStyle(
                              fontSize: 22,
                              color: mainColor
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        await PreferenceUtils.setBool(
                          PreferenceKey.darkTheme,
                          true,
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        // color: Colors.grey[200],
                        child: const Text(
                          'Dark',
                          style: TextStyle(
                              fontSize: 22,
                              color: mainColor
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        ),
    );
  }
}
