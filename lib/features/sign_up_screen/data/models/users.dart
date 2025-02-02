import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement {
  storeNewUser(user, contex,name) async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid)
        .collection('products')
        .doc()
        .set({'email': user.email, 'uid': user.uid,'name':name}).catchError((e) {
      print(e);
    });
  }
}
