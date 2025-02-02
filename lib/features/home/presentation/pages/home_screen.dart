import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/features/home/presentation/pages/details.dart';
import 'package:foody/features/home/presentation/widgets/food_widget2.dart';

import '../widgets/food_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedString;
  final OverlayPortalController itemController = OverlayPortalController();

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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      'FoodMarket',
                      style: TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Let\'t get some foods',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/icons/userIcon.png'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
          15.verticalSpace,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            height: 400,
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                indicatorColor: Colors.black,
                isScrollable: false,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey
              ),
              tabs: const [
                Text('New Taste'),
                Text('Popular'),
                Text('Recommended')
              ],
              views: [
                ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                      },
                      child: food2Widget(
                          imageName1: 'assets/images/image.png',
                          foodName1: 'Burger',
                          idr: 800,
                          description: 'asafdcwfvdsfwf',
                          ingredients: 'dsdf',
                          price: 500,
                          context: context,
                          rate: 4),
                    )),
                Container(color: Colors.grey),
                Container(color: Colors.grey),
              ],
            ),
          ),
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
          .then((ds) {})
          .catchError((onError) {
        print(onError);
      });
    }
  }
}
