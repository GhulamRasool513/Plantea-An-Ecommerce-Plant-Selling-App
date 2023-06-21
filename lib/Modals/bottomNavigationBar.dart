import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/Screens/home_screen.dart';
import 'package:plantea/Screens/my_order.dart';
import 'package:plantea/Screens/profile_screen.dart';
import 'package:plantea/Screens/wallet_screen.dart';


class MybottomNavigationBar extends StatelessWidget {
  int? currentIndex;
//TODO Make it work properly.
  MybottomNavigationBar(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
        padding: EdgeInsets.only(top: 15.0),
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: double.infinity,
        selectedItemColor: Color(0xff02B763),
        items: [
          FloatingNavbarItem(icon: FontAwesomeIcons.home, title: 'Home'),
          FloatingNavbarItem(
              icon: FontAwesomeIcons.shoppingCart, title: 'Orders'),
          FloatingNavbarItem(icon: FontAwesomeIcons.wallet, title: 'Wallet'),
          FloatingNavbarItem(icon: FontAwesomeIcons.user, title: 'Profile'),
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          value == 0
              ? Navigator.pushNamed(context, HomeScreen.id)
              : value == 1
                  ? Navigator.pushNamed(context, MyOrderScreen.id)
                  : value == 2
                      ? Navigator.pushNamed(context, WalletScreen.id)
                      : value == 3
                          ? Navigator.pushNamed(context, ProfileScreen.id)
                          : null;
        });
  }
}
