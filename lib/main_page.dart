import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plantea/Screens/home_screen.dart';
import 'package:plantea/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  static String id = ('main_page');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('homescreen');
              return HomeScreen();
            } else {
              print('Login Screen');
              return LoginScreen();;
            }
          }),
    );
  }
}
