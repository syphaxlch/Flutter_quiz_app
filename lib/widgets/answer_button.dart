//Widget pour afficher un bouton de réponse
// lib/widgets/answer_button.dart
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AnswerButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow[600], // Couleur de fond
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
