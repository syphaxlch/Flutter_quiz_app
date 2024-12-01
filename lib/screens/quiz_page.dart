import 'package:flutter/material.dart';
import '../models/db_connect.dart';
import '../models/question.dart'; // Importer le modèle de données de la question

class QuizPage extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  late Future<List<Question>> _questionsFuture;

  @override
  void initState() {
    super.initState();
    _questionsFuture = DBconnect().fetchQuestions(); // Récupérer les questions depuis Firebase
  }

  // Fonction pour passer à la question suivante
  void _nextQuestion(List<Question> questions) {
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
                  Navigator.pop(context);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Game',
          style: Theme.of(context).textTheme.labelLarge, // Conserver le style de texte
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: FutureBuilder<List<Question>>(
        future: _questionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Afficher un loader en attendant les données
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur de chargement des questions.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucune question disponible.'));
          } else {
            List<Question> questions = snapshot.data!;
            final currentQuestion = questions[_currentQuestionIndex];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentQuestion.question,
                    style: Theme.of(context).textTheme.labelLarge, // Conserver le style de texte
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  // Afficher les options sous forme de boutons
                  for (var option in currentQuestion.options)
                    ElevatedButton(
                      onPressed: () {
                        // Vérifier si l'option est correcte
                        if (option == currentQuestion.correctAnswer) {
                          // Afficher une notification ou un message de réussite
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Bonne réponse !')),
                          );
                        } else {
                          // Afficher une notification ou un message d'échec
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Mauvaise réponse !')),
                          );
                        }
                        _nextQuestion(questions); // Passer à la question suivante en utilisant la liste des questions
                      },
                      child: Text(
                        option,
                        style: Theme.of(context).textTheme.labelLarge, // Texte en blanc, bold
                      ),
                    ),
                  SizedBox(height: 20),
                  // Bouton pour passer à la question suivante
                  ElevatedButton(
                    onPressed: () => _nextQuestion(questions),
                    child: Text('Question suivante', style: Theme.of(context).textTheme.labelLarge),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
