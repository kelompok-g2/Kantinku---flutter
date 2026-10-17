import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/campus_menu.dart';
import '../../repositories/campus_menu_repository.dart';
import '../theme/app_theme.dart';
import '../widgets/design_icon.dart';
import '../widgets/completed_order_review.dart';
import '../widgets/home_header.dart';
import '../widgets/home_navigation.dart';
import '../widgets/menu_card.dart';
import '../widgets/section_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scroll = ScrollController();
  final _menuKey = GlobalKey();
  String _query = '', _category = 'Semua';
  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _open(CampusMenu menu) => context.push('/menu/${menu.id}');
  void _showMenu() => Scrollable.ensureVisible(
    _menuKey.currentContext!,
    duration: const Duration(milliseconds: 350),
  );
  void _profile() => showModalBottomSheet<void>(
    context: context,
    builder: (context) => SafeArea(
      child: Padding(
        padding: Space.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Dimas Pratama',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Space.gap,
            const Text('Mahasiswa • Teknik Komputer ’21\nNIM 21060189'),
            Space.block,
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                this.context.go('/login');
              },
              child: const Text('Keluar dari akun'),
            ),
          ],
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final menus = const CampusMenuRepository().search(_query, _category);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            HomeHeader(onProfile: _profile),
            Expanded(
              child: SingleChildScrollView(
                controller: _scroll,
                padding: Space.padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        DesignIcon('home_11.svg'),
                        Space.rowGap,
                        StatusPill(
                          'NIM: 21060189',
                          color: AppColors.blue,
                          background: AppColors.pale,
                        ),
                        Spacer(),
                        StatusPill(
                          'Jam Istirahat Ramai',
                          color: AppColors.brown,
                          background: AppColors.peach,
                        ),
                      ],
                    ),
                    Space.gap,
                    Text('Halo, Dimas Pratama! 👋', style: text.headlineSmall),
                    Space.gap,
                    Text(
                      'Mau makan apa di Kantin Fakultas Teknik hari ini?',
                      style: text.bodyMedium,
                    ),
                    Space.block,
                    TextField(
                      onChanged: (value) {
                        setState(() => _query = value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Cari nasi goreng, es teh, ayam geprek...',
                        prefixIcon: Padding(
                          padding: Space.cardPadding,
                          child: DesignIcon('home_12.svg'),
                        ),
                        suffixIcon: Padding(
                          padding: Space.cardPadding,
                          child: DesignIcon('home_13.svg'),
                        ),
                      ),
                    ),
                    Space.block,
                    HomeHero(
                      onOrder: () => _open(CampusMenuRepository.menus.first),
                    ),
                    Space.block,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final (category, label) in [
                            ('Semua', 'Semua'),
                            ('Makanan Berat', '🍛 Makanan Berat'),
                            ('Minuman Dingin', '🥤 Minuman Dingin'),
                            ('Snack Camilan', '🍟 Snack Camilan'),
                            ('Paket Hemat', '⚡ Paket Hemat'),
                            ('Kopi Teh', '☕ Kopi Teh'),
                          ])
                            Padding(
                              padding: const EdgeInsets.only(
                                right: Space.small,
                              ),
                              child: ChoiceChip(
                                label: Text(label),
                                selected: _category == category,
                                onSelected: (_) =>
                                    setState(() => _category = category),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Space.block,
                    const StandStatus(),
                    Space.block,
                    SectionHeading(
                      'Menu Populer Hari Ini 🔥',
                      action: 'Lihat Semua',
                      onAction: _showMenu,
                    ),
                    Space.gap,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (final menu in CampusMenuRepository.menus.take(
                              3,
                            ))
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: Space.medium,
                                ),
                                child: MenuCard(
                                  menu: menu,
                                  onTap: () => _open(menu),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Space.block,
                    const CompletedOrderReview(),
                    Space.block,
                    SectionHeading('Rekomendasi Untukmu', key: _menuKey),
                    Space.gap,
                    if (menus.isEmpty)
                      const SectionCard(
                        child: Text(
                          'Belum ada menu untuk pencarian ini. Coba kata atau kategori lain.',
                        ),
                      ),
                    for (final menu in menus)
                      Padding(
                        padding: const EdgeInsets.only(bottom: Space.medium),
                        child: MenuCard(
                          menu: menu,
                          compact: true,
                          onTap: () => _open(menu),
                        ),
                      ),
                    Space.block,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeNavigation(
        onSelected: (index) {
          if (index == 0)
            _scroll.animateTo(
              0,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOut,
            );
          if (index == 1) _showMenu();
          if (index == 2 || index == 3) context.push('/booking');
          if (index == 4) _profile();
        },
      ),
    );
  }
}
