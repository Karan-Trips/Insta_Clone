import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_widgets/genrated/assets/assets.dart';
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
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: _widgetOptions.elementAt(mainScreen.selectedIndex),
        ),
        bottomNavigationBar: Observer(builder: (_) {
          return BottomNavigationBar(
            elevation: 5,
            enableFeedback: true,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: '',
                  backgroundColor: Colors.black),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  label: '',
                  backgroundColor: Colors.black),
              const BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.squarePlus, size: 27),
                  label: '',
                  backgroundColor: Colors.black),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.smart_display_outlined),
                  label: '',
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2.w, color: Colors.grey)),
                      child: const CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage(Assets.assetsImgCat))),
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
    });
  }
}
