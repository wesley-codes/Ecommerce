import 'package:ecommerce/Components/IconButtons.dart';
import 'package:ecommerce/Constants/const.dart';
import 'package:ecommerce/Models/StoreProducts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

// CREATING A _SCAFFOLD KEY SO I CAN BE ABLE TO USE A DIFFRENT ICON FOR A DRAWER
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _ShoppingCartState extends State<ShoppingCart> {


  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon_Button(
                  color: Colors.transparent,
                  onpressed: null,
                  icon: Icon(Icons.person),
                ),
              ),
              accountEmail: Text('Ezemikey122@gmail.com'),
              accountName: Text('Eze Nnaemeka'),
              arrowColor: Colors.indigo,
              decoration: BoxDecoration(color: Colors.indigo),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.5,
        actions: [
          Stack(
            children: [
              Icon_Button(
                color: Colors.black,
                onpressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
              Positioned(
                bottom: 12,
                right: 7,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.white,
                  child: Text(
                    "${ccart.countproducts}",
                    style: KPricesTextStyles,
                  ),
                ),
              ),
            ],
          )
        ],
        leading: Icon_Button(
          color: Colors.black,
          onpressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.format_indent_increase,
            size: 30,
          ),
        ),
      ),
      body: ccart.items.isEmpty
          ? Center(
              child: Text(
                "No item displayed ",
                style: KPricesTextStyles,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    
                    itemBuilder: (BuildContext context, int index) {
                      
                      return Card(
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              child: Image(
                                image:
                                    NetworkImage(ccart.items[index].itemImage),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      ccart.items[index].itemName,
                                      style: TextStyle(
                                          fontFamily: ("poppins"),
                                          fontSize: 18),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "\$${ccart.items[index].itemPrice}",
                                      style: TextStyle(
                                          fontFamily: ("comfortaa"),
                                          fontSize: 18),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black87, width: 3),
                                        ),
                                        child: Icon_Button(
                                          color: Colors.black,
                                          onpressed: () {
                                            setState(() {
                                              ccart.items[index].itemqyt--;
                                            });
                                          },
                                          icon: Icon(FontAwesomeIcons.minus),
                                        ),
                                      ),
                                      Container(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 22),
                                          child: Text(
                                            "${ccart.items[index].itemqyt}",
                                            style: TextStyle(
                                                fontFamily:
                                                    ("InconsolataCondensed"),
                                                fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        width: 112,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black87,
                                                width: 3.0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black87, width: 3),
                                        ),
                                        child: Icon_Button(
                                          color: Colors.black,
                                          onpressed: () {
                                            setState(() {
                                              ccart.items[index].itemqyt++;
                                            });
                                          },
                                          icon: Icon(FontAwesomeIcons.plus),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: ccart.items.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub-Total:",
                              style: KProductTextStyles,
                            ),
                            Text(
                              "6574383",
                              style: KPricesTextStyles,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping:",
                              style: KProductTextStyles,
                            ),
                            Text(
                              "6574383",
                              style: KPricesTextStyles,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 250),
                          child: Divider(
                            color: Colors.black87,
                            thickness: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sub-Total:", style: KProductTextStyles),
                            Text("6574383", style: KPricesTextStyles),
                          ],
                        ),
                        FlatButton(
                            onPressed: () {},
                            height: 55,
                            color: Color(0XFF2E2532),
                            child: Text(
                              "CheckOut",
                              style: TextStyle(
                                fontFamily: ('Lato'),
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
