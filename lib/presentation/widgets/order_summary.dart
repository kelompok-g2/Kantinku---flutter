import 'package:flutter/material.dart';
import '../../models/campus_menu.dart';
import '../../viewmodels/order_viewmodel.dart';
import '../theme/app_theme.dart';
import 'section_card.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.order});
  final OrderViewModel order;
  @override
  Widget build(BuildContext context) => SectionCard(child: Column(children: [
    const SectionHeading('Ringkasan Pembayaran'), Space.gap,
    _line(context, 'Subtotal menu', rupiah(order.subtotal)),
    _line(context, 'Biaya layanan', rupiah(order.service)),
    _line(context, 'Diskon KAMPUSKENYANG', '-${rupiah(order.discount)}', color: AppColors.green),
    const Divider(), _line(context, 'Total Pembayaran', rupiah(order.total), strong: true),
  ]));
  Widget _line(BuildContext context, String label, String value, {bool strong = false, Color? color}) =>
    Padding(padding: const EdgeInsets.symmetric(vertical: Space.small), child: Row(children: [
      Expanded(child: Text(label, style: strong ? Theme.of(context).textTheme.titleSmall : Theme.of(context).textTheme.bodySmall)),
      Text(value, style: (strong ? Theme.of(context).textTheme.titleLarge : Theme.of(context).textTheme.labelMedium)?.copyWith(color: color)),
    ]));
}
