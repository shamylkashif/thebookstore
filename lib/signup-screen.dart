import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    // Process the data
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data')),
    );
  }

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
                        onChanged: (value) {
                          _username = value;
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
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: blue),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color: blue,
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
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: TextFormField(
                        obscureText: !_confirmPasswordVisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(color: blue),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: blue,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 510, left: 116),
              child: GestureDetector(
                onTap: _signup,
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
