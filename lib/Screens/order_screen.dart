import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plantea/Modals/extracted_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/Modals/bottomNavigationBar.dart';
import 'package:plantea/Screens/my_order.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class OrderScreen extends StatefulWidget {
  static String id = 'order_screen';
  String? name;
  String? image;
  String? rating;
  String? description;
  int? price;

  OrderScreen(
      {this.image, this.name, this.price, this.rating, this.description});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late int totalPrice = 0;
  late int quantity = 0;

  final orders = FirebaseFirestore.instance.collection('Orders');

  //Add Data to FireStore
  void addData() {
    orders.add({
      'Email': 'mirsameer513@gmail.com',
      'Product Name': '${widget.name}',
      'Quantity': '$quantity',
      'Unit Price': '${widget.price}',
      'Total Price': '$totalPrice',
      'Image Url': '${widget.image}',
      'Status': 'In Delievery',
      'Time': DateTime.now(),
    });
    setState(() {
      quantity = 0;
      totalPrice = 0;
    });
  }

  ConfirmationDialog(context) {
    Alert(
        context: context,
        title: 'Are You Sure?',
        style: AlertStyle(
          backgroundColor: Colors.grey.shade200,
          titleStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          descStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        desc: 'Like Sure, Sure?',
        buttons: [
          DialogButton(
              color: Color(0xff109C5B),
              child: Text(
                'Not Sure👎',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          DialogButton(
              color: Color(0xff109C5B),
              child: Text('Sure Sure👍',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pushNamed(context, MyOrderScreen.id);
                addData();
              }),
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //Arrow to Go Back.
          //TODO put this Arrow Inside of Image.
          leading: ExitArrow(Colors.white),
          elevation: 0.0,
          backgroundColor: Colors.grey.shade100,
        ),
        backgroundColor: Colors.white,
        body: ListView(children: [
          Container(
            height: 400.0,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade100),
            //TODO Create sliding images list
            child: Image.network(
              '${widget.image}',
              scale: 1.4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${widget.name}',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.green,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 25.0,
                        width: 81.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.5),
                            color: Colors.green.shade50),
                        child: Center(
                            child: Text(
                          '7.736 Sold',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ))),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      FontAwesomeIcons.starHalfAlt,
                      color: Colors.green,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${widget.rating} (5,389 Reviews)',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Text(
                      '\$${widget.price}',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                  ],
                ),
                SizedBox(
                  height: 13.0,
                ),
                HorizontalLines(500.0),
                SizedBox(
                  height: 13.0,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${widget.description}',
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                //Quantity Buttons
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    //TODO Make them Work
                    Container(
                        height: 50.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.grey.shade100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  quantity--;
                                  totalPrice = widget.price! * quantity;
                                });
                              },
                              child: Icon(
                                Icons.horizontal_rule,
                                color: Color(0xff109C5B),
                              ),
                            ),
                            Text(
                              '$quantity',
                              style: TextStyle(
                                  color: Color(0xff109C5B),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                  totalPrice = widget.price! * quantity;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Color(0xff109C5B),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                HorizontalLines(500.0),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Text(
                          '\$$totalPrice',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 50.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff109C5B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                50.0,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          ConfirmationDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
