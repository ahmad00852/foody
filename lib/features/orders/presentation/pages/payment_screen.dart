import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/features/orders/data/data_sources/order_service.dart';
import 'package:foody/features/orders/data/models/order_model.dart';

import '../../../../const/const_color.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {super.key,
      required this.count,
      required this.imageName,
      required this.foodName,
      required this.foodPrice});

  final int count;
  final String imageName;
  final String foodName;
  final double foodPrice;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final OrderService _orderService = OrderService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: ConstColor().mainColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                26.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: ConstColor().textColor)),
                    Text(
                      'You deserve better meal',
                      style: TextStyle(
                          fontSize: 18, color: ConstColor().secondTextColor),
                    ),
                  ],
                ),
              ],
            ),
            70.verticalSpace,
            Text(
              'Item Ordered',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                widget.imageName,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.foodName,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Price: ${widget.foodPrice} \$',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${widget.count} items',
                        style: TextStyle(
                            color: ConstColor().secondTextColor,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
            50.verticalSpace,
            Text(
              'Details Transaction',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.foodName,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '${((widget.foodPrice) * (widget.count)).toStringAsFixed(2)} \$',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            6.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Driver 10%',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '${((((widget.foodPrice) * 10) / 100) * (widget.count)).toStringAsFixed(2)} \$',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            6.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '${(((widget.count) * widget.foodPrice) + ((((widget.foodPrice) * 10) / 100) * (widget.count))).toStringAsFixed(1)} \$',
                  style: TextStyle(
                      color: Color(0xff4BAF31),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            50.verticalSpace,
            InkWell(
              onTap: () async{
                BotToast.showLoading();
                await Future.delayed(Duration(seconds: 2));
                final double totalPrice =
                    (((widget.count) * widget.foodPrice) +
                        ((((widget.foodPrice) * 10) / 100) * (widget.count)));
                var order = OrderModel(widget.imageName, DateTime.now(),
                    false, widget.foodName, totalPrice, widget.count);
                await _orderService.addOrder(order);
                BotToast.closeAllLoading();
                BotToast.showText(text: 'Order Added');
                },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ConstColor().mainColor),
                child: Center(
                    child: Text(
                  'Checkout Now',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
