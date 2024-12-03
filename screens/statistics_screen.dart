import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StatisticsScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Статистика')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Здесь будет ваша статистика.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context); // Вернуться на главный экран
              },
              child: Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}
