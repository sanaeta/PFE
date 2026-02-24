import 'package:flutter/material.dart';
import 'package:mobile_app_flutter_examino/configuration/theme/app_theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: Column(children: [
      Expanded(flex: 4, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.lock, size: 80, color: AppTheme.primaryColor), SizedBox(height: 10), Text("MOT DE PASSE\nOublié?", textAlign: TextAlign.center, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)), SizedBox(height: 10), Text("Ne t'inquiète pas, nous allons\nt'envoyer les instructions...", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey))])),
      Expanded(flex: 5, child: Container(width: double.infinity, padding: const EdgeInsets.all(30), decoration: const BoxDecoration(color: AppTheme.primaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Email", style: TextStyle(color: Colors.white)), const SizedBox(height: 10),
        TextField(style: const TextStyle(color: Colors.white), decoration: InputDecoration(hintText: "Enter Votre Email", hintStyle: const TextStyle(color: Colors.white70), prefixIcon: const Icon(Icons.email_outlined, color: Colors.white), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.white)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.white, width: 2)))),
        const SizedBox(height: 20), SizedBox(width: double.infinity, height: 50, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withAlpha(178)), onPressed: () {}, child: const Text("Réinitialiser le mot de passe", style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)))),
        const Spacer(), Center(child: GestureDetector(onTap: () => Navigator.pop(context), child: const Text("revenir à la page de\nconnexion", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)))), const SizedBox(height: 10), Center(child: IconButton(icon: const Icon(Icons.arrow_circle_left_outlined, color: Colors.white, size: 30), onPressed: () => Navigator.pop(context)))
      ])))
    ]));
  }
}