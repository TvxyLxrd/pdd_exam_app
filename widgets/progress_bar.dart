import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;

  ProgressBar({required this.currentQuestionIndex, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: (currentQuestionIndex + 1) / totalQuestions,
      minHeight: 20,
    );
  }
}
