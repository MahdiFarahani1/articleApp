import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading {
  static Widget loadCircle(BuildContext context) {
    return SpinKitRipple(
      itemBuilder: (context, index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        );
      },
    );
  }

  static Widget loadLine(BuildContext context) {
    return SpinKitThreeInOut(
      size: 35,
      itemBuilder: (context, index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        );
      },
    );
  }

  static Widget fadingCircle(BuildContext context) {
    return SpinKitFadingCircle(
      size: 35,
      itemBuilder: (context, index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
