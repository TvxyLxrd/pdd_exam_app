import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question.dart';

class StudyModeScreen extends StatefulWidget {
  @override
  _StudyModeScreenState createState() => _StudyModeScreenState();
}

class _StudyModeScreenState extends State<StudyModeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Question> questions = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Учебный режим')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index].questionText),
            subtitle: Text(questions[index].options.join(', ')),
          );
        },
      ),
    );
  }
}
