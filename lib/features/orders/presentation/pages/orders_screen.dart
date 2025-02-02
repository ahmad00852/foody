import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/features/orders/presentation/widgets/in_prgress_widget.dart';

import '../../../../const/const_color.dart';
import '../../../home/presentation/pages/details.dart';
import '../../../home/presentation/widgets/food_widget2.dart';
import '../widgets/past_order_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          30.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Orders',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: ConstColor().textColor)),
                Text(
                  'Wait for the best meal',
                  style: TextStyle(
                      fontSize: 18, color: ConstColor().secondTextColor),
                ),
              ],
            ),
          ),
          50.verticalSpace,
          SizedBox(
            width: double.infinity,
            height: 716,
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                  indicatorColor: Colors.black,
                  isScrollable: false,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey
              ),
              tabs: const [
                Text('In Progress'),
                Text('Past Orders'),
              ],
              views: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Details()));
                        },
                        child: inProgressWidget(
                            imageName1: 'assets/images/image.png',
                            foodName1: 'Burger',
                            idr: 800,
                            description: 'asafdcwfvdsfwf',
                            ingredients: 'dsdf',
                            price: 500,
                            context: context,
                            rate: 4),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Details()));
                        },
                        child: pastOrderWidget(
                            imageName1: 'assets/images/image.png',
                            foodName1: 'Burger',
                            idr: 800,
                            description: 'asafdcwfvdsfwf',
                            ingredients: 'dsdf',
                            price: 500,
                            context: context,
                            rate: 4),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
