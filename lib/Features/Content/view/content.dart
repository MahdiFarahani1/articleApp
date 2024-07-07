import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Content/view/widgets/card_icon.dart';
import 'package:flutter_application_1/Features/Home/getx/pageview_controller.getx.dart';
import 'package:flutter_application_1/Features/Home/view/home.dart';
import 'package:flutter_application_1/Features/Settings/getx/setting_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Content extends StatelessWidget {
  final String content;
  final String title;
  Content({super.key, required this.content, required this.title});

  final settingController = Get.put(SettingController());
  final pageViewControllerGetx = Get.put(PageViewControllerGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              title.length < 40
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  : const SizedBox()
            ],
            elevation: 8,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            expandedHeight: 180.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(
                  right: 8,
                  bottom: 30,
                  left: 8,
                ),
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardIcon(
                      iconData: Icons.home,
                      onPress: () {
                        Get.offAll(const MyHomePage(),
                            transition: Transition.fade);
                      },
                    ),
                    CardIcon(
                      iconData: Icons.list,
                      onPress: () {
                        Get.back();
                      },
                    ),
                    CardIcon(
                      iconData: Icons.star,
                      onPress: () {},
                    ),
                  ],
                )),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    title.length > 40
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Obx(() => Text(
                            content,
                            style: TextStyle(
                                fontSize: settingController.textFontSize.value,
                                color: Color(settingController.color.value),
                                fontFamily: GoogleFonts.getFont(
                                        settingController.textFontFamily.value)
                                    .fontFamily),
                            textAlign: TextAlign.justify,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
