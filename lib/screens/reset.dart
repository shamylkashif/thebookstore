import 'package:flutter/material.dart';
import 'package:thebookstore/commons/colors.dart';
import 'package:thebookstore/screens/forgotpass.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool _isMessageVisible = false;

  void _showMessage() {
    setState(() {
      _isMessageVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
      AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Reset Password',
          style: TextStyle(
            color: Colors.yellow[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.yellow[700]),
              onPressed: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
              },
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 8),
            child: Row(
              children: [
                Text('Reset Password',
                  style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                SizedBox(width: 3,),
                Icon(Icons.question_mark_outlined, color: blue,size: 55,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 8),
            child: Text('Enter the Email address associated with your account.',
            style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            width: 340,
            height: 60,
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 40,),
          InkWell(
            onTap: _showMessage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.yellow[700],
              ),
              child: Text(
                "Reset",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          if (_isMessageVisible)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Reset Password link is sent to your Email, check your inbox',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
