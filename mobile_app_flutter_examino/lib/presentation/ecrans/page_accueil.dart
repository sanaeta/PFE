import 'package:flutter/material.dart';

class PageAccueil extends StatelessWidget {
  const PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    // Couleurs de test (Option Bleue)
    const Color bleuBoutonFonce = Color(0xFF448AFF); 
    const Color bleuBoutonClair = Color(0xFFD1E3FF);
    const Color texteGrisFonce = Color(0xFF333333);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 1. Image d'illustration
          Expanded(
            flex: 6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/accueil_img.jpg', 
                  fit: BoxFit.contain,
                  // Si l'image n'est pas encore là, mets une icône de test :
                  errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              ),
            ),
          ),

          // 2. Le texte central
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "L'examen en ligne n'a jamais été aussi simple",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: texteGrisFonce,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // 3. Barre de boutons en bas
          SizedBox(
            height: 80,
            child: Row(
              children: [
                // Bouton S'inscrire
                Expanded(
                  child: Container(
                    color: bleuBoutonFonce,
                    child: const Center(
                      child: Text(
                        "s'inscrire",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // Bouton Se Connecter
                Expanded(
                  child: Container(
                    color: bleuBoutonClair,
                    child: const Center(
                      child: Text(
                        "se connecter",
                        style: TextStyle(
                          color: texteGrisFonce,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}