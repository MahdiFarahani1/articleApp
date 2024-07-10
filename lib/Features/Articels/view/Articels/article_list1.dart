import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/database/db_helper.dart';
import 'package:flutter_application_1/Core/widgets/CommonList.dart';
import 'package:flutter_application_1/Features/Articels/view/utils/title_appbar_assistant.dart';
import 'package:flutter_application_1/Features/Content/view/content.dart';
import 'package:get/get.dart';

class ArticleList1 extends StatelessWidget {
  final int id;

  final DBhelper dBhelper = DBhelper();
  ArticleList1({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              AppbarHelper.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          )
        ],
        elevation: 8,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CommonList(
          future: dBhelper.getArticle(id),
          onPress: (id, title, content) {
            Get.to(
                Content(
                  content: content!,
                  title: title!,
                  id: id,
                ),
                transition: Transition.fade);
          },
        ),
      ),
    );
  }
}
