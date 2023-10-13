import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/blocs/to_do_bloc/to_do_app_cubit.dart';
import 'package:to_do_app/screens/Add_task.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/screens/splash_screen.dart';
class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=> ToDoAppCubit())
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        home: const ToDoSplashScreen(),),
    );
  }
}
