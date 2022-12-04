
import 'package:breaking_bad/screens/allCharactersPage.dart';
import 'package:breaking_bad/screens/quotesPage.dart';
import 'package:breaking_bad/screens/searchCharactersPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNav extends StatefulWidget {
  final int setIndex;

  const BottomNav({Key? key, this.setIndex = 0}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  int index_x = 0;

  @override
  void initState() {
    super.initState();

    index_x = widget.setIndex;
  }

  final screens = [
    AllCharactersPage(),
    SearchCharactersPage(),
    QuotesPage(),

  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    Text('Search',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    Text('Quotes',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        )),
  ];


  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        setState(() {
          Get.offAll(AllCharactersPage());
        });
        break;
      case 1:
        setState(() {
          Get.offAll(SearchCharactersPage());        });

        break;
      case 2:
        setState(() {
          Get.offAll(QuotesPage());
        });

        break;
      default:
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: screens[index_x],
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_quote_sharp),
                label: 'Quotes',
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: 0,
            selectedIconTheme: IconThemeData(color:Colors.green.withOpacity(0.2)),
            selectedLabelStyle: TextStyle(
              color: Colors.green.withOpacity(0.2),
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.green.withOpacity(0.2),
              fontSize: 12,
            ),
            selectedItemColor: Colors.green.withOpacity(0.2),
            unselectedItemColor: Colors.grey,
            iconSize: 24,
            onTap: _onItemTapped,
            elevation: 5),
      ),
    );
  }
}
