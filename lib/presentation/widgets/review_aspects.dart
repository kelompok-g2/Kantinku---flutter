import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'design_icon.dart';
import 'section_card.dart';

class ReviewAspects extends StatelessWidget {
  const ReviewAspects({super.key});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (final pair in [
        [
          ('Rasa Sajian', '⭐⭐⭐⭐⭐ Lezat Sekali', 'home_21.svg'),
          ('Porsi & Kematangan', '🍲 Pas & Kenyang', 'home_22.svg'),
        ],
        [
          ('Kecepatan Stand', '⚡ Cepat Banget', 'home_23.svg'),
          ('Kebersihan & Staf', '✨ Ramah & Bersih', 'home_24.svg'),
        ],
      ])
        Padding(
          padding: const EdgeInsets.only(bottom: Space.small),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final (index, item) in pair.indexed) ...[
                if (index > 0) Space.rowGap,
                Expanded(
                  child: SectionCard(
                    color: AppColors.background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DesignIcon(item.$3),
                        Space.gap,
                        Text(
                          item.$1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Space.gap,
                        Text(
                          item.$2,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
    ],
  );
}
