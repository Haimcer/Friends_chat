import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:friends_chat/controllers/authentication_controller.dart';

import '../widgets/change_theme_button.dart';

class AutenticacaoPage extends StatelessWidget {
  final controller = Get.put(AutenticacaoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/LOGO.png',
          width: 150,
          height: 150,
        ),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 18, 16, 0),
                        child: Obx(() => Text(
                              controller.titulo.value,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w900),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10, left: 30, right: 30, top: 5),
                        child: TextFormField(
                          controller: controller.email,
                          cursorColor: Theme.of(context).primaryColorLight,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColorLight),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe o email corretamente!';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10, left: 30, right: 30, top: 5),
                        child: TextFormField(
                          controller: controller.senha,
                          obscureText: true,
                          cursorColor: Theme.of(context).primaryColorLight,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColorLight),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informa sua senha!';
                            } else if (value.length < 6) {
                              return 'Sua senha deve ter no mínimo 6 caracteres';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColorLight)),
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.isLogin.value) {
                                controller.login();
                              } else {
                                controller.registrar();
                              }
                            }
                          },
                          child: Container(
                            width: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Obx(() => Text(
                                      controller.botaoPrincipal.value,
                                      style: TextStyle(fontSize: 20))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.AppBarDescription.value,
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextButton(
                            child: Obx(() => Text(
                                  controller.appBarButton.value,
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                )),
                            onPressed: controller.toogleRegistrar,
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).primaryColorLight),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).primaryColorLight,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(border: Border.all()),
                          width: 270,
                          height: 50,
                          padding: EdgeInsets.fromLTRB(18, 18, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                  //decoration: BoxDecoration(color: Colors.blue),
                                  child: Image.network(
                                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                                      fit: BoxFit.cover)),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Continuar com Google',
                                style: TextStyle(
                                  fontFamily: 'roboto',
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
