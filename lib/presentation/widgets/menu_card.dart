import 'package:flutter/material.dart';

import '../../models/campus_menu.dart';
import '../theme/app_theme.dart';
import 'design_icon.dart';
import 'section_card.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.menu,
    required this.onTap,
    this.compact = false,
  });
  final CampusMenu menu;
  final VoidCallback onTap;
  final bool compact;
  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: 'Lihat ${menu.name}',
    child: Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(Space.cardRadius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: compact
            ? _row(context)
            : SizedBox(
                width: Space.card,
                child: Padding(
                  padding: const EdgeInsets.all(Space.cardInset),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Space.radius),
                        child: Stack(
                          children: [
                            Image.asset(
                              menu.image,
                              width: double.infinity,
                              height: Space.photo,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: Space.small,
                              left: Space.small,
                              child: StatusPill(
                                '★ ${menu.rating} (280+)',
                                color: AppColors.brown,
                                background: AppColors.surface,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Space.gap,
                      _text(context),
                    ],
                  ),
                ),
              ),
      ),
    ),
  );
  Widget _text(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (compact)
        Text(
          '★ ${menu.rating} • ${menu.stand}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      Text(
        menu.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      if (!compact)
        Text(
          menu.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      Space.gap,
      Row(
        children: [
          Expanded(
            child: Text(
              rupiah(menu.price),
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(color: AppColors.primary),
            ),
          ),
          if (!compact)
            Container(
              width: Space.roomy,
              height: Space.roomy,
              decoration: const BoxDecoration(
                color: AppColors.brown,
                shape: BoxShape.circle,
              ),
              child: const Center(child: DesignIcon('home_15.svg')),
            ),
        ],
      ),
    ],
  );
  Widget _row(BuildContext context) => Padding(
    padding: Space.cardPadding,
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Space.radius),
          child: Image.asset(
            menu.image,
            width: Space.logo,
            height: Space.logo,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: Space.medium),
        Expanded(child: _text(context)),
        const Icon(Icons.add_circle, color: AppColors.primary),
      ],
    ),
  );
}
