import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:reproductor_ia/utils/constants/general_constants.dart';

import '../widgets/dialogs/error_custom_dialog.dart';

/**
 * Clase que servirá para definir
 * los metodos para controlar el login de firebase
 * */

class LoginFirebase {
  Future<String?> login(String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await ErrorCustomDialog.errorDialog(GeneralConstants.email_not_found);
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        await ErrorCustomDialog.errorDialog(GeneralConstants.wrong_password);
        return 'Wrong password provided for that user.';
      } else if (e.code == "user-disabled") {
        await ErrorCustomDialog.errorDialog(GeneralConstants.user_disabled);
        return "The given email has been disabled";
      }
      {
        await ErrorCustomDialog.errorDialog(GeneralConstants.generic_error);
        return e.message;
      }
    } catch (e) {
      debugPrint("Exception in login-LoginFirebase: ${e.toString()}");
      await ErrorCustomDialog.errorDialog(GeneralConstants.generic_error);
    }
  }
}
