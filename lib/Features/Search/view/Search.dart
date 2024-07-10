import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/widgets/CommonItem.dart';
import 'package:flutter_application_1/Features/Content/view/widgets/card_icon.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/Features/Content/view/content.dart';
import 'package:flutter_application_1/Features/Search/getx/Search_controller.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  static const String rn = "/searchpage";

  final TextEditingController textEditingController = TextEditingController();
  var controllerSearch = Get.put(MySearchController(), permanent: true);

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  controller: textEditingController,
                  onSubmitted: (value) {
                    controllerSearch.searchText(textEditingController);
                  },
                  decoration: InputDecoration(
                    hintText: 'البحث...',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                    border: InputBorder.none,
                    suffixIcon: CardIcon(
                      iconData: Icons.search,
                      onPress: () {
                        controllerSearch.searchText(textEditingController);
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Card(
                    margin: const EdgeInsets.only(top: 8, left: 12, right: 16),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GetBuilder<MySearchController>(
                        builder: (_) {
                          return CheckboxListTile(
                            title: const Text("النص"),
                            value: controllerSearch.contentBool,
                            onChanged: (value) {
                              controllerSearch.changeContentBool(value!);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Card(
                    margin: const EdgeInsets.only(top: 8, left: 16, right: 12),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GetBuilder<MySearchController>(
                        builder: (_) {
                          return CheckboxListTile(
                            title: const Text("العنوان"),
                            value: controllerSearch.titleBool,
                            onChanged: (value) {
                              controllerSearch.changeTitleBool(value!);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "نتيجة البحث  : ${controllerSearch.resultSearch.length}",
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Obx(
              () => controllerSearch.resultSearch.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: controllerSearch.resultSearch.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Get.to(
                                    Content(
                                        content: controllerSearch
                                            .resultSearch[index]["_text"],
                                        title: controllerSearch
                                            .resultSearch[index]["title"],
                                        id: controllerSearch.resultSearch[index]
                                            ["id"]),
                                    transition: Transition.fade);
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: CommonItem(
                                title: controllerSearch.resultSearch[index]
                                    ["title"],
                              ));
                        },
                      ),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: const Border(
                                    bottom: BorderSide(
                                        width: 0.5, color: Colors.grey),
                                    right: BorderSide(
                                        width: 0.5, color: Colors.grey)),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "لا توجد نتيجة",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
