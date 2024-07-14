import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

class Gallery extends StatelessWidget {
  final List<String> images = [
    Assets.images.splash.path,
    Assets.images.splash.path,
    Assets.images.splash.path,
    Assets.images.splash.path,
    Assets.images.splash.path,
    Assets.images.splash.path,
  ];
  Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                width: EsaySize.width(context),
                height: EsaySize.height(context) / 2,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    image: DecorationImage(
                        image: AssetImage(
                          images[index],
                        ),
                        fit: BoxFit.cover)),
              );
            },
          ),
        ),
      ),
    );
  }
}
