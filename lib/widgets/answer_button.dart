import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color backgroundColor; // Ajout du paramètre pour la couleur du bouton

  AnswerButton({
    required this.label,
    required this.onPressed,
    required this.backgroundColor, // Ajout du paramètre pour la couleur du bouton
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Obtenir la largeur de l'écran

    return SizedBox(
      width: screenWidth * 0.9,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Utiliser la couleur dynamique ici
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Texte noir
          ),
        ),
      ),
    );
  }
}
