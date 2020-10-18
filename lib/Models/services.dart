import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final double price;
  final String productName;
  final String description;

  Product({this.price, this.productName, this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json['price'],
      productName: json['productName'],
      description: json['description'],
    );
  }
}

Future<Product> createProducts(
    String productName, String price, String description) async {
  final http.Response response = await http.post(
    'https://merceapp123.herokuapp.com/product',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'price': price,
      'productName': productName,
      'description': description
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Product.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("failed");
  }
}
