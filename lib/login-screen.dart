import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thebookstore/signup-screen.dart';
import 'commons/colors.dart';
import 'forgotpass.dart';
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
  bool _obscureText = true;

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

  void _login() {
    if (_username.isEmpty) {
      _showToast('Please enter your username');
      return;
    }
    if (_password.isEmpty) {
      _showToast('Please enter your password');
      return;
    }
    // Perform login with _username and _password
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
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
                child: Image.asset('assets/LogoWot.png',
                height: 300,
                width: 250,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250, left: 40, right: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Text('Welcome Back!', style: TextStyle(

                    ),),
                    Container(
                      width: 400,
                      height: 60,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          labelText: 'User Name',
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(Icons.person_2, color: Colors.white),
                        ),
                        onChanged: (value) {
                          _username = value;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: 400,
                      height: 60,
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 415, left: 30),
              child: GestureDetector(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword() ));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFF444141DD),

                  ),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 415, left: 190),
              child: GestureDetector(
                onTap: _login,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.yellow[700],

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
               Padding(
                 padding: const EdgeInsets.only(top: 515, left: 80),
                 child: Container(
                   padding: EdgeInsets.symmetric(horizontal: 30,vertical: 9),
                   decoration: BoxDecoration(
                     color: Color(0xFF444141DD),
                   ),
                   child: Text('Register',
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: Colors.white
                   ),
                   ),
                 ),
               ),
            Padding(
              padding: const EdgeInsets.only(top: 515, left: 210.1),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen() ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.yellow[700],
                  ),
                  child: Icon(Icons.chevron_right,
                       color: blue,
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
