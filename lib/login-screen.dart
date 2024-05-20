import 'package:flutter/material.dart';
import 'package:thebookstore/signup-screen.dart';
import 'commons/colors.dart';
import 'home-screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/backgrdImg (2).png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(MediaQuery.of(context).size.width, 80.0),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 60),
                    child: Image.asset('assets/LogoWot.png', height: 240, width: 240),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250, left: 47),
              child: Container(
                height: 180,
                width: 265,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 14),
                      Container(
                        width: 400,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'User Name',
                            labelStyle: const TextStyle(color: blue),
                            suffixIcon: const Icon(Icons.person_2, color: blue),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
                          },
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: blue),
                            suffixIcon: const Icon(Icons.password, color: blue),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 430, left: 116),
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform login with _username and _password
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: yellow,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: blue,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 480, left: 130),
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 13, color: blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 500, left: 95),
              child: Row(
                children: [
                  const Text(
                    'Do not have an account?',
                    style: TextStyle(fontSize: 13, color: blue),
                  ),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupScreen()),
                      );
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 15,
                        color: blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
