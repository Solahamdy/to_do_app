import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/to_do_model.dart';

import '../../service/shared_prefrence_helper.dart';

part 'to_do_app_state.dart';

class ToDoAppCubit extends Cubit<ToDoAppState> {
  ToDoAppCubit() : super(ToDoAppInitial());
  static ToDoAppCubit get(context)=> BlocProvider.of(context);

  var formKey=GlobalKey<FormState>();
  List<ToDoModel> tasks = [
    ToDoModel(imagePath: 'assets/list.png',
        title: 'Study Lesson',
      completed: false
        ),
    ToDoModel(
      imagePath: 'assets/cup.png',
      title: 'Run 5k',
      subtitle: '4:00pm',
      completed: false

    ),
    ToDoModel(
      imagePath: 'assets/calender.png',
      title: 'Go to party',
      subtitle: '10:00pm',
      completed: false
    )
  ];
  void changeTasksCheckBox(index) {
     tasks[index].completed =! tasks[index].completed;
     done.add(tasks[index]);
     tasks.removeAt(index);
      emit(ChangeCheckBoxState());
    }
  void changeDoneCheckBox(index) {
    done[index].completed =! done[index].completed;
    tasks.add(done[index]);
    done.removeAt(index);
    emit(ChangeCheckBoxState());
  }


  var titleController=TextEditingController();
  var dateController=TextEditingController();
  var timeController=TextEditingController();
  var notesController=TextEditingController();

String image ='';
String selectedCategory = '';
bool selected = false ;
  void listSelected() {
    selectedCategory = 'list';
    selected = true;
    image = 'assets/list.png';
    emit(ListSelectedState());
  }

  void cupSelected() {
    selectedCategory = 'cup';
    image = 'assets/cup.png';
    selected = true;
    emit(CupSelectedState());
  }

  void calenderSelected() {
    selectedCategory = 'calender';
    image = 'assets/calender.png';
    selected = true;
    emit( CalenderSelectedState());
  }

  void addTask({
    required ToDoModel task}){
    tasks.add(task);

    emit(AddTaskSuccessState());
  }

  void clearAllData(){
    titleController.text='';
    dateController.text='';
    timeController.text='';
    notesController.text = '';
    emit(ClearAllDataSuccessState());
  }



  List<ToDoModel> done=[
    ToDoModel(imagePath: 'assets/list.png',
      title: 'Game meetup',
      subtitle: '1:00 pm',
      completed: true
      ),
    ToDoModel(imagePath: 'assets/cup.png',
        title: 'Take out of trash',
        completed: true
    ),
  ];
  void addDoneTask(index){
    done.add(tasks[index]);
    tasks.removeAt(index);
    emit(AddDoneTaskSuccessState());
  }

  }


