import 'package:flutter/material.dart';
import '../../models/campus_menu.dart';
import '../theme/app_theme.dart';
import 'section_card.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.menu, required this.onTap, this.compact = false});
  final CampusMenu menu;
  final VoidCallback onTap;
  final bool compact;
  @override
  Widget build(BuildContext context) => Semantics(button: true, label: 'Lihat ${menu.name}',
    child: Material(color: AppColors.surface, borderRadius: BorderRadius.circular(Space.cardRadius),
      clipBehavior: Clip.antiAlias, child: InkWell(onTap: onTap,
        child: compact ? _row(context) : SizedBox(width: Space.card,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [Image.asset(menu.image, width: Space.card, height: Space.photo, fit: BoxFit.cover),
              Positioned(top: Space.small, left: Space.small, child: StatusPill(menu.badge))]),
            Padding(padding: Space.cardPadding, child: _text(context)),
          ])))));
  Widget _text(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('★ ${menu.rating} (280+)', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.brown)),
    Space.gap, Text(menu.name, maxLines: 2, overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleSmall),
    Text(menu.stand, style: Theme.of(context).textTheme.bodySmall), Space.gap,
    Text(rupiah(menu.price), style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primary)),
  ]);
  Widget _row(BuildContext context) => Padding(padding: Space.cardPadding, child: Row(children: [
    ClipRRect(borderRadius: BorderRadius.circular(Space.radius),
      child: Image.asset(menu.image, width: Space.logo, height: Space.logo, fit: BoxFit.cover)),
    const SizedBox(width: Space.medium), Expanded(child: _text(context)),
    const Icon(Icons.add_circle, color: AppColors.primary),
  ]));
}
