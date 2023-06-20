import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantea/Screens/order_screen.dart';

class HorizontalLines extends StatelessWidget {
  double width = 100.0;

  HorizontalLines(this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  late final Image image;

  SocialMediaButton(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        //
        child: image);
  }
}

class MyTextField extends StatelessWidget {
  final String? hintText;
  final Icon? hintIcon;
  IconButton? icon;
  bool passwordHide;
  final controller = TextEditingController();

  MyTextField(
      {this.hintText, this.hintIcon, this.icon, this.passwordHide = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15),
      child: SizedBox(
        width: double.infinity,
        child: TextField(
          controller: controller,
          obscureText: passwordHide,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(15.0))),
              contentPadding: EdgeInsets.all(20.0),
              prefixIcon: hintIcon,
              suffixIcon: icon,
              hintText: hintText,
              fillColor: Colors.grey.shade200,
              filled: true),
        ),
      ),
    );
  }
}

class ExitArrow extends StatelessWidget {
  Color backGroundcolor = Colors.white;

  ExitArrow(this.backGroundcolor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: backGroundcolor,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
    );
  }
}

class SpecialCatergoryText extends StatelessWidget {
  String text1;

  SpecialCatergoryText(this.text1);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '$text1',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 110.0,
        ),
        Text(
          'See All',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class QuantityButtons extends StatefulWidget {
  static int quantity = 0;

  @override
  State<QuantityButtons> createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<QuantityButtons> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlantModal {
  String imagePath;
  String plantName;
  String plantPrice;
  String plantRating;
  String? description;

  PlantModal(
      {required this.imagePath,
      required this.plantName,
      required this.plantPrice,
      required this.plantRating,
      this.description});
}

class PlantCard extends StatelessWidget {
  PlantCard({
    this.image,
    this.plantName,
    this.plantRating,
    this.plantPrice,
    this.onTap,
    this.description,
    this.status,
    this.totalPrice,
  });

  final String? image;
  final String? plantName;
  final String? plantRating;
  final int? plantPrice;
  final Function()? onTap;
  final String? description;
  final String? status;
  final String? totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OrderScreen(
                  image: '$image',
                  name: plantName,
                  price: plantPrice,
                  rating: plantRating,
                  description: description,
                );
              }));
            },
            child: Container(
                margin: EdgeInsets.only(top: 15.0),
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.grey.shade100),
                child: Image.network('$image')),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '$plantName',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                FontAwesomeIcons.starHalfAlt,
                color: Colors.green,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '$plantRating',
                style: TextStyle(fontSize: 20.0, color: Colors.grey.shade700),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text('\$$plantPrice',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;
  late String name;
  late String rating;
  late String image;
  late String description;
  late String price;
  bool horizontalStream;

  MessageStream(this.horizontalStream);


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('Products').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            print('This Is Main Error');
            print(snapshot.error);
           return CircularProgressIndicator();
          }else
          print('object');
          List<PlantCard> plantCard = [];
          dynamic plants = snapshot.data?.docs;
          for (var dataOfSnapshot in plants) {
            name = dataOfSnapshot.data()['Name'];
            price = dataOfSnapshot.data()['Price'];
            rating = dataOfSnapshot.data()['Rating'];
            image = dataOfSnapshot.data()['Image'];
            description = dataOfSnapshot.data()['Description'];

            plantCard.add(PlantCard(
              image: '$image',
              plantName: '$name',
              plantRating: '$rating',
              plantPrice: int.parse(price),
              description: '$description',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OrderScreen(
                    image: '$image',
                    name: name,
                    price: int.parse(price),
                    rating: rating,
                    description: description,
                  );
                }));
              },
            ));

          }

          return horizontalStream == true ? HorizontalStream(plantCard: plantCard,directionHorizontal: Axis.horizontal): VerticalStream(plantCard: plantCard);
        });
  }
}
class HorizontalStream extends StatelessWidget {
  const HorizontalStream({
    Key? key,
    required this.plantCard,
    required this.directionHorizontal
  }) : super(key: key);

  final List<PlantCard> plantCard;
  final Axis directionHorizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 330.0,
        child: ListView(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          scrollDirection: directionHorizontal,
          children: plantCard,
        ));
  }
}
class VerticalStream extends StatelessWidget {
  const VerticalStream({
    Key? key,
    required this.plantCard,
  }) : super(key: key);

  final List<PlantCard> plantCard;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 0.9),
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children:
            List<PlantCard>.generate(6, (index) => plantCard[index]));
  }
}

final firestore = FirebaseFirestore.instance;

class OrderList extends StatelessWidget {
  String? name;
  String? image;
  String? status;
  String? totalPrice;
  String? quantity;
  String? docId;
  bool list;

  OrderList(this.list);



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('Orders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.blueAccent,
            ));
          }
          dynamic plants = snapshot.data?.docs;
          List<OrderListItems> plantListActive = [];
          List<OrderListItems> plantListCompleted = [];
          for (var dataOfSnapshot in plants) {
            name = dataOfSnapshot.data()['Product Name'];
            image = dataOfSnapshot.data()['Image Url'];
            status = dataOfSnapshot.data()['Status'];
            totalPrice = dataOfSnapshot.data()['Total Price'];
            quantity = dataOfSnapshot.data()['Quantity'];
            docId = dataOfSnapshot.id;
            status == 'Delivered'
                ? plantListCompleted.add(
                    OrderListItems(
                      image: image,
                      name: name,
                      status: status,
                      totalPrice: totalPrice,
                      quantity: quantity,
                      docId: docId,
                    ),
                  )
                : plantListActive.add(
                    OrderListItems(
                      image: image,
                      name: name,
                      status: status,
                      totalPrice: totalPrice,
                      quantity: quantity,
                      docId: docId,
                    ),
                  );
          }
          return list == true
              ? ActiveList(plantListCompleted: plantListCompleted)
              : CompleteList(plantListActive: plantListActive);
        });
  }
}

class CompleteList extends StatelessWidget {
  const CompleteList({
    Key? key,
    required this.plantListActive,
  }) : super(key: key);

  final List<OrderListItems> plantListActive;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List<OrderListItems>.generate(
            plantListActive.length,
            (index) => plantListActive[index]));
  }
}
class ActiveList extends StatelessWidget {
  const ActiveList({
    Key? key,
    required this.plantListCompleted,
  }) : super(key: key);

  final List<OrderListItems> plantListCompleted;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List<OrderListItems>.generate(
            plantListCompleted.length,
            (index) => plantListCompleted[index]));
  }
}

class OrderListItems extends StatelessWidget {
  OrderListItems(
      {Key? key,
      required this.image,
      required this.name,
      required this.status,
      required this.totalPrice,
      required this.quantity,
      required this.docId})
      : super(key: key);

  final String? image;
  final String? name;
  String? status;
  final String? totalPrice;
  final String? quantity;
  final String? docId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 150.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.0), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 110.0,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27.0),
                    color: Colors.grey.shade200),
                child: Image.network(
                  '$image',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('Qty = $quantity'),
                  Container(
                      height: 25.0,
                      width: 81.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.5),
                          color: Colors.green.shade50),
                      child: Center(
                          child: Text(
                        '$status',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ))),
                  Text(
                    '\$$totalPrice',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ],
              ),
            ],
          ),
          if(status != 'Delivered')
            TextButton(
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
              CollectionReference orders = firestore.collection('Orders');
              orders.doc('$docId').update({
                'Status': 'Delivered',
              });
            },
            child: Text(
              'Complete',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 11.0),
    );
  }
}
