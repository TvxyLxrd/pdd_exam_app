import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question.dart';

class ExamModeScreen extends StatefulWidget {
  @override
  _ExamModeScreenState createState() => _ExamModeScreenState();
}

class _ExamModeScreenState extends State<ExamModeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    QuerySnapshot snapshot = await _firestore.collection('questions').get();
    setState(() {
      questions = snapshot.docs.map((doc) {
        return Question(
          questionText: doc['questionText'],
          options: List<String>.from(doc['options']),
          correctAnswer: doc['correctAnswer'],
        );
      }).toList();
    });
  }

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      score++;
    }
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Результат'),
          content: Text('Ваш результат: $score из ${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Вернуться на главный экран
              },
              child: Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Экзаменационный режим')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Экзаменационный режим')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(questions[currentQuestionIndex].questionText),
          ...questions[currentQuestionIndex].options.map((option) {
            return ElevatedButton(
              onPressed: () => _checkAnswer(option),
              child: Text(option),
            );
          }).toList(),
        ],
      ),
    );
  }
}
