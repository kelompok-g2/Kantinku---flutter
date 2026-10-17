import 'package:flutter/foundation.dart';
import '../models/campus_menu.dart';
import '../repositories/campus_menu_repository.dart';

class OrderViewModel extends ChangeNotifier {
  CampusMenu menu = CampusMenuRepository.menus.first;
  int quantity = 1;
  String spice = 'Sedang', pickup = 'Sekarang', payment = 'QRIS Instant';
  String notes = '';
  bool includeDrink = true, completed = false;
  int get subtotal => menu.price * quantity + (includeDrink ? 4000 : 0);
  int get service => 1000;
  int get discount => subtotal >= 20000 ? 5000 : 0;
  int get total => subtotal + service - discount;
  void select(CampusMenu value) {
    menu = value;
    quantity = 1;
    spice = 'Sedang';
    notes = '';
    completed = false;
    notifyListeners();
  }
  void changeQuantity(int delta) {
    quantity = (quantity + delta).clamp(1, 10);
    notifyListeners();
  }
  void setSpice(String value) { spice = value; notifyListeners(); }
  void setPickup(String value) { pickup = value; notifyListeners(); }
  void setPayment(String value) { payment = value; notifyListeners(); }
  void setDrink(bool value) { includeDrink = value; notifyListeners(); }
  void confirm() { completed = true; notifyListeners(); }
}
