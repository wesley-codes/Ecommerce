import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  String productName;
  String description;
  String image;
  int price;

  Product({this.description, this.productName, this.image ,this.price});

  factory Product.fromjson(Map<String, dynamic> json) {
    return Product(
        description: json['description'],
        productName: json['productName'],
        image: json['image'],
        price:json['price']
        );
  }
}

Future<List<Product>> fetchProducts() async {
  final response = await http.get('https://apiecomm.herokuapp.com/product/');

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body) as List;

    List<Product> productObject =
        body.map((productJson) => Product.fromjson(productJson)).toList();

    return productObject;
  } else {
    print(response.statusCode);
  }
}
