import 'package:flutter/material.dart';
import 'package:friends_chat/services/auth_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../screens/authentication.dart';
import '../screens/home.dart';

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AuthService.to.userIsAuthenticated.value ? Home() : AutenticacaoPage());
  }
}
