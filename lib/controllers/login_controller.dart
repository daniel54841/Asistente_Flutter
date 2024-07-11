import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reproductor_ia/net/login_firebase.dart';
import 'package:reproductor_ia/utils/constants/general_constants.dart';
import 'package:reproductor_ia/widgets/dialogs/error_custom_dialog.dart';

class LoginController extends GetxController {
  ///variables
  bool isRepeat = true;
  late BuildContext context;
  final LoginFirebase _operations = LoginFirebase();

  ///fin variables

  void updateLogo(bool value) {
    isRepeat = value;
    update();
  }

  ///Inicializacion de operaciones que corresponden con firebase(Auth)

  ///TODO: Poner loading al iniciar sesion

  Future<void> signInWithEmailAndPassword(String user, String password) async {
    try {
      bool userOk = await _checkUser(user) == "ok";
      bool passOk = await _checkPassword(password) == "ok";
      if (userOk && passOk) {
        /*   await LoadingCustomDialog.loadingDialog();*/
        String? result = await _operations.login(user, password);
        if (result != null) {
          if (result == "Success") {
            Get.back();
            Get.offAndToNamed("home");
          }
        }
      } else {
        await ErrorCustomDialog.errorDialog(GeneralConstants.empty_value);
      }
    } catch (e) {
      debugPrint("Exception in signInWithEmailAndPassword: $e");
    }
  }

  Future<String> _checkUser(String user) async {
    if (user.isNotEmpty) {
      if (user.isEmail) {
        return "ok";
      } else {
        //no valiod
        await ErrorCustomDialog.errorDialog(GeneralConstants.email_wrong);

        return "";
      }
    } else {
      //vacio
      await ErrorCustomDialog.errorDialog(GeneralConstants.empty_value);
      return "";
    }
  }

  Future<String> _checkPassword(String password) async {
    if (password.isNotEmpty) {
      if (password.length > 1 && password.length < 10) {
        return "ok";
      } else {
        await ErrorCustomDialog.errorDialog(GeneralConstants.password_wrong);

        return "";
      }
    } else {
      //vacio
      await ErrorCustomDialog.errorDialog(GeneralConstants.empty_value);

      return "";
    }
  }
}
