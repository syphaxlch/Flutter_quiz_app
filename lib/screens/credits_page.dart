import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fond sombre pour un look moderne
      appBar: AppBar(
        title: Text("Crédits"),
        backgroundColor: Colors.yellow, // Couleur de l'AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ajout d'un padding pour l'espacement
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Titre principal
                Text(
                  "Quiz Game",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.white,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Section Auteur(s)
                _buildCreditsSection("Auteur(s)", "Syphax LAKHDARCHAOUCHE"),

                SizedBox(height: 20),

                // Section Technologies utilisées
                _buildCreditsSection("Technologies utilisées", "Flutter, Dart, Firebase"),

                SizedBox(height: 20),

                // Section Version
                _buildCreditsSection("Version", "1.0.0"),

                SizedBox(height: 20),

                // Image d'animation ou effet graphique
                Image.asset(
                  'assets/QUIZ.png', // Assurez-vous que l'image est présente dans le répertoire assets
                  height: 200,
                  width: 200,
                ),

                SizedBox(height: 20),

                // Section Licence
                Text(
                  "© 2024 Syphax LAKHDARCHAOUCHE. Tous droits réservés.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Méthode pour afficher chaque section de crédits
  Widget _buildCreditsSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.blueAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
      ],
    );
  }
}
