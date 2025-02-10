import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  storeNewUser(user,context,name) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .set({'email': user.email, 'uid': user.uid,'name':name}).catchError((e) {
      print(e);
    });
  }
}
