import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signInWithCredential(AuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user!;
    } catch (e) {
      throw Exception('Failed to sign in with credential: $e');
    }
  }

  Future signOut() async {
    await _auth.signOut();
  }

  // Add more Firebase methods as per your requirements
}
