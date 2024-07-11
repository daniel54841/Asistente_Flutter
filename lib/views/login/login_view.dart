import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:reproductor_ia/utils/assets_route.dart';

import '../../controllers/login_controller.dart';
import '../../utils/responsive.dart';
import '../../widgets/TextFormFields/custom_text_form_fields.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;
  final _unfocusNode = FocusNode();
  final LoginController _loginCtrl = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    _loginCtrl.context = context;
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xB2B60F22),
                      Color(0xF3A028B2),
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(
                      1,
                      -0.34,
                    ),
                    end: AlignmentDirectional(
                      -1,
                      0.34,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                    0,
                    responsive.dp(15), //200
                    0,
                    0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: responsive.dp(60), //500
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          responsive.dp(2),
                          responsive.dp(2),
                          responsive.dp(2),
                          responsive.dp(2)), //25 en todas
                      child: Container(
                        width: responsive.dp(30), //100
                        height: responsive.dp(30),
                        decoration: BoxDecoration(
                          color: const Color(0xA5B55B67),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              responsive.hp(2.1), 0, responsive.hp(2.1), 0), //5
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GetBuilder(
                                  builder: (LoginController ctrl) {
                                    //'https://assets8.lottiefiles.com/packages/lf20_li0pgakp.json'
                                    return Lottie.asset(
                                      AssetsRoute.animationPath(
                                          "Jarvis_Animation"),
                                      width: responsive.wp(35), //150
                                      height: responsive.hp(22), //130
                                      fit: BoxFit.cover,
                                      repeat: ctrl.isRepeat,
                                      animate: true,
                                    );
                                  },
                                ),
                                //TextFormField del correo
                                CustomTextFormFields(
                                  ctrl: emailAddressController!,
                                  icon: Icons.email_outlined,
                                  titleLabel: "E-mail",
                                  loginCtrl: _loginCtrl,
                                ),
                                //TextFormField de la contraseña
                                CustomTextFormFields(
                                  ctrl: passwordController!,
                                  icon: Icons.lock_outline,
                                  titleLabel: "Password",
                                  loginCtrl: _loginCtrl,
                                ),
                                //Boton de login
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await _loginCtrl
                                          .signInWithEmailAndPassword(
                                              emailAddressController!.text,
                                              passwordController!.text);
                                    },
                                    child: Container(
                                      width: responsive.wp(50), //200
                                      height: responsive.dp(4), //55
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xAE4B39EF),
                                            Colors.lightBlueAccent,
                                          ],
                                          stops: [
                                            0,
                                            1,
                                          ],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, -1),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Acceso",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
