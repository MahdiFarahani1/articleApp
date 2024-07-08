import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/database/db_helper.dart';
import 'package:flutter_application_1/Core/utils/loading.dart';
import 'package:flutter_application_1/Core/widgets/CommonItem.dart';
import 'package:flutter_application_1/Features/Content/view/content.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final DBhelper dBhelper = DBhelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: dBhelper.getAllsaveStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CustomLoading.fadingCircle(context));
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: AnimatedTextKit(
                isRepeatingAnimation: true,
                repeatForever: true,
                pause: const Duration(milliseconds: 1500),
                animatedTexts: [
                  TypewriterAnimatedText('لم يتم العثور على نتيجة',
                      textStyle: const TextStyle(fontSize: 15)),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> item = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Get.to(
                        Content(
                            content: item["_text"],
                            title: item["title"],
                            id: item["id"]),
                        transition: Transition.fade);
                  },
                  child: CommonItem(
                    title: item["title"],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
