import 'dart:async';  // Ajoutez ceci pour pouvoir utiliser Timer
import 'package:confetti/confetti.dart';


import 'package:flutter/material.dart';
import '../models/db_connect.dart';
import '../models/question.dart'; // Importer le modèle de données de la question
import '../widgets/answer_button.dart'; // Importer le widget AnswerButton

class QuizPage extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0; // Variable pour suivre le score
  int current = 1; // Variable pour suivre le numero de question
  late Future<List<Question>> _questionsFuture;
  Map<String, Color> _buttonColors = {}; // Dictionnaire pour suivre la couleur de chaque bouton
  bool _isAnswered = false; // Variable pour savoir si une réponse a été choisie
  int _timer = 60; // Timer pour toute la durée du quiz (60 secondes)
  late final Timer _countdownTimer;
  late ConfettiController _confettiController;  // ConfettiController pour gérer l'animation

  @override
  void initState() {
    super.initState();
    _questionsFuture = DBconnect().fetchQuestions(); // Récupérer les questions depuis Firebase

    // Initialisation du ConfettiController
    _confettiController = ConfettiController(duration: const Duration(seconds: 20));

    // Démarrer le timer dès que la page est lancée
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timer > 0) {
        setState(() {
          _timer--;
        });
      } else {
        // Quand le temps est écoulé, afficher la fin de la partie
        _endGame();
      }
    });
  }
  int questionsLength=0;
  // Fonction pour passer à la question suivante
  void _nextQuestion(List<Question> questions) {
    setState(() {
      questionsLength = questions.length;
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
        _isAnswered = false; // Réinitialiser le statut de la réponse
      } else {
        // Si on est à la dernière question, on peut afficher un message ou rediriger vers un écran de fin
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title:
            _score > 4
                ? Text(
              'Félicitations!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            )
                : Text(
              'ÉCHEC!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            content: Text('Vous avez terminé le quiz. Votre score est ${_score*10 } %.',
                style: TextStyle(fontSize: 18)),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Fermer la boîte de dialogue
                  Navigator.pop(context); // Retourner à l'écran précédent
                },
                child: Text('Menu principal',
                    style: TextStyle(fontSize: 18, backgroundColor:Colors.yellow[700],color: Colors.white)
                ),
              ),
            ],
          ),
        );
        _confettiController.play();
      }
    });
  }

  // Fonction pour terminer la partie
  void _endGame() {
    // Arrêter le timer et afficher un message de fin
    _countdownTimer.cancel();
    _confettiController.play();  // Déclencher les confettis

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Bords arrondis
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time, // Icône d'horloge
                color: Colors.blue, // Couleur de l'icône
                size: 50,
              ),
              SizedBox(height: 16),
              Text(
                'Temps écoulé!',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.red, // Couleur du texte
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Votre score est ${_score*10 } %',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Fermer la boîte de dialogue
                  Navigator.pop(context); // Retourner à l'écran précédent
                },
                child: Text('Menu principal',
                    style: TextStyle(fontSize: 18, backgroundColor:Colors.yellow[700],color: Colors.white)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();  // Libérer le ConfettiController
    _countdownTimer.cancel(); // Arrêter le timer quand la page est détruite
    super.dispose();
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
      body: Stack(
        children: [
          FutureBuilder<List<Question>>(
            future: _questionsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
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
                      // Affichage du score avant la question
                      Text(
                        '$current / ${questions.length+1}',
                        style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.green[700]),
                      ),
                      SizedBox(height: 40),
                      // Affichage du temps restant
                      Text(
                        'Temps restant: $_timer secondes',
                        style: TextStyle(fontSize: 24, color: Colors.red),
                      ),
                      SizedBox(height: 20),
                      // Afficher la question
                      Text(
                        currentQuestion.question,
                        style: Theme.of(context).textTheme.labelLarge, // Conserver le style de texte
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      // Afficher les options sous forme de boutons
                      for (var option in currentQuestion.options)
                        AnswerButton(
                          label: option,
                          backgroundColor: _buttonColors[option] ?? Colors.yellow[600]!, // Appliquer la couleur
                          onPressed: _isAnswered
                              ? () {} // Fonction vide pour désactiver le bouton
                              : () {
                            current++;
                            // Vérifier si l'option est correcte
                            if (option == currentQuestion.correctAnswer) {
                              setState(() {
                                _buttonColors[option] = Colors.green; // Vert pour la bonne réponse
                                _score++; // Incrémenter le score si la réponse est correcte
                              });
                            } else {
                              setState(() {
                                _buttonColors[option] = Colors.red; // Rouge pour la mauvaise réponse
                              });
                            }

                            setState(() {
                              _isAnswered = true; // Marquer la question comme répondue
                            });

                            // Mettre un délai avant de passer à la question suivante
                            Future.delayed(Duration(seconds: 1), () {
                              _nextQuestion(questions); // Passer à la question suivante après 1 seconde
                            });
                          },
                        ),
                      SizedBox(height: 20)
                    ],
                  ),
                );
              }
            },
          ),
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive, // Déclenche les confettis dans toutes les directions
            shouldLoop: false, // Pas de boucle continue
            colors: const [Colors.red, Colors.green, Colors.blue, Colors.yellow,Colors.white], // Les couleurs des confettis
          ),
        ],
      ),
    );
  }
}
