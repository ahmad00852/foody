import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/const/const_color.dart';
import 'package:foody/features/home/presentation/bloc/home_bloc.dart';
import 'package:foody/features/orders/data/data_sources/data_provider.dart';
import 'package:foody/features/orders/presentation/pages/payment_screen.dart';
import 'package:provider/provider.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class Details extends StatefulWidget {
  const Details({required this.categoryName, required this.id, super.key});

  final String id;
  final String categoryName;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final h = HomeBloc();

  @override
  void initState() {
    h.add(LoadOneFood(id: widget.id, categoryName: widget.categoryName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int count = Provider.of<DataProviderOrder>(context).count;
    return BlocProvider(
      create: (context) => h,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: switch (state.oneFoodStatus) {
                OneFoodStatus.success => Stack(children: [
                    SizedBox(
                      width: double.infinity,
                      height: 550,
                      child: Image.network(
                        state.oneFood!.image,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.oneFood!.name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              SimpleStarRating(
                                                filledIcon: Icon(
                                                  Icons.star,
                                                  color: Colors.red,
                                                  size: 20,
                                                ),
                                                nonFilledIcon: Icon(
                                                  Icons.star_border_outlined,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                                isReadOnly: true,
                                                allowHalfRating: true,
                                                starCount: 5,
                                                rating: state.oneFood!.rate
                                                    .round()
                                                    .toDouble(),
                                                onRated: (rate) {},
                                                spacing: 3,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                state.oneFood!.rate.toString(),
                                                style: const TextStyle(
                                                    color: Colors.grey),
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
                                              context
                                                  .read<DataProviderOrder>()
                                                  .decrement();
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  border: const Border(
                                                      bottom: BorderSide(
                                                          color: Colors.black),
                                                      top: BorderSide(
                                                          color: Colors.black),
                                                      left: BorderSide(
                                                          color: Colors.black),
                                                      right: BorderSide(
                                                          color: Colors.black)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Icon(Icons.remove)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                '${Provider.of<DataProviderOrder>(context).count}'),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<DataProviderOrder>()
                                                  .increment();
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  border: const Border(
                                                      bottom: BorderSide(
                                                          color: Colors.black),
                                                      top: BorderSide(
                                                          color: Colors.black),
                                                      left: BorderSide(
                                                          color: Colors.black),
                                                      right: BorderSide(
                                                          color: Colors.black)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Icon(Icons.add)),
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
                                  height: 105,
                                  width: double.infinity,
                                  child: SingleChildScrollView(
                                    child: Text(
                                      state.oneFood!.description,
                                      style: TextStyle(
                                          color: ConstColor().secondTextColor),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Ingredients:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SingleChildScrollView(
                                  child: SizedBox(
                                    height: 65,
                                    child: Text(
                                      state.oneFood!.ingredients,
                                      style: TextStyle(
                                          color: ConstColor().secondTextColor),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Total Price: ',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '    ${state.oneFood!.price} \$',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentScreen(
                                                      count: count,
                                                      foodName:
                                                          state.oneFood!.name,
                                                      foodPrice:
                                                          state.oneFood!.price,
                                                      imageName:
                                                          state.oneFood!.image,
                                                    )));
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: ConstColor().mainColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24, left: 16),
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
                      ],
                    )
                  ]),
                OneFoodStatus.loading => Center(
                    child: CircularProgressIndicator(),
                  ),
                OneFoodStatus.failed => Center(
                    child: IconButton(
                        onPressed: () {
                          h.add(LoadOneFood(
                              id: widget.id,
                              categoryName: widget.categoryName));
                        },
                        icon: Icon(Icons.refresh)),
                  ),
                _ => SizedBox()
              });
        },
      ),
    );
  }
}
