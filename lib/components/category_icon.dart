import 'package:flutter/material.dart';
class CategoryIcon extends StatelessWidget {
  String image ;
  var fun ;
   var border ;

   CategoryIcon({this.border,this.fun,required this.image,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        height: 50 ,width: 50,
        decoration:  BoxDecoration(
          border:border,
        shape: BoxShape.circle),
        child: Image(image: AssetImage(image))
      ),
    );
  }
}
