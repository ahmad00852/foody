import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foody/features/home/data/models/category_models.dart';
import 'package:foody/features/home/data/models/food_model.dart';


class FirestoreService{

Future<List<FoodModel>> getFoods()async{
List<FoodModel> foodList=[];
try {
  final food=await FirebaseFirestore.instance.collection('Most Popular').get();
  food.docs.forEach((element){
    return foodList.add(FoodModel.fromJson(element.data()));
  });
  return foodList;
} on FirebaseException catch (e) {
  print('Failed');
  return foodList;
}catch(e){
throw Exception(e.toString());
}
}

Future<List<FoodModel>> getCFoods({required String categoryName})async{
  List<FoodModel> foodCList=[];
  try {
    final food=await FirebaseFirestore.instance.collection(categoryName).get();
    food.docs.forEach((element){
      return foodCList.add(FoodModel.fromJson(element.data()));
    });
    return foodCList;
  } on FirebaseException catch (e) {
    print('Failed');
    return foodCList;
  }catch(e){
    throw Exception(e.toString());
  }
}
Future<List<CategoryModels>> getCategory()async{
  List<CategoryModels> categoryList=[];
  try {
    final category=await FirebaseFirestore.instance.collection('categories').get();
    category.docs.forEach((element){
      return categoryList.add(CategoryModels.fromJson(element.data()));
    });
    return categoryList;
  } on FirebaseException catch (e) {
    print('Failed');
    return categoryList;
  }
  catch(e){
    throw Exception(e.toString());
  }
}
Future<FoodModel?>  getOneFood(String id,
    String collectionName
    )async{
FoodModel oneFood;
try {
  final one= await FirebaseFirestore.instance.collection(collectionName).doc(id).get();
  oneFood=FoodModel.fromJson(one.data() as Map<String,dynamic>);
  return oneFood;
} on FirebaseException catch (e) {
print('failed To Load Product');
return null;
}catch (e){
  throw Exception(e.toString());
}
}
}