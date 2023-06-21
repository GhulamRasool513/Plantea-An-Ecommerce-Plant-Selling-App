import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/Modals/bottomNavigationBar.dart';
import 'package:plantea/Modals/extracted_widgets.dart';
class MyOrderScreen extends StatelessWidget {
  static String id = 'my_order_screen';

  String? name;
  String? image;
  String? status;
  String? totalPrice;
  MyOrderScreen({this.totalPrice,this.status,this.name,this.image});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: MybottomNavigationBar(1),
            backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Color(0xFFFDFDFD),
            //Row For "My Order" And Icons
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage('images/Plantea Logo.png'),
                  height: 30.0,
                ),
                Text(
                  'My Orders',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                ),
                SizedBox(
                  width: 120.0,
                ),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.search,
                        size: 20.0, color: Colors.grey.shade700),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(
                      Icons.menu_outlined,
                      color: Colors.grey.shade700,
                    )
                  ],
                )
              ],
            ),
            //Active And Complete TabBar
            bottom: TabBar(
                unselectedLabelColor: Colors.grey,
                labelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                indicatorWeight: 3.0,
                indicatorColor: Color(0xFF02B763),
                labelColor: Color(0xFF02B763),
                tabs: [
                  Tab(
                    text: 'Active',
                  ),
                  Tab(
                    text: 'Completed',
                  )
                ]),
          ),

          //Body Of Active TabBar
          body: Padding(
              padding: EdgeInsets.only(top: 20.0, left: 17.0, right: 17.0),
              child: TabBarView(
                children: [
                  OrderList(false),
                  OrderList(true),
          ],
        ),
      ),
    )));
  }
}

