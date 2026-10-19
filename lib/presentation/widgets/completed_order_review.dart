import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'design_icon.dart';
import 'review_aspects.dart';
import 'review_composer.dart';
import 'section_card.dart';

class CompletedOrderReview extends StatefulWidget {
  const CompletedOrderReview({super.key});
  @override
  State<CompletedOrderReview> createState() => _CompletedOrderReviewState();
}

class _CompletedOrderReviewState extends State<CompletedOrderReview> {
  int _rating = 5;
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const DesignIcon('home_16.svg'),
              Space.rowGap,
              Expanded(child: Text('Pesanan Selesai Dinikmati', style: text.titleSmall)),
            ],
          ),
          Space.gap,
          Text('Hari ini, 12:15 WIB', style: text.bodySmall),
          Space.block,
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Space.radius),
                child: Image.asset(
                  'assets/figma/home_04.png',
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
                    Text('Paket Ayam Geprek Sambal Korek', style: text.titleSmall),
                    Row(
                      children: [
                        const DesignIcon('home_17.svg'),
                        Space.rowGap,
                        Expanded(child: Text('Stand 01 - Bu Siti (FTUI)', style: text.bodySmall)),
                      ],
                    ),
                    Text('Rp20.000 • 2 Menu', style: text.labelMedium),
                  ],
                ),
              ),
            ],
          ),
          Space.block,
          const Divider(),
          Space.block,
          const Center(child: DesignIcon('home_19.svg')),
          Space.gap,
          Text(
            'Bagaimana pengalaman\npesananmu?',
            style: text.headlineMedium,
            textAlign: TextAlign.center,
          ),
          Space.gap,
          Row(
            children: [
              const DesignIcon('home_18.svg'),
              Space.rowGap,
              Expanded(
                child: Text(
                  'Bantu kantin Bu Siti dan civitas kampus lainnya dengan memberikan penilaian jujurmu.',
                  style: text.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Space.gap,
          Center(
            child: Wrap(
              children: [
                for (var i = 1; i <= 5; i++)
                  IconButton(
                    tooltip: '$i bintang',
                    onPressed: () => setState(() => _rating = i),
                    icon: Opacity(
                      opacity: i <= _rating ? 1 : 0.3,
                      child: const DesignIcon('home_20.svg'),
                    ),
                  ),
              ],
            ),
          ),
          Center(
            child: Text(
              _rating == 5 ? 'Sangat Puas!' : '$_rating dari 5 bintang',
              style: text.labelLarge,
            ),
          ),
          Space.block,
          const ReviewAspects(),
          Space.block,
          const ReviewComposer(),
        ],
      ),
    );
  }
}
