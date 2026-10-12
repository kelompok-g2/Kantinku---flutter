import 'package:flutter/foundation.dart';

import '../models/menu_model.dart';
import '../repositories/menu_repository.dart';

class MenuViewModel extends ChangeNotifier {
  final MenuRepository _repository = MenuRepository();

  List<MenuModel> menus = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadMenus() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      menus = await _repository.getMenus();
    } catch (e) {
      errorMessage = 'Gagal mengambil data menu';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
