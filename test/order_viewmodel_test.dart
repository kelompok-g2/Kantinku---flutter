import 'package:flutter_test/flutter_test.dart';
import 'package:kantinku_flutter/repositories/campus_menu_repository.dart';
import 'package:kantinku_flutter/viewmodels/order_viewmodel.dart';

void main() {
  test('Discount threshold and optional drink produce correct checkout total', () {
    final order = OrderViewModel();
    addTearDown(order.dispose);
    expect(order.total, 16000);
    order.setDrink(false);
    expect(order.discount, 0);
    expect(order.total, 17000);
    order.changeQuantity(1);
    expect(order.total, 28000);
  });
  test('Quantity is bounded and selecting a new menu clears previous completion', () {
    final order = OrderViewModel();
    addTearDown(order.dispose);
    order.changeQuantity(-5);
    expect(order.quantity, 1);
    order.changeQuantity(50);
    expect(order.quantity, 10);
    order.confirm();
    order.select(CampusMenuRepository.menus[1]);
    expect(order.completed, isFalse);
    expect(order.quantity, 1);
  });
  test('Search combines category and menu or stand query', () {
    const repository = CampusMenuRepository();
    expect(repository.search('kopi', 'Minuman Dingin').single.id, 'kopi-susu');
    expect(repository.search('kopi', 'Makanan Berat'), isEmpty);
    expect(repository.find('missing'), isNull);
  });
}
