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
        toolbarHeight: 30,
        elevation: 0,
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/LOGO.png',
                            width: 150,
                            height: 150,
                          ),
                        ),
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                              width: 130,
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  )),
                              onPressed: controller.toogleRegistrar,
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
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
                          padding: EdgeInsets.all(8),
                        ),
                        Stack(
                          fit: StackFit.passthrough,
                          children: <Widget>[
                            GestureDetector(
                              onDoubleTap: () {},
                              child: Container(
                                height: 50,
                                width: 230,
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 2.0,
                                        offset: Offset(0.0, 0.75))
                                  ],
                                  color: Theme.of(context).buttonColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        child: Image.asset(
                                            'assets/images/google.png'),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text('Continuar com Google',
                                          style: TextStyle(
                                              fontFamily: 'roboto',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            /*TextButton.icon(
                              onPressed: () {},
                              icon: Image.asset('assets/images/google.png'),
                              label: Text(
                                'Continuar com Google',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[900],
                                  fontSize: 16,
                                ),
                              ),
                            )*/
                          ],
                        ),
                        /*SizedBox(
                          width: 270,
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    height: 54,
                                    width: 54,
                                    child: Image.asset(
                                      'assets/images/google.png',
                                      fit: BoxFit.cover,
                                    )),
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
                        )*/
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
