import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/view/home.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        Get.offAll(const MyHomePage(), transition: Transition.fade);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
