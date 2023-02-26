import 'package:flutter/material.dart';
import 'package:tiktok_clone_flutter/utils/constants.dart';
import 'package:tiktok_clone_flutter/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone_flutter/views/widgets/custom_text.dart';
import 'package:tiktok_clone_flutter/views/widgets/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
                text: "Register",
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      "https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png",
                    ),
                    backgroundColor: Colors.black,
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.photo),
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _usernameController,
                  labelText: "Username",
                  icon: Icons.person,
                ),
              ),
              const SizedBox(
                height: 15,
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
                height: 15,
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
                      text: "Register",
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
                    text: "Already have an account? ",
                    fontSize: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      var route = MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      });
                      Navigator.push(context, route);
                    },
                    child: CustomText(
                      text: "Login",
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
