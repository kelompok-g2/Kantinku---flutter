import '../models/campus_menu.dart';

class CampusMenuRepository {
  const CampusMenuRepository();
  static const menus = [
    CampusMenu(
      id: 'ayam-geprek',
      name: 'Ayam Geprek Sambal Korek',
      stand: 'Kantin Bu Siti',
      price: 16000,
      image: 'assets/figma/home_01.png',
      category: 'Makanan Berat',
      description: 'Ayam crispy dengan sambal bawang segar, nasi hangat, dan lalapan. Porsi pas untuk menemani istirahat kuliah.',
    ),
    CampusMenu(
      id: 'nasi-goreng',
      name: 'Nasi Goreng Spesial Kantin',
      stand: 'Nasi Goreng Pak Budi',
      price: 15000,
      image: 'assets/figma/home_02.png',
      category: 'Makanan Berat',
      description: 'Nasi goreng dengan telur, sayuran segar, dan bumbu khas. Dimasak hangat saat pesanan disiapkan.',
      badge: 'Favorit',
    ),
    CampusMenu(
      id: 'kopi-susu',
      name: 'Es Kopi Susu Aren Kampus',
      stand: 'Kopi Kencana',
      price: 12000,
      image: 'assets/figma/home_03.png',
      category: 'Minuman Dingin',
      description: 'Kopi susu creamy dengan manis gula aren. Teman segar untuk hari kuliah yang padat.',
      badge: 'Pilihanmu',
    ),
    CampusMenu(
      id: 'mie-ayam',
      name: 'Mie Ayam Bakso',
      stand: 'Mie Ayam Pak Slamet',
      price: 14000,
      image: 'assets/figma/home_07.png',
      category: 'Makanan Berat',
      description:
          'Mie lembut dengan topping ayam gurih, bakso dan kuah hangat.',
      badge: 'Rekomendasi',
    ),
    CampusMenu(
      id: 'es-teh',
      name: 'Es Teh Manis Segar',
      stand: 'Kantin Bu Siti',
      price: 4000,
      image: 'assets/figma/home_08.png',
      category: 'Minuman Dingin',
      description: 'Teh pilihan dengan rasa manis dan es yang menyegarkan.',
      badge: 'Hemat',
    ),
  ];
  CampusMenu? find(String id) {
    for (final menu in menus) {
      if (menu.id == id) return menu;
    }
    return null;
  }

  List<CampusMenu> search(String query, String category) => menus
      .where(
        (menu) =>
            (category == 'Semua' || menu.category == category) &&
            '${menu.name} ${menu.stand}'.toLowerCase().contains(
              query.toLowerCase(),
            ),
      )
      .toList();
}
