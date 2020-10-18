import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/StoreProducts.dart';
import 'Screens/MyProduct.dart';

void main() {
  runApp(Homepage());
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>.value(
      value: Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyProducts(),
      ),
    );
  }
}
