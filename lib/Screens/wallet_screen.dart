import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:plantea/Modals/extracted_widgets.dart';
import 'package:plantea/Modals/bottomNavigationBar.dart';


class WalletScreen extends StatelessWidget {
  static String id = 'wallet_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MybottomNavigationBar(2),
      body: Padding(
        padding: EdgeInsets.only(
          top: 35.0,
          left: 20.0,
          right: 20.0,
        ),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage('images/Plantea Logo.png'),
                  height: 30.0,
                ),
                Text(
                  'My E-Wallet',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                ),
                SizedBox(
                  width: 100.0,
                ),
                Row(
                  children: [
                    Icon(FontAwesomeIcons.search,
                        size: 20.0, color: Colors.grey.shade700),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(Icons.menu_outlined)
                  ],
                )
              ],
            ),
            // CreditCard(
            //   frontTextColor: Colors.blue,
            //   backTextColor: Colors.green,
            //   cardType: CardType.visa,
            //     cardNumber: "5555 4444 2222 3333",
            //     cardExpiry: "10/25",
            //     cardHolderName: "Ghulam Rasool",
            //     cvv: "456",
            //     bankName: "Axis Bank",
            //     showBackSide: false,
            //     frontLayout: Container(decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.all(Radius.circular(50.0))),),
            //     frontBackground: CardBackgrounds.black,
            //     backBackground: CardBackgrounds.white,
            //     showShadow: false,
            //     textExpDate: 'Exp. Date',
            //     textName: 'Name',
            //     textExpiry: 'MM/YY'
            // ),
            //Transaction History
            SizedBox(
              height: 15.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 75.0,
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
            ),
            SizedBox(
              height: 15.0,
            ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.asset('images/snakeplant.png'),
                    backgroundColor: Colors.grey.shade200,
                    minRadius: 30.0,
                    maxRadius: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prayer Plant',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 12.0,),
                      Text('Dec 15, 2024 | 10.00AM')
                    ],
                  ),
                  SizedBox(width: 30.0,),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$29',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7.0,),
                      Row(
                        children: [
                          Text('Orders'),
                          Icon(Icons.arrow_circle_up,color: Colors.red,)
                        ],
                      )
                    ],
                  )
                ],
              ),
            SizedBox(
              height: 15.0,
            ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: CircleAvatar(backgroundColor: Color(0xff04C16A),
                        child: Icon(FontAwesomeIcons.wallet,color: Colors.white,)),
                    backgroundColor: Colors.grey.shade200,
                    minRadius: 30.0,
                    maxRadius: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Up Wallet',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 12.0,),
                      Text('Dec 14, 2024 | 16.42PM')
                    ],
                  ),
                  SizedBox(width: 30.0,),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$100',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7.0,),
                      Row(
                        children: [
                          Text('Top Up'),
                          Icon(Icons.arrow_circle_down,color: Color(0xff04C16A),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            SizedBox(
              height: 15.0,
            ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.asset('images/hobbitjade.png'),
                    backgroundColor: Colors.grey.shade200,
                    minRadius: 30.0,
                    maxRadius: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hobbit Jade',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 12.0,),
                      Text('Nov 18, 2024 | 11.00AM')
                    ],
                  ),
                  SizedBox(width: 30.0,),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$32',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7.0,),
                      Row(
                        children: [
                          Text('Orders'),
                          Icon(Icons.arrow_circle_up,color: Colors.red,)
                        ],
                      )
                    ],
                  )
                ],
              ),
            SizedBox(
              height: 15.0,
            ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.asset('images/redchristmas.png'),
                    backgroundColor: Colors.grey.shade200,
                    minRadius: 30.0,
                    maxRadius: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Red Christmans',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 12.0,),
                      Text('Oct 25, 2024 | 12.12AM')
                    ],
                  ),
                  SizedBox(width: 30.0,),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$33',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7.0,),
                      Row(
                        children: [
                          Text('Orders'),
                          Icon(Icons.arrow_circle_up,color: Colors.red,)
                        ],
                      )
                    ],
                  )
                ],
              ),
            SizedBox(
              height: 15.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: CircleAvatar(backgroundColor: Color(0xff04C16A),
                      child: Icon(FontAwesomeIcons.wallet,color: Colors.white,)),
                  backgroundColor: Colors.grey.shade200,
                  minRadius: 30.0,
                  maxRadius: 30.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Up Wallet',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 12.0,),
                    Text('Dec 14, 2024 | 16.42PM')
                  ],
                ),
                SizedBox(width: 30.0,),
                Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$100',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 7.0,),
                    Row(
                      children: [
                        Text('Top Up'),
                        Icon(Icons.arrow_circle_down,color: Color(0xff04C16A),)
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
