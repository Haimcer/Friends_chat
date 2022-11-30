import 'package:flutter/material.dart';
import 'package:friends_chat/main.dart';
import 'package:friends_chat/screens/authentication.dart';
import 'package:get/get.dart';

final controller = Get.put(MeuAplicativo());
var isDark = false.obs;
var isOn =
    controller.brightness.value == Brightness.dark ? true : isDark.value.obs;

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

class Changetheme extends GetxController {
  var ThemeBar =
      isOn == false ? Themelight().ThemeBarlight : Themedark().ThemeBardark;
  var ThemeBottom = isOn == false
      ? Themelight().ThemeBottomlight
      : Themedark().ThemeBottomdark;
  var ThemeIcons =
      isOn == false ? Themelight().ThemeIconslight : Themedark().ThemeIconsdark;
  var Themeprimarycolor = isOn == false
      ? Themelight().Themeprimarycolorlight
      : Themedark().Themeprimarycolordark;
  var Themrsecundarycolor = isOn == false
      ? Themelight().Themrsecundarycolorlight
      : Themedark().Themrsecundarycolordark;
  var Icon = isOn == false ? Themelight().Iconlight : Themedark().Icondark;

  toogleRegistrar() {
    isDark.value = true;
  }
}
