import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const/const_color.dart';
import '../../data/data_sources/order_service.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails(
      {super.key,
      required this.count,
      required this.imageName,
      required this.foodName,
      required this.foodPrice,
      required this.index,
      required this.isDone
      });

  final int count;
  final String imageName;
  final String foodName;
  final double foodPrice;
  final int index;
  final bool isDone;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final OrderService orderService = OrderService();

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
                            color: ConstColor().secondTextColor, fontSize: 16),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Order Status:',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              widget.isDone?Text(
                'completed',
                style: TextStyle(color: Colors.green),
              ):Text(
                'in progress',
                style: TextStyle(color: ConstColor().mainColor),
              ),
            ],),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('To inquire about the order:'),
                Container(
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(color: ConstColor().mainColor)
                    )),
                    child: Text('+963111112244',style: TextStyle(color: ConstColor().mainColor,),))
              ],
            ),
            30.verticalSpace,
            InkWell(
              onTap: ()  {
                orderService.deleteOrder(widget.index);
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ConstColor().mainColor),
                child: Center(
                    child: Text(
                  'Cancel My Order',
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
