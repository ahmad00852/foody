import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/home/data/data_sources/firestore_service.dart';
import 'package:foody/features/home/data/models/category_models.dart';
import 'package:foody/features/home/data/models/food_model.dart';
import 'package:meta/meta.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<LoadFoods>((event, emit) async{
      emit(state.copyWith(mostPopularStatus: MostPopularStatus.loading));
      try {
        final data= await FirestoreService().getFoods();
        emit(state.copyWith(mostPopularStatus: MostPopularStatus.success,mostPopularList: data));
      } catch (e) {
        print(e);
          emit(state.copyWith(mostPopularStatus: MostPopularStatus.failed));
      }
    });
    on<LoadCFoods>((event, emit) async{
      emit(state.copyWith(foodByCategoryStatus: FoodByCategoryStatus.loading));
      try {
        final data= await FirestoreService().getCFoods(categoryName: event.categoryName);
        emit(state.copyWith(foodByCategoryStatus: FoodByCategoryStatus.success,foodCategoryList: data));
      } catch (e) {
        print(e);
          emit(state.copyWith(foodByCategoryStatus: FoodByCategoryStatus.failed));
      }
    });
    on<LoadCategory>((event,emit)async{
      emit(state.copyWith(categoryStatus: CategoryStatus.loading));
      try {
        final categoryData = await FirestoreService().getCategory();
        emit(state.copyWith(categoryStatus: CategoryStatus.success,categoryList: categoryData));
      } catch (e) {
        print(e);
        emit(state.copyWith(categoryStatus: CategoryStatus.failed));
      }
    });
    on<LoadOneFood>((event,emit)async{
      emit(state.copyWith(oneFoodStatus: OneFoodStatus.loading));
      try {
        final data= await FirestoreService().getOneFood(event.id, event.categoryName);
        emit(state.copyWith(oneFood: data,oneFoodStatus: OneFoodStatus.success));
      } on Exception catch (e) {
        emit(state.copyWith(oneFoodStatus: OneFoodStatus.failed));
      }
    });
  }
}
