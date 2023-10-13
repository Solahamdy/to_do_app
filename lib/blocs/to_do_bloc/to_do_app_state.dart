part of 'to_do_app_cubit.dart';

@immutable
abstract class ToDoAppState {}

class ToDoAppInitial extends ToDoAppState {}
class ChangeCheckBoxState extends ToDoAppState {}
class AddTaskSuccessState extends ToDoAppState {}
class ClearAllDataSuccessState extends ToDoAppState {}
class AddDoneTaskSuccessState extends ToDoAppState {}
class ListSelectedState extends ToDoAppState {}
class CupSelectedState extends ToDoAppState {}
class CalenderSelectedState extends ToDoAppState {}
