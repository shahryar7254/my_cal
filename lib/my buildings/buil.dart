import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import '../controler/calculator controller.dart';
import '../controler/theme controler.dart';


class MyBindings implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => CalculateController());
    Get.lazyPut(()=> ThemeController());

  }

}