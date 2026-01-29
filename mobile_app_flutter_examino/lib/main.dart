import 'package:flutter/material.dart';
import 'presentation/ecrans/page_accueil.dart'; // Import de ta nouvelle page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examino',
      debugShowCheckedModeBanner: false, // Enlève la petite bannière "Debug"
      theme: ThemeData(
        // On laisse le thème par défaut pour l'instant
        useMaterial3: true,
      ),
      // On affiche la page d'accueil directement
      home: const PageAccueil(),
    );
  }
}