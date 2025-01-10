import 'dart:convert';
import 'package:http/http.dart' as http;
import 'question.dart';

// Remplacer l'URL
class DBconnect {
  final url = Uri.parse('https://quizgame-XXXX-default-rtdb.firebaseio.com/questions.json');

  // Récupérer les questions depuis Firebase
  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<Question> questions = [];
      final data = json.decode(response.body) as Map<String, dynamic>;

      data.forEach((key, value) {
        questions.add(
          Question(
            question: value['question'],
            options: List<String>.from(value['options']),
            correctAnswer: value['correctAnswer'],
          ),
        );
      });

      return questions;
    } else {
      throw Exception('Erreur lors de la récupération des questions : ${response.statusCode}');
    }
  }
}
