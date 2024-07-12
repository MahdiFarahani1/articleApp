import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {
  final String image;

  const NavBarItem({super.key, required this.image});

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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
               
                image,
                    
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
            )),
      ),
    );
  }
}
