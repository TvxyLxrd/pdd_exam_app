import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question.dart';

class QuestionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Question>> getQuestions(String categoryId) async {
    List<Question> questions = [];
    QuerySnapshot snapshot = await _firestore.collection('questions').where('categoryId', isEqualTo: categoryId).get();

    for (var doc in snapshot.docs) {
      questions.add(Question(
        questionText: doc['questionText'],
        options: List<String>.from(doc['options']),
        correctAnswer: doc['correctAnswer'],
      ));
    }
    return questions;
  }
}
