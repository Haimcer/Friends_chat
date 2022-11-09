import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friends_chat/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:friends_chat/config.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'widgets/checkauth.dart';
import 'package:friends_chat/provider/theme_provider.dart';

void main() async {
  await initConfigurations();

  runApp(
    MeuAplicativo(),
  );
}

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return GetMaterialApp(
          title: 'Friends Chat',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: Mythemes.lightTheme,
          darkTheme: Mythemes.darkTheme,
          home: CheckAuth(),
        );
      });
}
