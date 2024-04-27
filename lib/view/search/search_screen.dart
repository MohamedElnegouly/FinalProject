import 'package:graduationproject/core/shared_preferences.dart';

import '../../generated/l10n.dart';
import '../../widget/search_category.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),

              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  iconColor: Colors.grey.shade50,
                  hintText: S().Wherework,
                  hintStyle: TextStyle(color: Colors.black87),
                  border: InputBorder.none,
                  helperStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
             Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                   Text(S().Bookingfor,style: TextStyle(
                    color:PreferenceUtils.getBool(PreferenceKey.darkTheme)
                        ? Colors.white
                        : Colors.black,
                  ),),
                   Text(' 26 june',style: TextStyle(
                    color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                        ? Colors.white
                        : Colors.black,
                  ),),
                  
                  const SizedBox(
                    width: 125,
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.filter_list,
                      color: Colors.black,)),
                   Text(S().filters,
                    style: TextStyle(
                      color: PreferenceUtils.getBool(PreferenceKey.darkTheme)
                          ? Colors.white
                          : Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
                // crossAxisAlignment: CrossAxisAlignment.end,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ( context,index ){
                    return SearchCategory();
                  }),
            ),
        ],
      ),

    );
  }
}
