import 'package:ecommerce/Components/IconButtons.dart';
import 'package:ecommerce/Constants/const.dart';
import 'package:ecommerce/Models/services.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Uploadproduct extends StatefulWidget {
  @override
  _UploadproductState createState() => _UploadproductState();
}

class _UploadproductState extends State<Uploadproduct> {
  Future<List<Product>> _futureProducts;
  Dio dio = Dio();
  File _image;
  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        print(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  String productName;
  String productDescription;

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
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 60,
                  ),
                  Positioned(
                    bottom: 12,
                    right: 7,
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.white,
                      child: Icon_Button(
                        color: Colors.purple,
                        onpressed: () {
                          _showPicker(context);
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    productName = value;
                  },
                  maxLines: null,
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(
              //     controller: _productPrice,
              //     decoration: new InputDecoration(
              //       labelText: "Product Price",
              //       labelStyle: KTextFieldLabelStyle,
              //       hintText: "Product Price",
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //           color: Colors.grey,
              //           width: 2,
              //         ),
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(
              //           width: 2,
              //           color: Colors.purple,
              //         ),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    productDescription = value;
                  },
                  maxLines: null,
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
                  try {
                    String filename = _image.path.split("/").last;
                    FormData formData = FormData.fromMap({
                      "image": await MultipartFile.fromFile(_image.path,
                          filename: filename,
                          contentType: MediaType("image", "png")),
                      "productName": productName,
                      "description": productDescription
                    });
                    Response response = await dio.post(
                        "https://apiecomm.herokuapp.com/product/add",
                        data: formData);
                    print(response.headers);
                  } catch (e) {
                    print(e);
                  }
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
