import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_happy/view/screens/homePage.dart';
import 'package:make_happy/view/screens/loginScreen.dart';
import 'package:make_happy/view/utility/styles.dart';
import 'package:make_happy/view/utility/validator.dart';
import 'package:make_happy/view/widgets/customTextFormField.dart';
import 'package:make_happy/view/widgets/gradientElavatedButton.dart';

import '../utility/mediaQuery.dart';
import '../utility/fireAuth.dart';

class regScreen extends StatefulWidget {
  const regScreen({super.key});

  @override
  State<regScreen> createState() => _regScreenState();
}

class _regScreenState extends State<regScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/nathan-dumlao-k-oS0iKn0Qg-unsplash.jpg",
                height: MediaQueryHelper.screenHeight,
                width: MediaQueryHelper.screenWidth,
                fit: BoxFit.fill,
              ),
              Form(
                key: _registerFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQueryHelper.screenHeight! * 0.2,
                    ),
                    CustomTextFormField(
                      labelText: 'Name',
                      hintText: 'Name',
                      prefixIcon: Icons.email,
                      labelColor: Colors.white,
                      hintColor: Colors.white,
                      prefixIconColor: Colors.white,
                      cursorColor: Colors.white,
                      textColor: Colors.white,
                      controller: nameController,
                      validator: (value) => Validator.validateName(
                        name: value,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      labelText: 'E-Mail',
                      hintText: 'E-Mail',
                      prefixIcon: Icons.email,
                      labelColor: Colors.white,
                      hintColor: Colors.white,
                      prefixIconColor: Colors.white,
                      cursorColor: Colors.white,
                      textColor: Colors.white,
                      controller: emailController,
                      validator: (value) => Validator.validateEmail(
                        email: value,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      labelText: 'password',
                      hintText: 'password ',
                      prefixIcon: Icons.password,
                      hintColor: Colors.white,
                      labelColor: Colors.white,
                      prefixIconColor: Colors.white,
                      cursorColor: Colors.white,
                      textColor: Colors.white,
                      controller: passwordController,
                      validator: (value) => Validator.validatePassword(
                        password: value,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _isProcessing
                        ? CircularProgressIndicator()
                        : GradientElevatedButton(
                        text: 'Register',
                        gradient: const LinearGradient(colors: [
                          Colors.white,
                          Colors.black,
                          Colors.white,
                        ]),
                        onPressed: () async {
                          if (_registerFormKey.currentState!.validate()) {
                            setState(() {
                              _isProcessing = true;
                            });
                            User? user = await FireAuth
                                .registerUsingEmailPassword(
                              name: nameController.text,
                              email: emailController.text,
                              password:
                              passwordController.text,
                            );
                            setState(() {
                              _isProcessing = false;
                            });
                            if (user != null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(user: user),
                                ),
                              );
                            }
                          }
                        }),
                    // TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Forgot password',
                    //       style:
                    //       style.medium(context, color: Colors.white),
                    //     )),
                    SizedBox(
                      height: MediaQueryHelper.screenHeight! * 0.3,
                    ),
                    Text(
                      'already have an account ??',
                      style: style.medium(context, color: Colors.white),
                    ),
                    GradientElevatedButton(
                        text: 'Login',
                        gradient: const LinearGradient(colors: [
                          Colors.white,
                          Colors.black,
                          Colors.white,
                        ]),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                 LoginScreen(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
