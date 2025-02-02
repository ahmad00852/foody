import 'package:flutter/material.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

Widget food2Widget(
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
                      Text(
                        'IDR $idr',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,),
              child: Row(
                children: [
                  SimpleStarRating(
                    filledIcon: Icon(Icons.star,color: Colors.red,size: 20,),
                    nonFilledIcon: Icon(Icons.star_border_outlined,color: Colors.grey,size: 20,),
                    isReadOnly: true,
                    allowHalfRating: true,
                    starCount: 5,
                    rating: rate,
                    onRated: (rate) {
                    },
                    spacing: 3,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    rate.toString(),
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
