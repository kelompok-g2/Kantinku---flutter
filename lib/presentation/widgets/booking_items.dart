import 'package:flutter/material.dart';

import '../../models/campus_menu.dart';
import '../../viewmodels/order_viewmodel.dart';
import '../theme/app_theme.dart';
import 'design_icon.dart';
import 'labeled_field.dart';
import 'quantity_control.dart';
import 'section_card.dart';

class BookingItems extends StatelessWidget {
  const BookingItems({super.key, required this.order, required this.onAdd});
  final OrderViewModel order;
  final VoidCallback onAdd;
  @override
  Widget build(BuildContext context) => SectionCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const DesignIcon('confirmation_06.svg'),
            Space.rowGap,
            Text(
              'Pesanan Kamu',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        Space.block,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Space.radius),
              child: Image.asset(
                order.menu.id == 'ayam-geprek'
                    ? 'assets/figma/confirmation_00.png'
                    : order.menu.image,
                width: Space.logo,
                height: Space.logo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: Space.medium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.menu.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Level: ${order.spice}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Space.gap,
                  Text(
                    rupiah(order.menu.price),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: QuantityControl(
            value: order.quantity,
            onChanged: order.changeQuantity,
          ),
        ),
        const Divider(),
        Row(
          children: [
            const SectionCardIcon(),
            const SizedBox(width: Space.medium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Es Teh Manis',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Normal • Dingin',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    rupiah(4000),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Checkbox(
              value: order.includeDrink,
              onChanged: (value) => order.setDrink(value ?? false),
            ),
          ],
        ),
        Space.gap,
        Center(
          child: OutlinedButton.icon(
            onPressed: onAdd,
            icon: const DesignIcon('confirmation_09.svg'),
            label: const Text('Tambah Menu Lain'),
          ),
        ),
        Space.block,
        LabeledField(
          label: 'Catatan untuk stand',
          hint: 'Contoh: sambal dipisah ya, Bu.',
          onChanged: (value) => order.notes = value,
          leading: const DesignIcon('confirmation_10.svg'),
        ),
      ],
    ),
  );
}

class SectionCardIcon extends StatelessWidget {
  const SectionCardIcon({super.key});
  @override
  Widget build(BuildContext context) => Container(
    width: Space.logo,
    height: Space.logo,
    decoration: BoxDecoration(
      color: AppColors.pale,
      borderRadius: BorderRadius.circular(Space.radius),
    ),
    child: const Center(child: DesignIcon('confirmation_08.svg')),
  );
}
