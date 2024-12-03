import 'package:cloud_firestore/cloud_firestore.dart';

class StatisticsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserStatistics(String userId, int score, int totalQuestions) async {
    await _firestore.collection('statistics').add({
      'userId': userId,
      'score': score,
      'totalQuestions': totalQuestions,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<List<Map<String, dynamic>>> getUserStatistics(String userId) async {
    QuerySnapshot snapshot = await _firestore.collection('statistics')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();

    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
