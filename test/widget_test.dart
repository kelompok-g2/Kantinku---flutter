import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kantinku_flutter/main.dart';

void main() {
  testWidgets(
    'Login validates fields and complete five-screen order flow works',
    (tester) async {
      final semantics = tester.ensureSemantics();
      addTearDown(semantics.dispose);
      tester.view.physicalSize = const Size(390, 884);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const KantinKuApp());
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Masuk ke KantinKu'));
      await tester.tap(find.text('Masuk ke KantinKu'));
      await tester.pumpAndSettle();
      expect(find.text('Isi email atau NIM dulu.'), findsOneWidget);
      await tester.enterText(find.byType(TextFormField).at(0), '21060189');
      await tester.enterText(find.byType(TextFormField).at(1), 'kantinku123');
      await tester.ensureVisible(find.text('Masuk ke KantinKu'));
      await tester.tap(find.text('Masuk ke KantinKu'));
      await tester.pumpAndSettle();
      expect(find.text('Halo, Dimas Pratama! 👋'), findsOneWidget);
      await tester.tap(find.bySemanticsLabel('Pesan Sekarang'));
      await tester.pumpAndSettle();
      expect(find.text('Detail Menu'), findsOneWidget);
      await tester.tap(find.textContaining('Pesan Sekarang •'));
      await tester.pumpAndSettle();
      expect(find.text('Konfirmasi Pesanan'), findsOneWidget);
      await tester.tap(find.text('Konfirmasi & Bayar Pesanan'));
      await tester.pumpAndSettle();
      expect(find.text('Yeay, pesananmu masuk!'), findsOneWidget);
      await tester.ensureVisible(find.text('Kembali ke Beranda'));
      await tester.tap(find.text('Kembali ke Beranda'));
      await tester.pumpAndSettle();
      expect(find.text('Halo, Dimas Pratama! 👋'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
