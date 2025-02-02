import 'package:flutter/material.dart';
import 'package:foody/const/const_color.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

Widget inProgressWidget(
    {required String imageName1,
      required String foodName1,
      required double idr,
      required double rate,
      required String description,
      required String ingredients,
      required double price,
      required context}) {
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
                  SizedBox(
                    child: Image.asset(imageName1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
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
                          Text('4 items - ',style: TextStyle(color: ConstColor().secondTextColor),),
                          Text(
                            'IDR $idr',
                            style:  TextStyle(color: ConstColor().secondTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ),
  );
}
