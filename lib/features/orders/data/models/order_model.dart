import 'package:hive_flutter/hive_flutter.dart';

part 'order_model.g.dart';
@HiveType(typeId: 1)
class OrderModel extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final DateTime dateTime;
  @HiveField(2,defaultValue: false)
  final bool isDone;
  @HiveField(3)
  final String foodName;
  @HiveField(4)
  final double foodPrice;
@HiveField(5)
final int count;
  OrderModel(this.image, this.dateTime, this.isDone, this.foodName,
      this.foodPrice,this.count);


}