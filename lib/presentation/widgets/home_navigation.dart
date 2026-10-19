import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'design_icon.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({super.key, required this.onSelected});
  final ValueChanged<int> onSelected;
  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: Space.small),
      color: AppColors.surface,
      child: Row(
        children: [
          for (final (index, label, asset) in [
            (0, 'Beranda', 'home_38.svg'),
            (1, 'Menu', 'home_39.svg'),
            (2, 'Pesanan', 'home_40.svg'),
            (3, 'Keranjang', 'home_41.svg'),
            (4, 'Profil', 'home_42.svg'),
          ])
            Expanded(
              child: InkWell(
                onTap: () => onSelected(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: Space.small),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DesignIcon(asset),
                      Space.gap,
                      Text(
                        label,
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(color: index == 0 ? AppColors.primary : AppColors.muted),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
