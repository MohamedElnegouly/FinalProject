import 'package:flutter/material.dart';
import 'package:graduationproject/colors/colors.dart';
import 'package:graduationproject/screens/register_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account ? ',
          style: TextStyle(
              fontSize: 13,
              color: Color(0xff939393),
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              ),
            )
          },
          child: const Text(
            'Register Now',
            style: TextStyle(
                fontSize: 15,
                color: mainColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
