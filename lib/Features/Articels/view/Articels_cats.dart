import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/database/db_helper.dart';
import 'package:flutter_application_1/Core/widgets/CommonList.dart';
import 'package:flutter_application_1/Features/Articels/view/Articels/article_list1.dart';
import 'package:flutter_application_1/Features/Articels/view/utils/title_appbar_assistant.dart';
import 'package:get/get.dart';

class ArticleCatsPage extends StatelessWidget {
  final DBhelper dbhelper = DBhelper();

  ArticleCatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            body: CommonList(
          future: dbhelper.getCat(),
          onPress: (id, title, content) {
            AppbarHelper.title = title!;
            Get.to(ArticleList1(id: id), transition: Transition.fade);
          },
        )),
      ),
    );
  }
}
