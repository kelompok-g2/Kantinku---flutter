import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/campus_menu.dart';
import '../../viewmodels/order_viewmodel.dart';
import '../theme/app_theme.dart';
import '../widgets/primary_action.dart';
import '../widgets/quantity_control.dart';
import '../widgets/section_card.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.order});
  final OrderViewModel order;
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: order,
    builder: (context, _) {
      final text = Theme.of(context).textTheme;
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Menu')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    order.menu.image,
                    width: double.infinity,
                    height: Space.detailPhoto,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: Space.page,
                    bottom: Space.page,
                    child: StatusPill(order.menu.badge),
                  ),
                ],
              ),
              Padding(
                padding: Space.padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const StatusPill('● Stand Buka'),
                        const Spacer(),
                        Text(
                          '★ ${order.menu.rating} (280+)',
                          style: text.labelMedium?.copyWith(
                            color: AppColors.brown,
                          ),
                        ),
                      ],
                    ),
                    Space.gap,
                    Text(order.menu.name, style: text.headlineMedium),
                    Space.gap,
                    Text(order.menu.stand, style: text.bodyMedium),
                    Space.gap,
                    Text(
                      rupiah(order.menu.price),
                      style: text.headlineSmall?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Space.block,
                    Text('Tentang menu', style: text.titleMedium),
                    Space.gap,
                    Text(order.menu.description, style: text.bodyMedium),
                    Space.block,
                    const SectionCard(
                      color: AppColors.pale,
                      child: Text(
                        '⏱ Siap dalam 10–15 menit\nAmbil di stand setelah pesanan siap.',
                      ),
                    ),
                    Space.block,
                    Text('Pilih level pedas', style: text.titleMedium),
                    Space.gap,
                    Wrap(
                      spacing: Space.small,
                      children: [
                        for (final spice in ['Tidak Pedas', 'Sedang', 'Pedas'])
                          ChoiceChip(
                            label: Text(spice),
                            selected: order.spice == spice,
                            onSelected: (_) => order.setSpice(spice),
                          ),
                      ],
                    ),
                    Space.block,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Jumlah pesanan',
                            style: text.titleMedium,
                          ),
                        ),
                        QuantityControl(
                          value: order.quantity,
                          onChanged: order.changeQuantity,
                        ),
                      ],
                    ),
                    Space.block,
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: Space.padding,
            child: PrimaryAction(
              label:
                  'Pesan Sekarang • ${rupiah(order.menu.price * order.quantity)}',
              onPressed: () => context.push('/booking'),
              trailing: const Icon(Icons.arrow_forward),
            ),
          ),
        ),
      );
    },
  );
}
