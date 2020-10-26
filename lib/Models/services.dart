import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  String productName;
  String description;

  Product({this.description, this.productName});

  factory Product.fromjson(Map<String, dynamic> json) {
    return Product(
      description: json['description'],
      productName: json['productName'],
    );
  }
}

Future<List<Product>> fetchProducts() async {
  final response = await http.get('https://apiecomm.herokuapp.com/product/');

  if (response.statusCode == 200) {
    var body = jsonDecode(response.body) as List;

    List<Product> product_object =
        body.map((product_json) => Product.fromjson(product_json)).toList();
    return product_object;
  } else {
    print(response.statusCode);
  }
}
