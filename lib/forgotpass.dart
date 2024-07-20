import 'package:flutter/material.dart';
import 'package:thebookstore/reset.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 100,top: 20 ),
      decoration: BoxDecoration(
        color: Color(0xFF333333),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Make Selection!',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          SizedBox(height: 10.0),
          ListTile(
            leading: Icon(Icons.email, color: Colors.white),
            title: Text(
              'E-Mail',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Reset via Mail Verification',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>  Reset())
            );
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.white),
            title: Text(
              'Phone No',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Reset via Phone Verification',
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Reset())
              );
            },
          ),
        ],
      ),
    );
  }
}
