import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/features/orders/data/data_sources/order_service.dart';
import 'package:foody/features/orders/data/models/order_model.dart';
import 'package:foody/features/orders/presentation/pages/order_details.dart';
import 'package:foody/features/orders/presentation/widgets/in_progress_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../const/const_color.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final OrderService orderService = OrderService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: orderService.getAllOrders(),
          builder: (context, AsyncSnapshot<List<OrderModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                height: 749,
                child: ValueListenableBuilder(
                    valueListenable: Hive.box<OrderModel>('Order').listenable(),
                    builder: (context, Box<OrderModel> box, _) {
                      return box.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/ouch.png'),
                                  30.verticalSpace,
                                  Text(
                                    'Ouch! Hungry',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    'Seems like you have not \n ordered any food yet',
                                    style: TextStyle(
                                        color: ConstColor().secondTextColor),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  30.verticalSpace,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Your Orders',
                                          style: TextStyle(
                                              fontSize: 32,
                                              fontWeight: FontWeight.w500,
                                              color: ConstColor().textColor)),
                                      Text(
                                        'Wait for the best meal',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                ConstColor().secondTextColor),
                                      ),
                                    ],
                                  ),
                                  20.verticalSpace,
                                  SizedBox(
                                    height: 500,
                                    child: ListView.builder(
                                        itemCount: box.values.length,
                                        itemBuilder: (context, index) {
                                          var order = box.getAt(index);
                                          return InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderDetails(
                                                            isDone: order.isDone,
                                                              count: order
                                                                  .count,
                                                              imageName: order
                                                                  .image,
                                                              foodName: order
                                                                  .foodName,
                                                              foodPrice: order
                                                                  .foodPrice,
                                                              index: index)));
                                            },
                                            child: inProgressWidget(
                                              data: order!.dateTime,
                                              imageName1: order.image,
                                              isDone: order.isDone,
                                              foodName1: order.foodName,
                                              price: order.foodPrice,
                                              count: order.count,
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            );
                    }),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
