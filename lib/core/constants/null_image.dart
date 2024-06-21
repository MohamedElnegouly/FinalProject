import 'package:flutter/material.dart';

class NullImage extends StatelessWidget {
  const NullImage({super.key,required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: size,
        ),
      ),
    );
  }
}
