import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/button/button.dart';
import 'package:my_calculator/controler/calculator%20controller.dart';
import 'package:my_calculator/scitific/scientific_cal.dart';
import 'package:my_calculator/utils/colors.dart';

import '../controler/theme controler.dart';
class main_screen extends StatelessWidget{
  main_screen ({Key? key}): super(key: key);

  final List<String> buttons =[
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "=",
    "icon",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CalculateController>();
    var themecontroller = Get.find<ThemeController>();
    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: themecontroller.isDark
            ? DarkColors.scaffoldBgColor
            : LightColors.scaffoldBgColor,
        body: Column(
          children: [
            GetBuilder<CalculateController>(builder: (context) {
              return outPutSection(themecontroller, controller);
            }),
            inPutSection(themecontroller, controller),
          ],
        ),
      );
    });
  }
  Expanded inPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: themeController.isDark
                  ? DarkColors.sheetBgColor
                  : LightColors.sheetBgColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GridView.builder(

              physics: const NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (contex, index) {
                switch (index) {

                /// CLEAR BTN
                  case 0:
                    return CustomButton(
                        buttonTapped: () {
                          controller.clearInputAndOutput();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index]);

                /// DELETE BTN
                  case 1:
                    return CustomButton(
                        buttonTapped: () {
                          controller.deleteBtnAction();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index]);

                /// EQUAL BTN
                  case 18:
                    return CustomButton(
                        buttonTapped: () {
                          controller.equalPressed();
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: themeController.isDark
                            ? DarkColors.leftOperatorColor
                            : LightColors.leftOperatorColor,
                        text: buttons[index]);
                  // case 19:
                  //   return CustomButton(
                  //       buttonTapped: () {
                  //         Navigator.push(
                  //           context as BuildContext,
                  //           MaterialPageRoute(builder: (context) => const scientific_cal()),
                  //         );
                  //       },
                  //       color: themeController.isDark
                  //           ? DarkColors.btnBgColor
                  //           : LightColors.btnBgColor,
                  //       textColor: themeController.isDark
                  //           ? DarkColors.leftOperatorColor
                  //           : LightColors.leftOperatorColor,
                  //       text: buttons[index]);
                  case 19:
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context as BuildContext,
                          MaterialPageRoute(
                            builder: (context) => ScientificCal(context: context),
                          ),
                        );
                      },
                      child: Text("Navigate to ScientificCal"),
                    );

                  default:
                    return CustomButton(
                        buttonTapped: () {
                          controller.onBtnTapped(buttons, index);
                        },
                        color: themeController.isDark
                            ? DarkColors.btnBgColor
                            : LightColors.btnBgColor,
                        textColor: isOperator(buttons[index])
                            ? LightColors.operatorColor
                            : themeController.isDark
                            ? Colors.white
                            : Colors.black,
                        text: buttons[index]);
                }
              }
              ),
        )
    );
  }

  /// Out put Section - Show Result
  Expanded outPutSection(
      ThemeController themeController, CalculateController controller) {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: 100,
              height: 45,
              decoration: BoxDecoration(
                  color: themeController.isDark
                      ? DarkColors.sheetBgColor
                      : LightColors.sheetBgColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        themeController.lightTheme();
                      },
                      child: Icon(
                        Icons.light_mode_outlined,
                        color: themeController.isDark ? Colors.grey : Colors.black,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        themeController.darkTheme();
                      },
                      child: Icon(
                        Icons.dark_mode_outlined,
                        color: themeController.isDark ? Colors.white : Colors.grey,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 70),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.userInput,
                      style: TextStyle(
                          color:
                          themeController.isDark ? Colors.white : Colors.black,
                          fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(controller.userOutput,
                        style: TextStyle(
                            color: themeController.isDark
                                ? Colors.white
                                : Colors.black,
                            fontSize: 32)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  ///
  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }
}
