import 'package:flutter/material.dart';
import 'package:mobile_app_flutter_examino/presentation/ecrans/page_accueil.dart';
import 'package:mobile_app_flutter_examino/presentation/ecrans/login_screen.dart';
import 'package:mobile_app_flutter_examino/presentation/ecrans/register_screen.dart';
import 'package:mobile_app_flutter_examino/presentation/ecrans/forgot_password_screen.dart';
import 'package:mobile_app_flutter_examino/presentation/ecrans/success_screen.dart';


void main() { runApp(const MyApp()); }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examino App', 
      debugShowCheckedModeBanner: false, 
      initialRoute: '/', 
      routes: {
        '/': (context) => const PageAccueil(),
        '/login': (context) => const LoginScreen(), 
        '/register': (context) => const RegisterScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(), 
        '/success': (context) => const SuccessScreen(),
      },
    );
  }
}