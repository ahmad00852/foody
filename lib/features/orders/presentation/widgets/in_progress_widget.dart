import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/const/const_color.dart';

Widget inProgressWidget({
  required String imageName1,
  required DateTime data,
  required bool isDone,
  required String foodName1,
  required double price,
  required int count,
}) {
  return Padding(
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
                    width: 60,
                    height: 60,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      imageName1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodName1,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              '$count items - ',
                              style:
                                  TextStyle(color: ConstColor().secondTextColor),
                            ),
                            Text(
                              'Price: ${price.toStringAsFixed(1)}',
                              style:
                                  TextStyle(color: ConstColor().secondTextColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  65.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${data.year}/${data.month}/${data.day}'),
                      isDone
                          ? Text(
                              'completed',
                              style: TextStyle(color: Colors.green),
                            )
                          : Text(
                              'in progress',
                              style: TextStyle(color: ConstColor().mainColor),
                            ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
