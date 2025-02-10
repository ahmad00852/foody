import 'package:foody/features/orders/data/models/order_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OrderService{
  final String _boxName = 'Order';

  Future<Box<OrderModel>> get _box async => await Hive.openBox<OrderModel>(_boxName);

Future<void> addOrder (OrderModel order)async{
  var box = await _box;
 await box.add(order);
}

Future<List<OrderModel>> getAllOrders()async{
  var box = await _box;
  return box.values.toList();
}

Future<void> deleteOrder(int index)async{
  var box = await _box;
  await box.deleteAt(index);
}


}