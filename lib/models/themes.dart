import 'package:flutter/material.dart';
import 'package:friends_chat/main.dart';
import 'package:friends_chat/screens/authentication.dart';
import 'package:get/get.dart';

final controller = Get.put(MeuAplicativo());

var isOn = controller.brightness.value == Brightness.dark
    ? Themedark()
    : Themelight().obs;

class Themelight extends GetxController {
  var ThemeBarlight = Colors.white.obs;
  var ThemeBottomlight = Colors.orange.obs;
  var ThemeIconslight = Colors.orange.obs;
  var Themeprimarycolorlight = Colors.white.obs;
  var Themrsecundarycolorlight = Colors.orange.obs;
  var Iconlight = Icon(Icons.brightness_2_outlined);
}

class Themedark extends GetxController {
  var ThemeBardark = Colors.grey.shade900.obs;
  var ThemeBottomdark = Colors.orange.obs;
  var ThemeIconsdark = Colors.orange.obs;
  var Themeprimarycolordark = Colors.white.obs;
  var Themrsecundarycolordark = Colors.orange.obs;
  var Icondark = Icon(Icons.brightness_7_outlined);
}

class Changetheme {
  var ThemeBar = isOn == Themelight()
      ? Themelight().ThemeBarlight
      : Themedark().ThemeBardark;
  var ThemeBottom = isOn == Themelight()
      ? Themelight().ThemeBottomlight
      : Themedark().ThemeBottomdark;
  var ThemeIcons = isOn == Themelight()
      ? Themelight().ThemeIconslight
      : Themedark().ThemeIconsdark;
  var Themeprimarycolor = isOn == Themelight()
      ? Themelight().Themeprimarycolorlight
      : Themedark().Themeprimarycolordark;
  var Themrsecundarycolor = isOn == Themelight()
      ? Themelight().Themrsecundarycolorlight
      : Themedark().Themrsecundarycolordark;
  var Icon =
      isOn == Themelight() ? Themelight().Iconlight : Themedark().Icondark;
}
