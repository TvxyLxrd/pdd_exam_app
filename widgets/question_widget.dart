
import 'package:flutter/material.dart';
import '../models/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final Function(String) onAnswerSelected;

  QuestionWidget({required this.question, required this.onAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.questionText, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            ...question.options.map((option) {
              return ElevatedButton(
                onPressed: () => onAnswerSelected(option),
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
