import 'package:flutter/material.dart';
import 'package:to_do_app/components/my_text.dart';
class AddNewTask extends StatelessWidget {
  String text ;
    Icon ? icon ;
    var controller = TextEditingController();
    final  onTap ;
    var validator ;
  AddNewTask({this.validator,this.onTap,required this.controller,this.icon,super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      onTap: onTap,
      validator: validator,
      controller: controller,
      textDirection: TextDirection.ltr,
      style: const TextStyle(fontSize: 15,color: Colors.black),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey,)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.red)),

        hintText: text ,
        hintStyle: const TextStyle(fontSize: 15,),
        hintTextDirection: TextDirection.ltr,
        suffixIcon: icon,

      ),

    );
  }
}