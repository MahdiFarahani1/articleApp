import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/Home/getx/pageview_controller.getx.dart';
import 'package:flutter_application_1/Features/Home/view/widgets/bottom_navbar_item.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  final PageViewControllerGetx pageViewControllerGetx =
      PageViewControllerGetx();

  @override
  Widget build(BuildContext context) {
    super.build(context); // اضافه شده

    final List<String> li = ["settings", "news", "search", "star", "list"];
    return Scaffold(
      body: Center(
        child: PageView.builder(
          onPageChanged: (value) {
            pageViewControllerGetx.changeIndex(value);
          },
          itemCount: 5,
          controller: pageViewControllerGetx.pageController,
          itemBuilder: (context, index) {
            print(index);

            return Container(
              color: Colors.white,
              child: Center(
                child: Text(li[index]),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            index: pageViewControllerGetx.indexPageView.value,
            backgroundColor: Theme.of(context).primaryColor,
            color: Theme.of(context).colorScheme.outlineVariant,
            height: 70,
            items: const <Widget>[
              NavBarItem(
                iconData: Icons.settings,
              ),
              NavBarItem(
                iconData: Icons.newspaper,
              ),
              NavBarItem(
                iconData: Icons.search,
              ),
              NavBarItem(
                iconData: Icons.star,
              ),
              NavBarItem(
                iconData: Icons.list,
              ),
            ],
            onTap: (index) {
              pageViewControllerGetx.changePageView(index);
            },
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
