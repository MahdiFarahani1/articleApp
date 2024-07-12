import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/About/view/aboutUs.dart';
import 'package:flutter_application_1/Features/Articels/view/Articels_cats.dart';
import 'package:flutter_application_1/Features/Favorite/view/favorite.dart';
import 'package:flutter_application_1/Features/Home/getx/pageview_controller.getx.dart';
import 'package:flutter_application_1/Features/Home/view/widgets/bottom_navbar_item.dart';
import 'package:flutter_application_1/Features/Search/view/Search.dart';
import 'package:flutter_application_1/Features/Settings/view/settings.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  final PageViewControllerGetx pageViewControllerGetx =
      PageViewControllerGetx();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<Widget> pageWidgets = [
      ArticleCatsPage(),
      SearchPage(),
      FavoritePage(),
      const AboutPage(),
      const Settings()
    ];
    return Scaffold(
      body: Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: PageView.builder(
            onPageChanged: (value) {
              pageViewControllerGetx.changeIndex(value);
            },
            itemCount: 5,
            controller: pageViewControllerGetx.pageController,
            itemBuilder: (context, index) {
              return pageWidgets[index];
            },
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => Directionality(
            textDirection: TextDirection.rtl,
            child: CurvedNavigationBar(
              index: pageViewControllerGetx.indexPageView.value,
              backgroundColor: Theme.of(context).primaryColor,
              color: Theme.of(context).colorScheme.outlineVariant,
              height: 70,
              items:  <Widget>[
                NavBarItem(
              image: Assets.images.listTimeline.path,
                ),
                NavBarItem(
              image: Assets.images.searchAlt.path,
                ),
                NavBarItem(
              image: Assets.images.wishlistStar.path,
                ),
                NavBarItem(
              image: Assets.images.info.path,
                ),
                NavBarItem(
              image: Assets.images.settings.path,
                ),
              ],
              onTap: (index) {
                pageViewControllerGetx.changePageView(index);
              },
            ),
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
