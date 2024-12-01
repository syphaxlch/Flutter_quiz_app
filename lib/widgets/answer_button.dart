import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AnswerButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Obtenir la largeur de l'écran

    return SizedBox(
      width: screenWidth * 0.9, //
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style:ElevatedButton.styleFrom(
          backgroundColor: Colors.yellow[600], // Couleur de fond
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
