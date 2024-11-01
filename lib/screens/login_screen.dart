import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل الدخول"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ضع هنا كود تسجيل الدخول الخاص بك
          },
          child: Text("تسجيل الدخول"),
        ),
      ),
    );
  }
}
