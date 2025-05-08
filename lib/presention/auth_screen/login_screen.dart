import 'package:ecom_project/presention/auth_screen/signup_screen.dart';
import 'package:ecom_project/presention/auth_screen/widget/AuthTextInput.dart';
import 'package:ecom_project/presention/auth_screen/widget/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:ecom_project/presention/auth_screen/widget/AuthHeader.dart';
import 'package:get/get.dart';
import 'package:ecom_project/controllers/Login_Controller.dart';
import 'package:ecom_project/style/style.dart';
import 'package:ecom_project/presention/auth_screen/widget/auth_social.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginScreenController=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const AuthHeader(title: "Sign In", subTitle: "Welcome back!"),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: loginScreenController.formKey, // Assign the form key here
                      child: Column(
                        children: [
                          AuthTextInput(
                            controller: loginScreenController.emailController,
                            hintText: 'Enter Email',
                            prefixIcon: Icons.email,
                            labelText: "Email Address",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AuthTextInput(
                            controller: loginScreenController.passwordController,
                            hintText: 'Enter Password',
                            isPassword: true,
                            prefixIcon: Icons.lock,
                            labelText: "Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: secondary_Color,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: AuthButton(
                              onPressed: () {
                                if(loginScreenController.formKey.currentState!.validate()){
                                  loginScreenController.loginUser(email:loginScreenController.emailController.text, password: loginScreenController.passwordController.text);
                                }
                              },
                              title: "Sign In",
                            ),
                          ),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Divider(color: Colors.grey),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Or',
                                style: TextStyle(
                                  color: primary_color,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: Divider(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SocialAuthBtn(
                                imagePath: 'assets/images/icons/google.png',
                                label: 'Google',
                              ),
                              SocialAuthBtn(
                                imagePath: 'assets/images/icons/fb.png',
                                label: 'Facebook',
                              ),
                            ],
                          ),
                          const SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(color: primary_color),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(SignupScreen());
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: secondary_Color,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(
                () => Visibility(
                visible: loginScreenController.isLoading.value,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(primary_color),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
