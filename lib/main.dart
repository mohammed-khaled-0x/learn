import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:deutsch_app/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // استخدم FirebaseAuth للتحقق مما إذا كان هناك مستخدم مسجل دخول حالي
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // إذا كان هناك مستخدم مسجل دخول بالفعل، انتقل إلى الصفحة الرئيسية
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return LoginScreen(); // عرض شاشة تسجيل الدخول
          }
          return HomeScreen(); // عرض الصفحة الرئيسية (قم بإنشائها لاحقًا)
        } else {
          // عرض مؤشر تحميل بينما يتم التحقق من حالة المستخدم
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الصفحة الرئيسية"),
      ),
      body: Center(
        child: Text("مرحباً بك في التطبيق!"),
      ),
    );
  }
}
