import 'package:flutter/foundation.dart';

class DataProviderOrder with ChangeNotifier,DiagnosticableTreeMixin{
  int count=1;
  increment(){
    count=count+1;
    notifyListeners();
  }
  decrement(){
    if(count > 1) {
      count = count - 1;
    }
    notifyListeners();
  }

}
