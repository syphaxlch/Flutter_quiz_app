import 'package:flutter/material.dart';
import '../models/question.dart'; // Importer le modèle de données de la question

class QuizPage extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizPage> {
  int _currentQuestionIndex = 0;

  // Liste d'exemple de questions
  List<Question> questions = [
    Question(
      question: 'Quel est le capital de la France ?',
      options: ['Paris', 'Londres', 'Berlin', 'Madrid'],
      correctAnswer: 'Paris',
    ),
    Question(
      question: 'Combien de continents existe-t-il ?',
      options: ['5', '6', '7', '8'],
      correctAnswer: '7',
    ),
    // Ajoutez d'autres questions ici si nécessaire
  ];

  // Fonction pour passer à la question suivante
  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Si on est à la dernière question, on peut afficher un message ou rediriger vers un écran de fin
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Félicitations!'),
            content: Text('Vous avez terminé le quiz.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Ferme le dialogue
                  Navigator.pop(context); // Retour au menu principal ou à l'écran précédent
                },
                child: Text('Retour'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Game',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: Theme.of(context).textTheme.labelLarge, // Texte en blanc, bold
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Afficher les options sous forme de boutons
            for (var option in currentQuestion.options)
              ElevatedButton(
                onPressed: () {
                  // Vérifier si l'option est correcte
                  if (option == currentQuestion.correctAnswer) {
                    // Afficher une notification ou un message de réussite (facultatif)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Bonne réponse !')),
                    );
                  } else {
                    // Afficher une notification ou un message d'échec (facultatif)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Mauvaise réponse !')),
                    );
                  }
                  _nextQuestion();
                },
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.labelLarge, // Texte en blanc, bold
                ),
              ),
            SizedBox(height: 20),
            // Bouton pour passer à la question suivante
            ElevatedButton(
              onPressed: _nextQuestion,
              child: Text('Question suivante', style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        ),
      ),
    );
  }
}
