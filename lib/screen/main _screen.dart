import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/button/button.dart';
import 'package:my_calculator/utils/colors.dart';

import '../controler/theme_controller.dart';
import '../scitific/scientific_cal.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<String> buttons = [
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
    var themeController = Get.find<ThemeController>();
    return GetBuilder<ThemeController>(builder: (context) {
      return Scaffold(
        backgroundColor: themeController.isDark
            ? DarkColors.scaffoldBgColor
            : LightColors.scaffoldBgColor,
        body: Column(
          children: [
            GetBuilder<CalculateController>(builder: (context) {
              return outPutSection(themeController, controller);
            }),
            inPutSection(themeController, controller, context),
          ],
        ),
      );
    });
  }

  Expanded inPutSection(
      ThemeController themeController, CalculateController controller, BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: themeController.isDark
              ? DarkColors.sheetBgColor
              : LightColors.sheetBgColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buttons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2),
          ),
          itemBuilder: (context, index) {
            switch (index) {
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
                  text: buttons[index],
                );
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
                  text: buttons[index],
                );
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
                  text: buttons[index],
                );
              case 19:
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScientificCal(),
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
                  text: buttons[index],
                );
            }
          },
        ),
      ),
    );
  }

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
              borderRadius: BorderRadius.circular(20),
            ),
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
                      color: themeController.isDark ? Colors.white : Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    controller.userOutput,
                    style: TextStyle(
                      color: themeController.isDark ? Colors.white : Colors.black,
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String y) {
    if (y == "%" || y == "/" || y == "x" || y == "-" || y == "+" || y == "=") {
      return true;
    }
    return false;
  }
}
