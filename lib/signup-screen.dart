import 'package:flutter/material.dart';
import '../commons/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

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
                height: 230,
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
                            labelText: 'Enter UserName',
                            labelStyle: const TextStyle(color: blue),
                            suffixIcon: const Icon(Icons.person_2, color: blue),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Enter Your Email',
                            labelStyle: const TextStyle(color: blue),
                            suffixIcon: const Icon(Icons.email, color: blue),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
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
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
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
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(color: blue),
                            suffixIcon: const Icon(Icons.password_rounded, color: blue),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _password) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 510, left: 116),
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
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
                    "Signup",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: blue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
