import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/food_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedString;
  final OverlayPortalController itemController = OverlayPortalController();
  String email='';
@override
  void initState() {
    _fetch();
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 240,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => foodWidget(
                      rate: 2,
                      id: 2,
                      foodName: 'Burger',
                      imageName: 'assets/images/image.png',
                      context: context,
                      description: 'adsvssvsdvsvs',
                    )),
          ),
          Text(email)
        ],
      ),
      
    );
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
            email=ds.data()!['email'];
            setState(() {

            });
      })
          .catchError((onError) {
        print(onError);
      });
    }
  }
}
