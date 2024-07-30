import 'package:flutter/material.dart';
import 'package:thebookstore/screens/login-screen.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ElevatedButton(
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        child:Column() ,
      ),
    );
  }
}
