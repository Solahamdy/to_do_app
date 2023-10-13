import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/to_do_bloc/to_do_app_cubit.dart';
import 'package:to_do_app/components/list_tile.dart';
import 'package:to_do_app/components/my_text.dart';
import 'package:to_do_app/components/purple_container.dart';
import 'package:to_do_app/screens/Add_task.dart';
import 'package:to_do_app/service/shared_prefrence_helper.dart';

import '../core/size_config.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoAppCubit, ToDoAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ToDoAppCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xfff1f5f9),
          body: Stack(
            children: [
              const PurpleContainerAppBarr(),
             Stack(
                children: [
              Positioned(
                 top: 170,
                 left: 20,
                 child: Container(
                   width: 320,
                   height: 300,
                   decoration: BoxDecoration(
                       border: Border.all(color: Colors.white10),
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20)),
                   child: ListView.separated(
                     separatorBuilder:(BuildContext context, int index) => const Divider(),
                     itemCount: cubit.tasks.length,
                     itemBuilder: (BuildContext context, int index) {
                       return  ListTileExample(
                         imagePath: cubit.tasks[index].imagePath,
                         title: cubit.tasks[index].title,
                         subtitle: cubit.tasks[index].subtitle,
                         completed: cubit.tasks[index].completed,
                         func:(){ cubit.changeTasksCheckBox(index);},


                       );
                     },

                       )),
              )],
             ),
               Positioned(
                  bottom: 230,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MyText(isBold: true,color: Colors.black,size: 20,text: 'Completed',)
                  )),
              Positioned(
                  bottom: 90,
                  left: 20,
                  child: Container(
                    width: 320,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white10),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemCount: cubit.done.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  ListTileExample(
                            imagePath: cubit.done[index].imagePath,
                            title: cubit.done[index].title,
                            subtitle: cubit.done[index].subtitle,
                             completed:cubit.done[index].completed ,
                             func: (){ cubit.changeDoneCheckBox(index);},
                        );
                      },
                    ),
                  )),
              Positioned(
                bottom: 10,
                left: 20,
                child:Container(
                width: SizeConfig.screenWidth! * 0.9,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFF4A3780)
                ),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AddNewTaskScreen()),
                            (route) => false);
                  },
                  child: MyText(color: Colors.white,size: 20,isBold: true ,text: 'Add New task'),
                ),
              ),)
            ],
          ),
        );
      },
    );
  }
}
