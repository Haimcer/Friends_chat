import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:friends_chat/models/themes.dart';
import 'package:friends_chat/provider/google_sign_in_client.dart';
import 'package:friends_chat/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:friends_chat/config.dart';
import 'package:friends_chat/widgets/change_theme_button.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'widgets/checkauth.dart';

void main() async {
  await initConfigurations();

  runApp(
    MeuAplicativo(),
  );
}

class MeuAplicativo extends StatelessWidget {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness.obs;
  /*Future _iniciaTheme() async {
  var brightness = SchedulerBinding.instance.window.platformBrightness;

  setState(() {
    _changetheme.currentThemeMode =
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    _changetheme.setThemeColors();
  });
}*/

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Friends Chat',
        debugShowCheckedModeBanner: false,
        home: CheckAuth(),
      );
}
