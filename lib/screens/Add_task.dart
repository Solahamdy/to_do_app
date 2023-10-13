import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/to_do_bloc/to_do_app_cubit.dart';
import 'package:to_do_app/models/to_do_model.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/service/shared_prefrence_helper.dart';
import '../components/add_new_task_text_field.dart';
import '../components/category_icon.dart';
import '../components/my_text.dart';
import '../core/size_config.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Color(0xff4A3780),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 25,
                        left: 25,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                    (route) => false);
                              },
                              child: const ImageIcon(
                                  AssetImage('assets/Close X.png'),
                                  color: Colors.black)),
                        )),
                     Center(
                      child: MyText(
                        text: 'Add New Task',
                        size: 30,color: Colors.white,isBold: true,
                      ),
                    ),
                    Positioned(
                        top: -10,
                        right: -60,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 35, color: Colors.white10),
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                        )),
                    Positioned(
                        top: 70,
                        left: -70,
                        child: Container(
                          height: 250,
                          width: 200,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 35, color: Colors.white10),
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                        )),
                  ],
                ))),
        body: BlocConsumer<ToDoAppCubit, ToDoAppState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = ToDoAppCubit.get(context);
            return Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      MyText(
                          size: 20,
                          color: Colors.black,
                          isBold: true,
                          text: 'Task Title'),
                      const SizedBox(
                        height: 10,
                      ),
                      AddNewTask(
                          text: 'Task Title',
                          controller: cubit.titleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          MyText(
                              size: 20,
                              color: Colors.black,
                              isBold: true,
                              text: 'Category'),
                          const SizedBox(
                            width: 15,
                          ),
                          CategoryIcon(
                            fun: (){
                              cubit.listSelected();
                              cubit.image= 'assets/list.png';
                            },
                            border:Border.all(color:cubit.selectedCategory == 'list'
                                ? const Color(0xff4a3780)
                                : Colors.white,),
                            image: 'assets/list.png',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CategoryIcon(
                            fun: (){
                              cubit.cupSelected();
                            },
                            border:Border.all(color:cubit.selectedCategory == 'cup'
                                ? const Color(0xff4a3780)
                                : Colors.white,),
                            image: 'assets/cup.png',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CategoryIcon(
                            fun: (){
                              cubit.calenderSelected();
                              },
                            border: Border.all(color:cubit.selectedCategory == 'calender'
                                ? const Color(0xff4a3780)
                                : Colors.white,),
                            image: 'assets/calender.png',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                    size: 20,
                                    color: Colors.black,
                                    isBold: true,
                                    text: 'Date'),
                                const SizedBox(
                                  height: 10,
                                ),
                                Theme(
                                  data: ThemeData.light().copyWith(
                                    colorScheme:
                                        const ColorScheme.light().copyWith(
                                      primary: const Color(
                                          0xff4a3780), // Set your desired color here
                                    ),
                                  ),
                                  child: AddNewTask(
                                      text: 'Date',
                                      icon: const Icon(Icons.date_range,
                                          color: Color(0xff4a3780)),
                                      controller: cubit.dateController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Field must not be empty';
                                        }
                                        return null;
                                      },
                                      onTap: () async {
                                        final value = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2050),
                                          builder: (context, child) {
                                            return Theme(
                                              data: Theme.of(context).copyWith(
                                                colorScheme: const ColorScheme.light(
                                                  primary: Color(0xff4a3780),
                                                  onPrimary: Colors.blueAccent,
                                                  onSurface: Colors.black,
                                                ),
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );
                                        if (value != null) {
                                          cubit.dateController.text =
                                              "${value.year}-${value.month}-${value.day}";
                                        }
                                      }),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 165,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                    size: 20,
                                    color: Colors.black,
                                    isBold: true,
                                    text: 'Time'),
                                const SizedBox(
                                  height: 10,
                                ),
                                AddNewTask(
                                  text: 'Time',
                                  icon: const Icon(Icons.alarm,
                                      color: Color(0xff4a3780)),
                                  controller: cubit.timeController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field must not be empty';
                                    }
                                    return null;
                                  },
                                  onTap: () async {
                                    final value = await showTimePicker(
                                        context: context,
                                        initialTime: const TimeOfDay(
                                            hour: 12, minute: 00),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            timePickerTheme: const TimePickerThemeData(
                                              hourMinuteTextColor:  Color(0xff4a3780),
                                              dayPeriodTextColor: Color(0xff4a3780),
                                              dialHandColor: Color(0xff4a3780),
                                              entryModeIconColor:Color(0xff4a3780),
                                            )
                                          ), child: child!,
                                        );
                                      },
                                    );
                                    if (value != null) {
                                      cubit.timeController.text =
                                          "${value.hour}:${value.minute}";
                                    }
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyText(
                          size: 20,
                          color: Colors.black,
                          isBold: true,
                          text: 'Notes'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field must not be empty';
                            }
                            return null;
                          },
                          controller: cubit.notesController,
                          enabled: true,
                          decoration: const InputDecoration(
                            hintText: 'Notes',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20,),
                            border: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xFF4A3780)),
                        child: MaterialButton(
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.addTask(
                                  task: ToDoModel(
                                      title: cubit.titleController.text,
                                      subtitle: cubit.notesController.text == ''
                                          ? 'date: ${cubit.dateController.text} , Time: ${cubit.timeController.text}'
                                          : ' ${cubit.notesController.text} , date ${cubit.dateController.text} , Time ${cubit.timeController.text}',
                                      completed: false,
                                      imagePath: cubit.image));

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                  (route) => false);
                              cubit.clearAllData();
                            }
                          },
                          child: MyText(
                              color: Colors.white,
                              size: 20,
                              isBold: true,
                              text: 'save'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
