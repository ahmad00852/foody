
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

Widget foodWidget(
    {required String foodName,
      required String imageName,
      required String description,
      required double rate,
      required int id,
      required context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 220,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.grey,
            )
          ],
          borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: const BoxDecoration(),
          height: 140,
          width: 200,
          child: Image.asset(
            imageName,
            fit: BoxFit.cover,
            width: 220,
            height: 110,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            foodName,
            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 20),
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
      ]),
    ),
  );
}