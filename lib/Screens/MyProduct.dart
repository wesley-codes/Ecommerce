import 'package:ecommerce/Components/IconButtons.dart';
import 'package:ecommerce/Constants/const.dart';
import 'package:ecommerce/Models/StoreProducts.dart';
import 'package:ecommerce/Models/services.dart';
import 'package:ecommerce/Screens/UploadScreen.dart';
import 'ProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cart.dart';

class MyProducts extends StatefulWidget {
  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  // CONVERTING PRODUCT TO LIST
  Future<List<Product>> futureProduct;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProduct = fetchProducts();
  }

// A REFRESH ABILITY FEATURE
  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
          futureProduct = fetchProducts();
    });
    return null;
  }

  // CREATING A _SCAFFOLD KEY SO I CAN BE ABLE TO USE A DIFFRENT ICON FOR A DRAWER
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
          child: Container(
        color: Colors.purple,
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
              accountEmail: Text(
                'Ezemikey122@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
              accountName: Text('Eze Nnaemeka', style: TextStyle(fontSize: 16)),
              arrowColor: Colors.indigo,
              decoration: BoxDecoration(color: Colors.purple),
            ),
            BuildListTile(
              onPressed: () {},
              caption: "Mens Clothes",
            ),
            BuildListTile(
              onPressed: () {},
              caption: "Womens Clothes",
            ),
            BuildListTile(
              onPressed: () {},
              caption: "Sneakers",
            ),
            BuildListTile(
              onPressed: () {},
              caption: "Hoodies",
            ),
            BuildListTile(
              onPressed: () {},
              caption: "Orders",
            ),
            BuildListTile(
              onPressed: () {},
              caption: "Favourites",
            ),
            BuildListTile(
              onPressed: () {},
              caption: "Carts",
            ),
            Divider(color: Colors.white),
            BuildListTile(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Uploadproduct(),
                    ));
              },
              caption: "Upload products",
            ),
            BuildListTile(
              onPressed: () {},
              caption: "Help",
            ),
            BuildListTile(
              onPressed: () {},
              caption: "About",
            ),
          ],
        ),
      )),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShoppingCart()));
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
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.format_indent_increase,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshList,
        child: FutureBuilder<List<Product>>(
          future: futureProduct,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    Flexible(
                        child: Consumer<Cart>(builder: (context, value, child) {
                      return GridView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisSpacing: 15.0),
                        itemCount: snapshot.data.length, //*//
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                     itemImage: snapshot.data[index].image,
                                    itemName:
                                        snapshot.data[index].productName, //*//
                                    itemDescription:
                                        snapshot.data[index].description, //*//
                                    itemPrice: snapshot.data[index].price,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                                child: GridTile(
                              child: Stack(
                                alignment: FractionalOffset.topRight,
                                children: [
                                  Container(
                                      child: Image(
                                    image: NetworkImage(
                                      snapshot.data[index].image,
                                    ),
                                    fit: BoxFit.fill,
                                  )),
                                  Icon_Button(
                                    color: Colors.indigo,
                                    onpressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             Upload()));
                                    },
                                    icon: Icon(Icons.favorite),
                                  )
                                ],
                              ),
                              footer: Container(
                                margin: EdgeInsets.only(right: 3),
                                color: Colors.white54,
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data[index].productName,
                                                style: KProductTextStyles,
                                              ),
                                              Text(
                                                  "\$${snapshot.data[index].price}",
                                                  style: KProductTextStyles)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black87,
                                                  width: 3),
                                              borderRadius:
                                                  BorderRadius.circular(3.0)),
                                          child: Icon_Button(
                                            color: Colors.black87,
                                            onpressed: () {
                                              ccart.addproducts(
                                                  storeItems[index]);
                                            },
                                            icon: Icon(
                                              Icons.add_shopping_cart,
                                              size: 30,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                          );
                        },
                      );
                    }))
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("something went wrong ...."));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  final String caption;
  final Function onPressed;
  BuildListTile({@required this.caption, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: ListTile(
          title: Text(
            caption,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));
  }
}
