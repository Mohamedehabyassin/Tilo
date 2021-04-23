import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:tilo/screen/cart/cart_screen.dart';
import 'package:tilo/screen/home/entrance_screen.dart';
import 'package:tilo/screen/profile/user_profile.dart';
import 'package:tilo/screen/wishlist/wishlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  static List<Widget> _widgetOptions = <Widget>[
    EntranceScreen(),
    WishlistScreen(),
    CartScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo1.jpg',
          height: 40,
          width: 80,
        ),
      ),
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.purple,
        inactiveIconColor: Colors.purple,
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                setState(() {
                  selectedIndex = 0;
                });
              }),
          TabData(
              iconData: Icons.favorite,
              title: "Wishlist",
              onclick: () {
                selectedIndex = 1;

              }),
          TabData(
              iconData: Icons.shopping_cart,
              title: "Cart",
              onclick: () {
                selectedIndex = 2;
                //  Navigator.of(context).pushNamed('/CartScreen');
              }),
          TabData(
              iconData: EvaIcons.person,
              title: "Profile",
              onclick: () {
                selectedIndex = 3;
                //Navigator.of(context).pushNamed('/ProfileScreen');
              })
        ],
        //initialSelection: 1,
        //key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            selectedIndex = position;

          });
        },
      ),
    );
  }
}
