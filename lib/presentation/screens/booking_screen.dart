import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/campus_menu.dart';
import '../../viewmodels/order_viewmodel.dart';
import '../theme/app_theme.dart';
import '../widgets/booking_items.dart';
import '../widgets/booking_options.dart';
import '../widgets/design_icon.dart';
import '../widgets/order_summary.dart';
import '../widgets/primary_action.dart';
import '../widgets/section_card.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key, required this.order});
  final OrderViewModel order;
  @override
  Widget build(BuildContext context) => ListenableBuilder(listenable: order, builder: (context, _) =>
    Scaffold(appBar: AppBar(title: const Text('Konfirmasi Pesanan')),
      body: SingleChildScrollView(padding: Space.padding, child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [Row(children: [Text('ID Pesanan #KTK-89242', style: Theme.of(context).textTheme.bodySmall),
          const Spacer(), const StatusPill('⏱ 10–15 menit', color: AppColors.blue, background: AppColors.pale)]),
          Space.block, SectionCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [DesignIcon('confirmation_02.svg'), Space.rowGap,
              Text('Ambil Sendiri'), Spacer(), StatusPill('Pickup')]),
            const Divider(), Row(children: [const DesignIcon('confirmation_04.svg'), Space.rowGap,
              Expanded(child: Text(order.menu.stand, style: Theme.of(context).textTheme.titleMedium)),
              const StatusPill('● Buka')]), Space.gap,
            const Text('Kantin Pusat FT UI • Stand 01\nPesanan disiapkan setelah konfirmasi.'),
          ])), Space.block,
          BookingItems(order: order, onAdd: () => context.go('/home')), Space.block,
          BookingOptions(order: order), Space.block, OrderSummary(order: order), Space.block,
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            DesignIcon('confirmation_21.svg'), Space.rowGap, Text('Pembayaran aman & terenkripsi')]),
          Space.block,
        ])),
      bottomNavigationBar: SafeArea(child: Container(color: AppColors.surface, padding: Space.padding,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('TOTAL SIAP BAYAR', style: Theme.of(context).textTheme.labelSmall),
          Row(children: [Text(rupiah(order.total), style: Theme.of(context).textTheme.headlineSmall),
            const Spacer(), StatusPill('Hemat ${rupiah(order.discount)}')]), Space.gap,
          PrimaryAction(label: 'Konfirmasi & Bayar Pesanan', onPressed: () {
            order.confirm(); context.go('/success');
          }, trailing: const DesignIcon('confirmation_22.svg')),
          Space.gap, Text('Pesanan akan diteruskan ke layar dapur stand.', style: Theme.of(context).textTheme.bodySmall),
        ]))),
    ));
}
