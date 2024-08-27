import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practice_widgets/instagram/authStore/auth_store.dart';
import 'package:practice_widgets/instagram/home_screen.dart';
import 'package:practice_widgets/instagram/profile_scree.dart';
import 'package:practice_widgets/instagram/reels_screen.dart';
import 'package:practice_widgets/instagram/search_screen.dart';
import 'package:practice_widgets/instagram/shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    ReelsScreen(),
    const ShopScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(mainScreen.selectedIndex),
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                label: '',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.smart_display_outlined),
                label: '',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard_outlined),
                label: '',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
                backgroundColor: Colors.black),
          ],
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          iconSize: 30,
          currentIndex: mainScreen.selectedIndex,
          selectedItemColor: Colors.white,
          onTap: mainScreen.setSelectedIndex,
        );
      }),
    );
  }
}
