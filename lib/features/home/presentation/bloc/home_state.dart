part of 'home_bloc.dart';

enum MostPopularStatus {init,loading,failed,success}
enum FoodByCategoryStatus {init,loading,failed,success}
enum CategoryStatus {init,loading,failed,success}
enum OneFoodStatus {init,loading,failed,success}

class HomeState {
  final FoodModel? oneFood;
  final OneFoodStatus oneFoodStatus;
  final List<FoodModel> mostPopularList;
  final MostPopularStatus mostPopularStatus;
  final List<FoodModel> foodCategoryList;
  final FoodByCategoryStatus foodByCategoryStatus;
  final List<CategoryModels> categoryList;
  final CategoryStatus categoryStatus;

  HomeState(
      {this.oneFood,
        this.oneFoodStatus=OneFoodStatus.init,
        this.categoryList=const[],
        this.categoryStatus=CategoryStatus.init,
        this.mostPopularList=const[],
      this.mostPopularStatus=MostPopularStatus.init,
      this.foodCategoryList=const[],
      this.foodByCategoryStatus=FoodByCategoryStatus.init});

  HomeState copyWith({
    FoodModel? oneFood,
    OneFoodStatus? oneFoodStatus,
    List<FoodModel>? mostPopularList,
    MostPopularStatus? mostPopularStatus,
    List<FoodModel>? foodCategoryList,
    FoodByCategoryStatus? foodByCategoryStatus,
    List<CategoryModels>? categoryList,
    CategoryStatus? categoryStatus,
  }) {
    return HomeState(
      oneFood: oneFood ?? this.oneFood,
      oneFoodStatus: oneFoodStatus ?? this.oneFoodStatus,
      mostPopularList: mostPopularList ?? this.mostPopularList,
      mostPopularStatus: mostPopularStatus ?? this.mostPopularStatus,
      foodCategoryList: foodCategoryList ?? this.foodCategoryList,
      foodByCategoryStatus: foodByCategoryStatus ?? this.foodByCategoryStatus,
      categoryList: categoryList ?? this.categoryList,
      categoryStatus: categoryStatus ?? this.categoryStatus,
    );
  }
}


