import 'package:breaking_bad/screens/allCharactersPage.dart';
import 'package:breaking_bad/screens/quotesPage.dart';
import 'package:breaking_bad/screens/searchCharactersPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/landing_page_controller.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25)
          ),
          height: 54,
          child: BottomNavigationBar(

            elevation: 0,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Colors.green.withOpacity(0.3),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.green.withOpacity(0.2),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'Explore',
                backgroundColor: Colors.green.withOpacity(0.2),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.format_quote_rounded,
                    size: 20.0,
                  ),
                ),
                label: 'Places',
                backgroundColor: Colors.green.withOpacity(0.2),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
    Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
          body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              AllCharactersPage(),
              SearchCharactersPage(),
              QuotesPage(),
            ],
          )),
        ));
  }
}