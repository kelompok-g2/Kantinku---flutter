import 'package:flutter/material.dart';

import '../../viewmodels/order_viewmodel.dart';
import '../theme/app_theme.dart';
import 'design_icon.dart';
import 'section_card.dart';

class BookingOptions extends StatelessWidget {
  const BookingOptions({super.key, required this.order});
  final OrderViewModel order;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const DesignIcon('confirmation_11.svg'),
                Space.rowGap,
                Text(
                  'Waktu Pengambilan',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Space.gap,
            Text(
              'Pilih waktu yang pas dengan jadwal kuliahmu.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Space.gap,
            Wrap(
              spacing: Space.small,
              runSpacing: Space.small,
              children: [
                for (final (value, label) in [
                  ('Sekarang', 'Sekarang\n10–15 menit'),
                  ('Habis Kelas', 'Habis Kelas\n13:00 WIB'),
                  ('Atur Jam', 'Atur Jam\nPilih sendiri'),
                ])
                  ChoiceChip(
                    label: Text(label, textAlign: TextAlign.center),
                    selected: order.pickup == value,
                    onSelected: (_) async {
                      if (value == 'Atur Jam') {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 13, minute: 0),
                        );
                        if (time != null && context.mounted)
                          order.setPickup('Atur Jam ${time.format(context)}');
                      } else {
                        order.setPickup(value);
                      }
                    },
                  ),
              ],
            ),
            if (order.pickup.startsWith('Atur Jam ')) ...[
              Space.gap,
              Text(order.pickup),
            ],
          ],
        ),
      ),
      Space.block,
      SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const DesignIcon('confirmation_12.svg'),
                Space.rowGap,
                Text(
                  'Metode Pembayaran',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Space.gap,
            const StatusPill('QRIS Instant • Lebih praktis'),
            Space.gap,
            RadioGroup<String>(
              groupValue: order.payment,
              onChanged: (value) {
                if (value != null) order.setPayment(value);
              },
              child: Column(
                children: [
                  for (final (value, subtitle, asset) in [
                    (
                      'QRIS Instant',
                      'KantiPay / QRIS • Saldo Rp45.000',
                      'confirmation_13.svg',
                    ),
                    (
                      'GoPay',
                      'Bayar dari dompet digitalmu',
                      'confirmation_16.svg',
                    ),
                    (
                      'Tunai',
                      'Bayar saat ambil di stand',
                      'confirmation_17.svg',
                    ),
                  ])
                    RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(value),
                      subtitle: Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      secondary: DesignIcon(asset),
                      value: value,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      Space.block,
      const SectionCard(
        color: AppColors.peach,
        child: Row(
          children: [
            DesignIcon('confirmation_18.svg'),
            Space.rowGap,
            Expanded(
              child: Text(
                'KAMPUSKENYANG\nHemat Rp5.000 untuk belanja minimal Rp20.000',
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
