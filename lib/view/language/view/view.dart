
import 'package:flutter/material.dart';
import 'package:graduationproject/view/language/language_model.dart';

import '../../../constants.dart';
import '../../../core/shared_preferences.dart';
import 'contact_item.dart';

class SelectLanguageScreen extends StatefulWidget {
  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Select Language',style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ContactItem(
                        name: languages[index].name,
                        isSelected: languages[index].isSelected,
                        index: index,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}