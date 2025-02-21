import 'package:flutter/material.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

Widget foodWidget(
    {required String foodName,
    required String imageName,
    required String description,
    required double rate,
    required context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 240,
      width: 220,
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
          width: 220,
          child: Image.network(
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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15),
          child: Row(
            children: [
              SimpleStarRating(
                filledIcon: Icon(
                  Icons.star,
                  color: Colors.red,
                  size: 20,
                ),
                nonFilledIcon: Icon(
                  Icons.star,
                  color: Colors.grey.shade300,
                  size: 20,
                ),
                isReadOnly: true,
                allowHalfRating: true,
                starCount: 5,
                rating: rate.round().toDouble(),
                onRated: (rate) {},
                spacing: 0,
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
