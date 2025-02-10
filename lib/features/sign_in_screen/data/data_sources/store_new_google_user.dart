import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserGoogleManager{
  storeNewGoogleUser(user) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    FirebaseFirestore.instance
        .collection('users')
        .doc(googleAuth?.idToken)
        .set({'email': user.email, 'uid': googleAuth?.idToken}).catchError((e) {
      print(e);
    });
  }
}