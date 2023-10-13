import 'package:flutter/material.dart';
class MyText extends StatelessWidget {
  String text ;
  Color color ;
  double size ;
  bool isBold = false;
  var decoration ;
  MyText( {this.decoration,required this.size,required this.color,required this.isBold,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,style:TextStyle(color: color,fontSize: size,
      decoration: decoration,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal ,) ,);
  }
}