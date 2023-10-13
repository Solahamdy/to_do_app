import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/blocs/to_do_bloc/to_do_app_cubit.dart';
import 'package:to_do_app/components/my_text.dart';
class PurpleContainerAppBarr extends StatelessWidget {

   const PurpleContainerAppBarr({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy').format(now);
    return  BlocConsumer<ToDoAppCubit, ToDoAppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = ToDoAppCubit.get(context);
    return Container(
        width: 411,
        height: 200,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Color(0xff4A3780),
        ),
        child: Stack(
          children: [
             const Positioned(
              top:50,
                left: 25,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_back_ios_new_outlined,color: Color(0xff4A3780)),

            )),
             Center(
               child: Column(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   MyText(size: 18, color: Colors.white, isBold: false, text: formattedDate),
                   const SizedBox(height: 40,),
                   MyText(size: 30, color: Colors.white, isBold: true, text:'My Todo List' )
                 ],
               ),
             ),
            Positioned(
                top : -10,
                right: -60,
                child: Container(
                  height: 150, width: 150,
                  decoration:  BoxDecoration(
                    border: Border.all(width: 35,color: Colors.white10),
                    shape: BoxShape.circle ,color: Colors.transparent,
                  ),
                )),
            Positioned(
                top : 70,
                left: -70,
                child: Container(
                  height: 250, width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 35,color: Colors.white10),
                    shape: BoxShape.circle ,color: Colors.transparent,
                  ),
                )),
          ],
        ));
  },
);
  }
}
