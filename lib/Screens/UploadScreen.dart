import 'package:ecommerce/Constants/const.dart';
import 'package:ecommerce/Models/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Uploadproduct extends StatefulWidget {
  @override
  _UploadproductState createState() => _UploadproductState();
}

class _UploadproductState extends State<Uploadproduct> {
  Future<Product> _futureProducts;

  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productdescription = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("upload"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _productName,
                  decoration: new InputDecoration(
                    labelText: "Product Name",
                    labelStyle: KTextFieldLabelStyle,
                    hintText: "Product Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _productPrice,
                  decoration: new InputDecoration(
                    labelText: "Product Price",
                    labelStyle: KTextFieldLabelStyle,
                    hintText: "Product Price",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _productdescription,
                  decoration: new InputDecoration(
                    labelText: "Product Description",
                    labelStyle: KTextFieldLabelStyle,
                    hintText: "Product Description",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.purple,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _futureProducts = createProducts(_productName.text,
                        _productdescription.text, _productPrice.text);
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.purple),
                ),
                color: Colors.white,
                child: Text("Upload"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

const KTextFieldDecoration =
    InputDecoration(hintText: (''), hintStyle: TextStyle(color: Colors.grey));
