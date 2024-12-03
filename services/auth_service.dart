
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebase(User? user) {
    return user != null ? AppUser(uid: user.uid, email: user.email!) : null;
  }

  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  Future<AppUser?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(result.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AppUser?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(result.user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
