import 'dart:io';

import 'package:get/get.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';

class AuthController extends GetxController {
  // register

  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
