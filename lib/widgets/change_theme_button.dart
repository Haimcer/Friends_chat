import 'package:flutter/material.dart';
import 'package:friends_chat/models/themes.dart';
import 'package:friends_chat/provider/theme_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PreferenciaTema {
  var tema = WidgetsBinding.instance.platformDispatcher.platformBrightness.obs;
}
