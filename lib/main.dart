import 'package:flutter/material.dart';
import 'package:to_do_app/service/shared_prefrence_helper.dart';
import 'package:to_do_app/src/app_root.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init();
runApp(const AppRoot());
}