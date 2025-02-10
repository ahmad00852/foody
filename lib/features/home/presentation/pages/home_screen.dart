import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/const/const_color.dart';
import 'package:foody/features/home/data/models/food_model.dart';
import 'package:foody/features/home/presentation/bloc/home_bloc.dart';
import 'package:foody/features/home/presentation/pages/details.dart';
import 'package:foody/features/home/presentation/widgets/food_widget2.dart';
import 'package:foody/features/orders/data/data_sources/data_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/food_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedString;
  final OverlayPortalController itemController = OverlayPortalController();

  @override
  void initState() {
    context.read<HomeBloc>().add(LoadFoods());
    context.read<HomeBloc>().add(LoadCFoods('New Taste'));
    context.read<HomeBloc>().add(LoadCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text(
                      'FoodMarket',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Let\'t get some foods',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/icons/userIcon.png'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 240,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.mostPopularStatus == MostPopularStatus.loading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ConstColor().mainColor,
                    ),
                  );
                } else if (state.mostPopularStatus ==
                    MostPopularStatus.success) {
                  List<FoodModel> data = state.mostPopularList;
                  return SizedBox(
                    height: 240,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChangeNotifierProvider<
                                                    DataProviderOrder>(
                                                create: (context) =>
                                                    DataProviderOrder(),
                                                child: Details(
                                                  id: state
                                                      .mostPopularList[index]
                                                      .id,
                                                  categoryName: state
                                                      .mostPopularList[index]
                                                      .category,
                                                ))));
                              },
                              child: foodWidget(
                                rate: data[index].rate,
                                foodName: data[index].name,
                                imageName: data[index].image,
                                context: context,
                                description: data[index].description,
                              ),
                            )),
                  );
                } else if (state.mostPopularStatus ==
                    MostPopularStatus.failed) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
          20.verticalSpace,
          SizedBox(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return DefaultTabController(
                    length: state.categoryList.length,
                    child: Column(
                      children: <Widget>[
                        state.categoryStatus == CategoryStatus.success
                            ? SizedBox(
                                child: TabBar(
                                  indicatorSize: TabBarIndicatorSize.label,
                                  isScrollable: true,
                                    tabAlignment: TabAlignment.start ,
                                    indicatorColor: Colors.black,
                                    labelStyle: TextStyle(
                                        color: Colors.black,fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    unselectedLabelStyle: const TextStyle(
                                        color: Colors.grey),
                                    onTap: (index) {
                                      context.read<HomeBloc>().add(LoadCFoods(
                                          state.categoryList[index].name));
                                    },
                                    tabs: [
                                      for (int i = 0;
                                          i < state.categoryList.length;
                                          i++)
                                        Tab(
                                          text: state.categoryList[i].name,
                                        )
                                    ]),
                              )
                            : state.categoryStatus == CategoryStatus.failed
                                ? Center(
                                    child: IconButton(
                                        onPressed: () {
                                          context
                                              .read<HomeBloc>()
                                              .add(LoadCategory());
                                        },
                                        icon: Icon(Icons.refresh)),
                                  )
                                : const SizedBox(),
                        10.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            height: 350,
                            child: switch (state.foodByCategoryStatus) {
                              FoodByCategoryStatus.failed => Center(
                                  child: Text('Error'),
                                ),
                              FoodByCategoryStatus.loading => Center(
                                  child: CircularProgressIndicator(
                                    color: ConstColor().mainColor,
                                  ),
                                ),
                              FoodByCategoryStatus.success => ListView.builder(
                                  itemCount: state.foodCategoryList.length,
                                  itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangeNotifierProvider<
                                                              DataProviderOrder>(
                                                          create: (context) =>
                                                              DataProviderOrder(),
                                                          child: Details(
                                                            id: state
                                                                .foodCategoryList[
                                                                    index]
                                                                .id,
                                                            categoryName: state
                                                                .foodCategoryList[
                                                                    index]
                                                                .category,
                                                          ))));
                                        },
                                        child: food2Widget(
                                            imageName1: state
                                                .foodCategoryList[index].image,
                                            foodName1: state
                                                .foodCategoryList[index].name,
                                            description: state
                                                .foodCategoryList[index]
                                                .description,
                                            ingredients: state
                                                .foodCategoryList[index]
                                                .ingredients,
                                            price: state
                                                .foodCategoryList[index].price,
                                            context: context,
                                            rate: state
                                                .foodCategoryList[index].rate),
                                      )),
                              _ => SizedBox()
                            },
                          ),
                        )
                      ],
                    ));
              },
            ),
          )
        ],
      ),
    );
  }

  _fetch() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {})
          .catchError((onError) {
        print(onError);
      });
    }
  }
}
