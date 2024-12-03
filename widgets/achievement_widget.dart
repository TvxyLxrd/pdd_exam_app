import 'package:flutter/material.dart';

class AchievementWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool achieved;

  AchievementWidget({required this.title, required this.description, required this.achieved});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(description),
              ],
            ),
            Icon(
              achieved ? Icons.check_circle : Icons.circle,
              color: achieved ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
