import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thebookstore/login-screen.dart';
import '../commons/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _signup() {
    if (_username.isEmpty) {
      _showToast('Please enter a username');
      return;
    }
    if (_email.isEmpty) {
      _showToast('Please enter an email');
      return;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_email)) {
      _showToast('Please enter a valid email');
      return;
    }
    if (_password.isEmpty) {
      _showToast('Please enter a password');
      return;
    }
    if (_password.length < 6) {
      _showToast('Password must be at least 6 characters long');
      return;
    }
    if (_confirmPassword.isEmpty) {
      _showToast('Please confirm your password');
      return;
    }
    if (_password != _confirmPassword) {
      _showToast('Passwords do not match');
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 450),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/LogoWot1.png',
                  height: 300,
                  width: 250,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 230,left: 80),
              child: Text('Create an account', style: TextStyle(
                  color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  Container(
                    width: 400,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        labelText: 'Enter UserName',
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.person_2, color: Colors.white),
                      ),
                      onChanged: (value) {
                        _username = value;
                      },
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        labelText: 'Enter Your Email',
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.email, color: Colors.white),
                      ),
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: !_confirmPasswordVisible,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: IconButton(
                          icon: Icon(
                            _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible = !_confirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        _confirmPassword = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 590, left: 116),
              child: GestureDetector(
                onTap: _signup,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: yellow,
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
