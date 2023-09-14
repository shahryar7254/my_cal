import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_calculator/my%20buildings/buil.dart';
import 'package:my_calculator/screen/main%20_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})  : super( key: key);
  @override
  Widget build(BuildContext context){
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
  title: "My calculator",
    home: main_screen(),
      );
  }
}

