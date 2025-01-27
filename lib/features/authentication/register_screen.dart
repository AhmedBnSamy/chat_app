import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'widget/custom_text_filed.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "LOGIN",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Register now to browser out hot offers",
                style: TextStyle(
                    color: Color(0xff9c9c9c),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Field cannot be empty";
                  }
                  final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                  if(!emailValid){
                    return "Please enter a valid email";
                  }
                },
                controller: emailController,
                prefixIcon: Icon(
                  Icons.email,),
                labelText: "Email",
                hintText: "Email",
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                validator: (value){
                  if(value!.isEmpty){
                    return "Field cannot be empty";
                  }
                  if(value.length<6){
                    return "Password must be at least 6 characters";
                  }
                },
                controller: passwordController,
                prefixIcon: Icon(
                    Icons.lock
                ),
                labelText: "Password",
                hintText: "Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF168ff8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Do you have an account? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Color(0xFF4591cb)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
