import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  static FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      print(account);
      print('======== ID TOKEN ========= ');
      print(googleKey.idToken);

      // TODO: Llamar un servicio REST a nuestro backend
      // con el ID Token
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleKey.accessToken,
        idToken: googleKey.idToken,
      );
      UserCredential authresult = await _auth.signInWithCredential(credential);
      // final User? user = authresult.user;
      return authresult;
    } catch (e) {
      print('Error en google Signin');
      print(e);
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut().then((value) => print("session cerrada firebase"));
    await _googleSignIn
        .signOut()
        .then((value) => print("session cerrada gmail"));
  }
}
