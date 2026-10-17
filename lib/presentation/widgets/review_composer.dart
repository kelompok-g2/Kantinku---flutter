import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'design_icon.dart';
import 'labeled_field.dart';
import 'primary_action.dart';
import 'section_card.dart';

class ReviewComposer extends StatefulWidget {
  const ReviewComposer({super.key});
  @override
  State<ReviewComposer> createState() => _ReviewComposerState();
}

class _ReviewComposerState extends State<ReviewComposer> {
  final _impressions = <String>{'Enak Banget!', 'Harga Mahasiswa'};
  bool _anonymous = false, _sent = false;
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('Kesan Mahasiswa', style: Theme.of(context).textTheme.titleSmall), Space.gap,
    Wrap(spacing: Space.small, runSpacing: Space.small, children: [
      for (final label in ['Enak Banget!', 'Harga Mahasiswa', 'Porsi Pas', 'Pelayanan Ramah', 'Bakal Pesan Lagi'])
        FilterChip(label: Text(label), selected: _impressions.contains(label), onSelected: (selected) => setState(() {
          if (selected) { _impressions.add(label); } else { _impressions.remove(label); }
        })),
    ]), Space.block,
    const LabeledField(label: 'Ceritakan pengalamanmu', hint: 'Gimana rasa makanannya? Ada pesan untuk stand?', maxLines: 3),
    Space.block, Row(children: [ClipRRect(borderRadius: BorderRadius.circular(Space.radius),
      child: Image.asset('assets/figma/home_05.png', width: Space.logo, height: Space.logo, fit: BoxFit.cover)),
      Space.rowGap, Expanded(child: OutlinedButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unggah foto tersedia setelah penyimpanan media terhubung.'))),
        child: const Column(children: [DesignIcon('home_26.svg'), Text('Tambah Foto Lagi'),
          StatusPill('+10 KoinKantin')])))]),
    Space.block, Row(children: [const DesignIcon('home_27.svg'), Space.rowGap,
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Dimas Pratama', style: Theme.of(context).textTheme.labelMedium),
        Text('Teknik Komputer ’21', style: Theme.of(context).textTheme.bodySmall)])),
      Switch(value: _anonymous, onChanged: (value) => setState(() => _anonymous = value)),
    ]), Text('Aktifkan toggle bila ingin menyembunyikan identitas', style: Theme.of(context).textTheme.bodySmall),
    Space.block, const SectionCard(color: AppColors.peach, child: Row(children: [
      DesignIcon('home_28.svg'), Space.rowGap,
      Expanded(child: Text('Klaim Hadiah Review\nDapatkan voucher untuk pesanan berikutnya!'))])),
    Space.block, PrimaryAction(label: _sent ? 'Ulasan Tersimpan' : 'Kirim Ulasan Sekarang',
      trailing: const DesignIcon('home_29.svg'), onPressed: _sent ? null : () => setState(() => _sent = true)),
    Space.gap, const Center(child: Text('Nanti Saja')), Space.gap,
    const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      DesignIcon('home_30.svg'), Space.rowGap, DesignIcon('home_31.svg'), Space.rowGap, Text('ID #KTK-89241')]),
  ]);
}
