import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../app_database/app_fireStore.dart';
import '../presention/auth_screen/login_screen.dart';
import '../user_authservice/auth_service.dart';
class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  Rx<bool> isLoading = false.obs;

  void signUp({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password
  })async{
    isLoading.value = true;
    User? user = await AppAuthService.signUpUserToApp(email, password);
    if(user != null){
      isLoading.value = false;
      Get.snackbar("Success", "You have been sign in successfully");
      Get.offAll(()=> LoginScreen());
      //Adding user to Firestore
      AppFirestore.addUserToDB(
          userID: AppFirestore.getCurrentUserID,
          email: email,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phone);
    } else{
      isLoading.value = false;
      Get.snackbar("Sign Up Failed", "Unable toc create an account");
    }
  }
}