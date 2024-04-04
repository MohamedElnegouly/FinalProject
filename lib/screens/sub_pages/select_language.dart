

import 'package:flutter/material.dart';
import 'package:graduationproject/models/language_model.dart';

class SelectLanguageScreen extends StatefulWidget {
  @override
  _SelectLanguageScreenState createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  List<LanguageModel> languages = [
    LanguageModel("English(US)",  false),
    LanguageModel("Arabic", false),
    LanguageModel("Mandarin",  false),
    LanguageModel("स्वागतम्",  false),
    LanguageModel("Spanish", false),
    LanguageModel("French",  false),
    LanguageModel("Russian", false),
    LanguageModel("Indonesia", false),
    LanguageModel("Turkey", false),
    LanguageModel("Deutsch", false),
  ];

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
                      // return item
                      return ContactItem(
                        languages[index].name,

                        languages[index].isSelected,
                        index,
                      );
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(
      String name,  bool isSelected, int index) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),

      trailing: isSelected
          ? Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.blue[900],
          ), // active or not
          CircleAvatar(
            radius: 6,
            backgroundColor: Colors.white,
          ), // active circle space
        ],
      )
          : Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.blue[400],
          ), // active or not
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.blue[200],
          ), // active circle space
        ],
      ),
      onTap: () {
        setState(() {
          languages[index].isSelected = !languages[index].isSelected;

        });
      },
    );
  }
}