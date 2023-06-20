import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plantea/Screens/registration_screen.dart';
import 'package:plantea/Modals/extracted_widgets.dart';
import 'package:plantea/main_page.dart';



class LoadingScreen extends StatelessWidget {
  static String id = 'loading_screen';
  @override
  Widget build(BuildContext context) {
    print('Loading Screen');
    //Timer For Splash Screen
    //TODO Talk To Musharaf About Double Registration Screen.
    timeDilation = 3.0;
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushNamed(context, MainPage.id));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 210.0),
                child: Image.asset(
                  'images/Plantea Logo.png',
                  height: 110,
                ),
              ),
              SpinKitCircle(
                duration: Duration(seconds: 1),
                size: 70.0,
                color: Color(0xFF0ED679),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
