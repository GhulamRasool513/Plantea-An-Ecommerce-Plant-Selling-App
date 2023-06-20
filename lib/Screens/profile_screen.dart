import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'registration_screen.dart';
import 'wallet_screen.dart';
import 'home_screen.dart';
import 'package:plantea/Modals/extracted_widgets.dart';
import 'package:plantea/Modals/bottomNavigationBar.dart';


class ProfileScreen extends StatelessWidget {
  static String id = 'profile_screen';
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: MybottomNavigationBar(3),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    'images/Plantea Logo.png',
                    height: 30.0,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 21.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.menu,size: 27.0,color: Colors.black,),
                ),
                CircleAvatar(
                  maxRadius: 55.0,
                  backgroundColor: Colors.white,
                  child: Image(image: AssetImage('images/sam.png')),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Ghulam Rasool',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text('+92 315 128 6089',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
                //Settings LisTiles
                //TODO Refactor...
                ListTile(
                  leading: Icon(FontAwesomeIcons.user),
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Profile
                ListTile(
                  leading: Icon(Icons.location_on_outlined,size: 29.0,),
                  title: Text(
                    'Address',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Address
                ListTile(
                  leading: Icon(FontAwesomeIcons.bell),
                  title: Text(
                    'Notification',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Notification
                ListTile(
                  leading: Icon(Icons.account_balance_wallet_outlined),
                  title: Text(
                    'Wallet',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Wallet
                ListTile(
                  leading: Icon(Icons.security_outlined),
                  title: Text(
                    'Security',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Security
                ListTile(
                  subtitle: Text('English (US)'),
                  leading: Icon(Icons.language_outlined),
                  title: Text(
                    'Language',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Language
                ListTile(
                  leading: Icon(Icons.remove_red_eye_outlined,size: 27.0,
                  ),
                  title: Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  //TODO Make This button work.
                  trailing: CupertinoSwitch(value: value, onChanged: (value){!value;}),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Dark Mode
                ListTile(
                  leading: Icon(Icons.lock_outline_rounded,size: 27.0,),
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Privacy
                ListTile(
                  leading: Icon(Icons.error_outline,size: 27,),
                  title: Text(
                    'Help Centre',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Help Centre
                ListTile(
                  leading: Icon(FontAwesomeIcons.users,color: Colors.grey.shade600,),
                  title: Text(
                    'Invite Friends',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,size: 19.0,),
                  iconColor: Colors.black,
                  textColor: Colors.black,
                  minVerticalPadding: 18.0,
                ),//Invite Friends
                ListTile(
                  leading: Icon(Icons.logout,size: 28.0,),
                  title: Text(
                    'Logout',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  minVerticalPadding: 18.0,
                ),//Log Out
              ],
            ),
          )
        ],
      ),
    );
  }
}
