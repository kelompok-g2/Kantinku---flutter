import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'design_icon.dart';
import 'section_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.onProfile});
  final VoidCallback onProfile;
  @override
  Widget build(BuildContext context) => Container(color: AppColors.surface,
    padding: Space.padding, child: Row(children: [
      Image.asset('assets/figma/home_09.png', width: Space.roomy, height: Space.roomy),
      Space.rowGap, Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('KantinKu', style: Theme.of(context).textTheme.titleLarge),
        Row(children: [const DesignIcon('home_36.svg'), Space.rowGap,
          Text('Kantin Pusat FT UI', style: Theme.of(context).textTheme.bodySmall),
          Space.rowGap, const DesignIcon('home_37.svg')]),
      ])),
      IconButton(tooltip: 'Profil Dimas', onPressed: onProfile,
        icon: ClipOval(child: Image.asset('assets/figma/home_10.png', width: Space.avatar, height: Space.avatar))),
    ]));
}

class HomeHero extends StatelessWidget {
  const HomeHero({super.key, required this.onOrder});
  final VoidCallback onOrder;
  @override
  Widget build(BuildContext context) => ClipRRect(borderRadius: BorderRadius.circular(Space.cardRadius),
    child: Container(color: AppColors.primary, padding: Space.padding, child: Row(children: [
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const StatusPill('FLASH DEAL ⚡', color: AppColors.surface, background: AppColors.brown),
        Space.gap,
        Text('Promo Mahasiswa 25%', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.surface)),
        Text('Paket Komplit: Geprek + Es Teh…', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.surface)),
        Space.gap, Row(children: [const DesignIcon('home_14.svg'), Space.rowGap,
          Text('KAMPUSKENYANG', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.surface)),
        ]),
      ])), Space.rowGap,
      Semantics(button: true, label: 'Pesan Sekarang', child: InkWell(onTap: onOrder,
        child: ClipRRect(borderRadius: BorderRadius.circular(Space.radius),
          child: Image.asset('assets/figma/home_00.png', width: Space.heroPhoto, height: Space.heroPhoto, fit: BoxFit.cover)))),
    ])));
}

class StandStatus extends StatelessWidget {
  const StandStatus({super.key});
  @override
  Widget build(BuildContext context) => SectionCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text('STATUS STAND KANTIN HARI INI', style: Theme.of(context).textTheme.labelSmall),
      Space.gap, Row(children: [for (final (name, status) in [
        ('Kantin Bu Siti', '● Buka'), ('Geprek Juara', '● Buka'), ('Kopi Kencana', '● Ramai')])
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: Theme.of(context).textTheme.labelSmall), Space.gap,
          StatusPill(status, color: status.contains('Ramai') ? AppColors.brown : AppColors.green,
            background: status.contains('Ramai') ? AppColors.peach : AppColors.mint),
        ]))]),
    ]));
}
