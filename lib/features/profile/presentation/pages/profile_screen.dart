import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/const/const_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.verticalSpace,
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/icons/userIcon.png',
                  fit: BoxFit.cover,
                ),
              ),
              15.verticalSpace,
              Text(
                'Aashifa Sheikh',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              6.verticalSpace,
              Text(
                'contact.uiuxexperts@gmail.com',
                style: TextStyle(
                    fontSize: 16, color: ConstColor().secondTextColor),
              )
            ],
          ),
          50.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 550,
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                  alignment: TabBarAlignment.start,
                  position: TabBarPosition.top,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                  indicatorColor: Colors.black,
                  isScrollable: false,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey),
              tabs: const [
                Text('Account'),
                Text('FoodMarket'),
              ],
              views: [
                Column(
                  children: [
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Edit Profile',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Home Address',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Security',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payments',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rate App',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Help Center',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Privacy & Policy',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Terms & Conditions',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
