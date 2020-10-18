import 'package:flutter/material.dart';

// ignore: camel_case_types
class Icon_Button extends StatelessWidget {
  Icon_Button(
      {@required this.icon, @required this.onpressed, @required this.color});
  final Icon icon;
  final Color color;
  final Function onpressed;
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onpressed,
      color: color,
    );
  }
}
