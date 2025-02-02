import 'package:flutter/material.dart';
import 'package:foody/const/const_color.dart';
import 'package:foody/features/orders/presentation/pages/payment_screen.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: 550,
          child: Image.asset(
            'assets/images/pic1.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Burger',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  SimpleStarRating(
                                    filledIcon: Icon(Icons.star,color: Colors.red,size: 20,),
                                    nonFilledIcon: Icon(Icons.star_border_outlined,color: Colors.grey,size: 20,),
                                    isReadOnly: true,
                                    allowHalfRating: true,
                                    starCount: 5,
                                    rating:3,
                                    onRated: (rate) {
                                    },
                                    spacing: 3,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '3',
                                    style: const TextStyle(color: Colors.grey),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (count > 0) {
                                    count--;
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: const Border(
                                          bottom:
                                          BorderSide(color: Colors.black),
                                          top: BorderSide(color: Colors.black),
                                          left: BorderSide(color: Colors.black),
                                          right:
                                          BorderSide(color: Colors.black)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: Icon(Icons.remove)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('$count'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  count++;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      border: const Border(
                                          bottom:
                                          BorderSide(color: Colors.black),
                                          top: BorderSide(color: Colors.black),
                                          left: BorderSide(color: Colors.black),
                                          right:
                                          BorderSide(color: Colors.black)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: Icon(Icons.add)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'scascwedcas',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Ingredients:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Total Price: ',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'IDR 7242',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                        },
                          child: Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                                color: ConstColor().mainColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                                  'Order Now',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 24,left: 16),
            child: GestureDetector(
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
          ),
        ],)
      ]),
    );
  }
}
