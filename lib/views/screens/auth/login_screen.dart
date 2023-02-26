import 'package:flutter/material.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/screens/auth/signup_screen.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';
import 'package:tiktok_clone_flutter/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Tiktok Clone",
                fontSize: 35.0,
                color: buttonColor,
                fontWeight: FontWeight.w900,
              ),
              const CustomText(
                text: "Login",
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  labelText: "Email",
                  icon: Icons.email,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _passwordController,
                  labelText: "Password",
                  icon: Icons.lock,
                  isObscure: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: InkWell(
                  onTap: () {},
                  child: const Center(
                    child: CustomText(
                      text: "Login",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Don't have an account? ",
                    fontSize: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      var route = MaterialPageRoute(builder: (context) {
                        return SignupScreen();
                      });
                      Navigator.push(context, route);
                    },
                    child: CustomText(
                      text: "Register",
                      fontSize: 20.0,
                      color: buttonColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
