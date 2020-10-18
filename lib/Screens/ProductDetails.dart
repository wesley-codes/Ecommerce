import 'Cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Components/IconButtons.dart';
import 'package:ecommerce/Constants/const.dart';
import 'package:ecommerce/Models/services.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  String itemName;
  double itemPrice;
  String itemImage;
  double itemRating;
  String itemDescription;

  ProductDetails(
      {this.itemName,
      this.itemPrice,
      this.itemDescription,
      this.itemImage,
      this.itemRating});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  PageController controller;

  final pageIndexNotifier = ValueNotifier<int>(0);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<Product> _futureProducts;

  @override
  Widget build(BuildContext context) {
    final imageCarousel = Container(
      height: 300,
      child: PageView(
        onPageChanged: (index) {
          setState(() {
            pageIndexNotifier.value = index;
          });
        },
        controller: controller,
        children: [
          Image(
            fit: BoxFit.fitWidth,
            image: NetworkImage(widget.itemImage),
          ),
          Image(
            fit: BoxFit.fitWidth,
            image: NetworkImage(widget.itemImage),
          ),
          Image(
            fit: BoxFit.fitWidth,
            image: NetworkImage(widget.itemImage),
          )
        ],
      ),
    );
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
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Shozy'),
        elevation: 0.5,
        actions: [
          Stack(
            children: [
              Icon_Button(
                color: Colors.black,
                onpressed: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShoppingCart()),
                    );
                  }
                },
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
                    "0",
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
      body: FutureBuilder(
          future: _futureProducts,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    //======Image Carousel==========

                    imageCarousel,
                    SizedBox(
                      height: 5.0,
                    ),

                    PageViewIndicator(
                      pageIndexNotifier: pageIndexNotifier,
                      length: 3,
                      normalBuilder: (animationController, index) => Circle(
                        size: 15.0,
                        color: Color(0XFFC1A5C8),
                      ),
                      highlightedBuilder: (animationController, index) =>
                          ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animationController,
                          curve: Curves.ease,
                        ),
                        child: Circle(
                          size: 20.0,
                          color: Color(0XFF631D76),
                        ),
                      ),
                    ),
                    Text(
                      widget.itemName,
                      style: KProductDetailsTextStyles,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.itemPrice}",
                          style: KPriceProductDetailsTextStyles,
                        ),
                        ButtonTheme(
                          height: 50,
                          child: FlatButton(
                            color: Color(0XFF2E2532),
                            child: Row(
                              children: [
                                Icon(Icons.add_shopping_cart,
                                    color: Colors.white),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("ADD",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Color(0XFF817D84),
                        fontSize: 24,
                        fontFamily: ('poppins'),
                      ),
                    ),
                    Text(
                      "${widget.itemDescription}",
                      // snapshot.data['description'],
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                          // color: Color(0XFFC0BEC2),
                          fontFamily: ('poppins'),
                          fontSize: 17),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Something went wrong ...");
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
