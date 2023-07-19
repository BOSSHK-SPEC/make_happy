import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:make_happy/view/screens/homePage.dart';
import 'package:make_happy/view/screens/regScreen.dart';
import 'package:make_happy/view/utility/styles.dart';
import 'package:make_happy/view/utility/validator.dart';
import 'package:make_happy/view/widgets/customTextFormField.dart';
import 'package:make_happy/view/widgets/gradientElavatedButton.dart';

import '../utility/mediaQuery.dart';
import '../utility/fireAuth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: _initializeFirebase(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    children: [
                      Image.asset(
                        "assets/images/nathan-dumlao-k-oS0iKn0Qg-unsplash.jpg",
                        height: MediaQueryHelper.screenHeight,
                        width: MediaQueryHelper.screenWidth,
                        fit: BoxFit.fill,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQueryHelper.screenHeight! * 0.3,
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
                                    text: 'LOGIN',
                                    gradient: const LinearGradient(colors: [
                                      Colors.white,
                                      Colors.black,
                                      Colors.white,
                                    ]),
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        User? user = await FireAuth
                                            .signInUsingEmailPassword(
                                          email: emailController.text,
                                          password: passwordController.text,
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
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password',
                                  style:
                                      style.medium(context, color: Colors.white),
                                )),
                            SizedBox(
                              height: MediaQueryHelper.screenHeight! * 0.2,
                            ),
                            Text(
                              'Not yet Register ??',
                              style: style.medium(context, color: Colors.white),
                            ),
                            GradientElevatedButton(
                                text: 'Register',
                                gradient: const LinearGradient(colors: [
                                  Colors.white,
                                  Colors.black,
                                  Colors.white,
                                ]),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      regScreen(),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ));
  }
}
