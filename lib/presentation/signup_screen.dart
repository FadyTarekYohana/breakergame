import 'package:breakergame/data/users_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/animatedbutton.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool weakPassword = false;
  bool emailAlreadyInUse = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController adminCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                "BRICK BREAKER",
                textAlign: TextAlign.center,
                style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.red,
                        offset: Offset(3.5, 3.5),
                      ),
                    ],
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextFormField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  icon: Icon(Icons.email, color: Colors.white),
                  hintText: 'EMAIl',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Text(
              emailAlreadyInUse
                  ? "The account already exists for that email!"
                  : "",
              style: const TextStyle(color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  icon: Icon(Icons.password, color: Colors.white),
                  hintText: 'PASSWORD',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Text(
              weakPassword ? "The password provided is too weak!" : "",
              style: const TextStyle(color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextFormField(
                controller: adminCodeController,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  icon: Icon(Icons.admin_panel_settings, color: Colors.white),
                  hintText: 'CODE TO SIGN UP AS ADMIN',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: AnimatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      if (adminCodeController.text.isNotEmpty) {
                        if (adminCodeController.text == await getAdminCode()) {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          createUser("admin", emailController.text,
                              credential.user!.uid);
                          GoRouter.of(context).go('/homepage');
                        }
                      } else {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        createUser(
                            "user", emailController.text, credential.user!.uid);
                        GoRouter.of(context).go('/homepage');
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        setState(() {
                          weakPassword = true;
                          emailAlreadyInUse = false;
                        });
                      } else if (e.code == 'email-already-in-use') {
                        setState(() {
                          weakPassword = false;
                          emailAlreadyInUse = true;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                enabled: true,
                height: 50,
                width: 160,
                shadowDegree: ShadowDegree.dark,
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => GoRouter.of(context).go('/'),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
