import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../viewmodels/order_viewmodel.dart';
import '../theme/app_theme.dart';
import '../widgets/order_summary.dart';
import '../widgets/primary_action.dart';
import '../widgets/section_card.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.order});
  final OrderViewModel order;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(appBar: AppBar(title: const Text('Pesanan Berhasil'), automaticallyImplyLeading: false),
      body: SingleChildScrollView(padding: Space.padding, child: Column(children: [
        Space.block,
        Container(width: Space.logo, height: Space.logo,
          decoration: const BoxDecoration(color: AppColors.mint, shape: BoxShape.circle),
          child: const Icon(Icons.check_rounded, size: Space.button, color: AppColors.green)),
        Space.block, const StatusPill('Pesanan berhasil dikonfirmasi'), Space.gap,
        Text('Yeay, pesananmu masuk!', style: text.headlineMedium, textAlign: TextAlign.center),
        Space.gap, Text('Stand sedang menyiapkan makananmu.\nTinggal tunggu, lalu ambil saat sudah siap.',
          style: text.bodyMedium, textAlign: TextAlign.center),
        Space.block, SectionCard(child: Column(children: [
          Text('NOMOR PESANAN', style: text.labelSmall), Space.gap,
          Text('#KTK-89242', style: text.headlineLarge?.copyWith(color: AppColors.primary)),
          const Divider(), Text(order.menu.stand, style: text.titleMedium), Space.gap,
          Text('${order.quantity}× ${order.menu.name}', style: text.bodyMedium, textAlign: TextAlign.center),
          Space.gap, const StatusPill('⏱ Estimasi 10–15 menit'), Space.gap,
          Text('${order.pickup} • ${order.payment}', style: text.bodySmall),
        ])), Space.block,
        OrderSummary(order: order), Space.block,
        const SectionCard(color: AppColors.pale, child: Text('Tunjukkan nomor pesanan ini ke penjaga stand saat mengambil makananmu.')),
        Space.block, PrimaryAction(label: 'Kembali ke Beranda', onPressed: () => context.go('/home'),
          trailing: const Icon(Icons.home_outlined)), Space.block,
      ])));
  }
}
