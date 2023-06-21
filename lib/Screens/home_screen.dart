import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/Modals/extracted_widgets.dart';

import '../Modals/bottomNavigationBar.dart';

Color selectedColor = Colors.green;
Color backgroundColor = Colors.transparent;

class HomeScreen extends StatefulWidget {
  List<PlantModal> plantData = [];

  static String id = 'home_screen';
  List<String> labelNames = [
    'All',
    'Monstera',
    'Palm',
    'Aloe',
    'Olive',
    'Parlor Palm',
    'Snake Plant',
    'Ficcus',
    'Pothos',
    'Yucca'
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _value = 0;
  bool value = false;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser!;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        //Arrow to Exit The App.
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: FloatingActionButton(
            onPressed: () {
              print('Signed Out');
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.arrow_back),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: MybottomNavigationBar(0),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        children: [
          //Row for upper Side of the Screen
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 30.0,
                    backgroundImage: AssetImage('images/sam.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning👋',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('${'Ghulam Rasool'}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                    ],
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        size: 40.0,
                      ),
                      Icon(
                        Icons.favorite_outline,
                        size: 40.0,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          //Search Bar
          MyTextField(
            hintText: 'Search',
            hintIcon: Icon(Icons.search),
            icon: IconButton(
                onPressed: () {}, icon: Icon(FontAwesomeIcons.filter)),
          ),
          SizedBox(
            height: 15.0,
          ),
          //Row For Special Offers Text
          SpecialCatergoryText(
            'Special Offers',
          ),
          MessageStream(true),
          //Row For Most Popular Text
          SpecialCatergoryText('Most Popular'),
          SizedBox(
            height: 50.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                        spacing: 13.0,
                        children: List<Widget>.generate(
                          10,
                          (int index) {
                            return ChoiceChip(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.circular(40.0)),
                              selectedColor: selectedColor,
                              backgroundColor: Colors.transparent,
                              labelStyle: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600),
                              label: Text(
                                widget.labelNames[index],
                                style: TextStyle(
                                    color: _value == index
                                        ? Colors.white
                                        : Colors.green),
                              ),
                              selected: _value == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  _value = index;
                                });
                              },
                            );
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
          MessageStream(false)
        ],
      ),

      //BottomNavigationBar
    );
  }
}
