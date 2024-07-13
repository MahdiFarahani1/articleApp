import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/database/db_helper.dart';
import 'package:flutter_application_1/Features/Content/view/widgets/card_icon.dart';
import 'package:flutter_application_1/Features/Home/getx/pageview_controller.getx.dart';
import 'package:flutter_application_1/Features/Home/view/home.dart';
import 'package:flutter_application_1/Features/Settings/getx/setting_controller.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Content extends StatefulWidget {
  final String content;
  final String title;
  final int id;
  const Content(
      {super.key,
      required this.content,
      required this.title,
      required this.id});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final settingController = Get.put(SettingController());

  final pageViewControllerGetx = Get.put(PageViewControllerGetx());

  final GetStorage box = GetStorage();

  bool isSave = false;
  @override
  void initState() {
    isSave = box.read(widget.title) ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              widget.title.length < 40
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
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
                      image: Assets.images.houseChimney.path,
                      onPress: () {
                        Get.offAll(const MyHomePage(),
                            transition: Transition.fade);
                      },
                    ),
                    CardIcon(
                      image: Assets.images.yellowList.path,
                      onPress: () {
                        Get.back();
                      },
                    ),
                    StatefulBuilder(builder: (context, setStateSave) {
                      return CardIcon(
                        image: !isSave
                            ? Assets.images.starEmpty.path
                            : Assets.images.starFull.path,
                        onPress: () {
                          DBhelper dBhelper = DBhelper();
                          isSave = !isSave;
                          box.write(widget.title, isSave);
                          if (isSave) {
                            dBhelper.insertArticle(
                                id: widget.id,
                                title: widget.title,
                                text: widget.content);
                          } else {
                            dBhelper.deleteArticle(
                              id: widget.id,
                            );
                          }

                          setStateSave(
                            () {},
                          );
                        },
                      );
                    }),
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
                    widget.title.length > 40
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Obx(() => Text(
                            widget.content,
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
