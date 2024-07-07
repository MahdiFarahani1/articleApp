import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/gr.dart';

class CardIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPress;
  const CardIcon({super.key, required this.iconData, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(8, 10, 8, 10),
        elevation: 6,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: CustomGradient.gr(context),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(iconData),
          ),
        ),
      ),
    );
  }
}
