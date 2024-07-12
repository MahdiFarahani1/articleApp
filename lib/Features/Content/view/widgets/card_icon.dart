import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/gr.dart';

class CardIcon extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback onPress;
  final String? image;
  const CardIcon({super.key,  this.iconData, required this.onPress,this.image });

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
            child: image ==null ? Icon(iconData) : Image.asset(image!,width: 20,height: 20,),
          ),
        ),
      ),
    );
  }
}
