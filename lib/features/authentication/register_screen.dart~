
import 'package:chat_app/features/authentication/register_screen.dart';
import 'package:chat_app/features/authentication/widget/custom_text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/register_cubit/register_cubit.dart';
import '../../cubits/register_cubit/register_state.dart';
import 'login_screen.dart';

class Register extends StatelessWidget {
  Register({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(


        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Registration successful"),
              ),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => login(),
              ),
            );
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "REGISTER",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("Register now to browse out hot offers"),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (!emailValid) {
                              return "Please enter a valid email";
                            }
                          },
                          controller: emailController,
                          prefixIcon: Icon(
                            Icons.email,),
                          labelText: "Email",
                          hintText: "Email",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Field cannot be empty";
                            }
                            if (value.length < 6) {
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
                        SizedBox(
                          height: 15,
                        ),
                        state is RegisterLoading?Center(child: CircularProgressIndicator()):SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .register(emailController.text,
                                      passwordController.text);
                                }
                              },

                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("already have new account !"),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),

          );
        });
  }
}
