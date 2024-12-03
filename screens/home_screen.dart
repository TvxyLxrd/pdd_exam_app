import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'study_mode_screen.dart';
import 'exam_mode_screen.dart';
import 'statistics_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главное меню')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
              },
              child: Text('Регистрация'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Вход'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StudyModeScreen()));
              },
              child: Text('Учебный режим'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExamModeScreen()));
              },
              child: Text('Экзаменационный режим'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsScreen()));
              },
              child: Text('Статистика'),
            ),
          ],
        ),
      ),
    );
  }
}
