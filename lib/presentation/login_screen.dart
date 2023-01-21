import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/animatedbutton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool emailNotFound = false;
  bool wrongPassword = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
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
                padding: const EdgeInsets.all(10.0),
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
                    if (value!.isEmpty || value.length < 8) {
                      return 'Please enter your email';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Text(
                emailNotFound ? "Email not found!" : "",
                style: const TextStyle(color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                    if (value!.isEmpty || value.length < 3) {
                      return 'Please enter your password';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Text(
                wrongPassword ? "Wrong password!" : "",
                style: const TextStyle(color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedButton(
                  height: 50,
                  width: 140,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        GoRouter.of(context).go('/homepage');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          setState(() {
                            emailNotFound = true;
                            wrongPassword = false;
                          });
                        } else if (e.code == 'wrong-password') {
                          setState(() {
                            emailNotFound = false;
                            wrongPassword = true;
                          });
                        }
                      }
                    }
                  },
                  enabled: true,
                  shadowDegree: ShadowDegree.dark,
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => GoRouter.of(context).go('/signup'),
                child: const Text(
                  'SIGN UP',
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
      ),
    );
  }
}
