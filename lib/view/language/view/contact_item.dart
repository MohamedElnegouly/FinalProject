import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../core/shared_preferences.dart';

class ContactItem extends StatefulWidget {
  const ContactItem({super.key,
  required this.name,
    required this.isSelected,
    required this.index,
  });
  final String name;
  final bool isSelected;
  final int index;

  @override
  State<ContactItem> createState() => _ContactItemState();
}
class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child:
        ListTile(
        title: Text(
          widget.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: widget.isSelected
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
            for(int i = 0; i < languages.length; i++) {
              if (i == widget.index) {
                setState(() {
                  languages[i].isSelected = true;
                  PreferenceUtils.setString(
                      PreferenceKey.language,
                      languages[widget.index].name
                  );
                  Navigator.pop(context);
                });
              } else {
                setState(() {
                  languages[i].isSelected = false;
                });
              }
            }
          });
        },
      )
    );
  }
}
