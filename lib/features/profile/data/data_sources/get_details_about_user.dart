import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foody/features/profile/data/models/user_model.dart';

class GetUserInformation {
  Future<UserModel?> getUserInfo() async {
    UserModel user;
    try {
      var firebaseUser = FirebaseAuth.instance.currentUser;
      final one = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser!.uid)
          .get();
      user = UserModel.fromJson(one.data() as Map<String, dynamic>);
      return user;
    } on FirebaseException catch (e) {
      print('failed To Load User Info');
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
