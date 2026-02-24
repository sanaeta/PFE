import 'package:flutter/material.dart';
import 'package:mobile_app_flutter_examino/configuration/theme/app_theme.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppTheme.primaryColor, body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("connexion reussie", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)), const SizedBox(height: 30),
      ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, '/login'), child: const Text("Déconnexion"))
    ])));
  }
}