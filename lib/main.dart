import 'package:flutter/material.dart';
import 'package:plantea/Screens/home_screen.dart';
import 'package:plantea/Screens/loading_screen.dart';
import 'package:plantea/Screens/my_order.dart';
import 'package:plantea/Screens/order_screen.dart';
import 'package:plantea/Screens/profile_screen.dart';
import 'package:plantea/Screens/registration_screen.dart';
import 'package:plantea/Screens/wallet_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plantea/Screens/login_screen.dart';
import 'main_page.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

// TextEditingController dataGetter = TextEditingController();

var message;
final navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(fontFamily: 'Questrial'),
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        OrderScreen.id: (context) => OrderScreen(),
        WalletScreen.id: (context) => WalletScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        MyOrderScreen.id: (context) => MyOrderScreen(),
        MainPage.id: (context) => MainPage(),
      },
    );

  }
}
