class CampusMenu {
  const CampusMenu({required this.id, required this.name, required this.stand,
    required this.price, required this.image, required this.category,
    required this.description, this.rating = '4.8', this.badge = 'Terlaris'});
  final String id, name, stand, image, category, description, rating, badge;
  final int price;
}

String rupiah(int amount) => 'Rp${amount.toString().replaceAllMapped(
  RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
