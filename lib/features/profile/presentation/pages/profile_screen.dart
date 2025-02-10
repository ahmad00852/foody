import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/const/const_color.dart';
import 'package:foody/features/sign_in_screen/presentation/pages/sign_in_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetUserInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.userStatus == UserStatus.success) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  IconButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                  }, icon: Icon(Icons.logout_sharp,)),
                  10.horizontalSpace
                  ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.verticalSpace,
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
                      state.user!.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    6.verticalSpace,
                    Text(
                      state.user!.email,
                      style: TextStyle(
                          fontSize: 16, color: ConstColor().secondTextColor),
                    )
                  ],
                ),
                50.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          TabBar(
                              indicatorSize: TabBarIndicatorSize.label,
                              isScrollable: true,
                              tabAlignment: TabAlignment.start ,
                              indicatorColor: Colors.black,
                              labelStyle:
                              TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                              unselectedLabelStyle:
                              const TextStyle(color: Colors.grey,fontSize: 16),
                              tabs: [
                            Tab(
                              text: 'Account',
                            ),
                            Tab(
                              text: 'FoodMarket',
                            )
                          ]),
                          SizedBox(
                            height: 150,
                            child: TabBarView(children: [
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
                            ]),
                          )
                        ],
                      )),
                ),
              ],
            );
          } else if (state.userStatus == UserStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.userStatus == UserStatus.failed) {
            return Center(
              child: Text('No Information About User'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
