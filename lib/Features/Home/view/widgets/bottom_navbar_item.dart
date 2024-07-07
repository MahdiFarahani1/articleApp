import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final IconData iconData;

  const NavBarItem({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 47,
        height: 47,
        child: Card(
            margin: const EdgeInsets.all(0),
            elevation: 6,
            color: Theme.of(context).primaryColor,
            shape: const CircleBorder(),
            child: Icon(
              iconData,
              size: 30,
              color: Theme.of(context).colorScheme.surfaceVariant,
            )),
      ),
    );
  }
}
