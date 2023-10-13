import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_screen.dart';
import '../core/size_config.dart';
import '../service/shared_prefrence_helper.dart';

class ToDoSplashScreen extends StatefulWidget {
  const ToDoSplashScreen({super.key});

  @override
  State<ToDoSplashScreen> createState() => _ToDoSplashScreenState();
}

class _ToDoSplashScreenState extends State<ToDoSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF4A3780), Color(0xffada0d7)])),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 150,
                      left: 40,
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
                      top: 180,
                      right: 50,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 35, color: Colors.white10),
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      )),
                  Positioned(
                      bottom: 110,
                      right: -50,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 35, color: Colors.white10),
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      )),
                  const Center(
                    child: Text(' Daily To-Do List',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Caveat',
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
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
                  const Positioned(
                      bottom: 10,
                      right: 50,
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'Caveat'),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
