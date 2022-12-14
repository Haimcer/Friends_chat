import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:friends_chat/services/auth_service.dart';
import 'package:get/get.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase
  await Firebase.initializeApp();
  // Para executar o Firebase no Emulador Local do Firebase descomentar a seguir
  // FirebaseFirestore.instance.settings =
  //   Settings(host: 'localhost:8080', sslEnabled: false);

  // GetX Bindings
  Get.lazyPut<AuthService>(() => AuthService());
}
