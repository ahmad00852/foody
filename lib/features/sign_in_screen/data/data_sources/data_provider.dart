import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier,DiagnosticableTreeMixin{
bool isSecure=true;

changeSecure(newSecure){
isSecure=newSecure;
notifyListeners();
}

}
