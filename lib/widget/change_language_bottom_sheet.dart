import 'package:flutter/material.dart';
import '../core/shared_preferences.dart';
import '../generated/l10n.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  State<ChangeLanguageBottomSheet> createState() => _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight:Radius.circular(35) ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children:[
                    const SizedBox(height: 20),
                    Text(
                      S().selectLanguage
                      ,style: Theme.of(context).textTheme.titleSmall,),
                    InkWell(
                      onTap: () async {
                        await PreferenceUtils.setString(
                          PreferenceKey.language,
                          'en',
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child:  Text(
                          S().en,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () async {
                        await PreferenceUtils.setString(
                          PreferenceKey.language,
                          "ar",
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        // color: Colors.grey[200],
                        child:  Text(
                          S().ar,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      // color: Colors.grey[200],
                      child:  Text(
                        "स्वागतम्।",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
            );
}
}
