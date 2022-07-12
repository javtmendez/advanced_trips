import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/Users/repository/firebaseAuth.dart';

class AuthRepository {
  final _firebaseAuthAPI = GoogleSignInService();
  Future<UserCredential> singInFIrebase() =>
      _firebaseAuthAPI.signInWithGoogle();

  singOut() => _firebaseAuthAPI.signOut();
}
