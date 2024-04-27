import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../core/shared_preferences.dart';
import '../generated/l10n.dart';

class showThemeBottomSheet extends StatefulWidget {
  const showThemeBottomSheet({super.key});

  @override
  State<showThemeBottomSheet> createState() => _showThemeBottomSheetState();
}

class _showThemeBottomSheetState extends State<showThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                  ? Colors.black38
                    : Colors.white
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(height: 20),
                     Text(S().SelectTheme,style: TextStyle(color: mainColor,fontWeight: FontWeight.bold),),
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
                        child:  Text(
                          S().Light,
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
                        child:  Text(
                          S().Dark,
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
        )
    );
  }
}
