part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class LoadFoods extends HomeEvent{
  LoadFoods();
}
class LoadCFoods extends HomeEvent{
  final String categoryName;
  LoadCFoods(this.categoryName);
}

class LoadCategory extends HomeEvent{
  LoadCategory();}

class LoadOneFood extends HomeEvent{
  final String id;
  final String categoryName;

  LoadOneFood({required this.id, required this.categoryName});
}