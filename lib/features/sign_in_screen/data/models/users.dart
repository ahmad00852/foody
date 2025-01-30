import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/features/scr/success_sign_in_screen.dart';

class UserManagement {
  storeNewUser(user, contex) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser!.uid).collection('products').doc()
        .set({'email': user.email, 'uid': user.uid}).then((onValue) =>
            Navigator.push(contex,
                    MaterialPageRoute(builder: (contex) => SuccessSignInScreen()))
                .catchError((e) {
              print(e);
            }));
  }
}
