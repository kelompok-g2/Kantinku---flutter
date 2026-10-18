import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kantinku_flutter/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Android five-screen navigation and evidence', (tester) async {
    final semantics = tester.ensureSemantics();
    try {
      app.main();
      await tester.pumpAndSettle();
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
      await binding.takeScreenshot('01-Login');
      await Future<void>.delayed(const Duration(seconds: 20));

      await tester.enterText(find.byType(TextFormField).at(0), '21060189');
      await tester.enterText(find.byType(TextFormField).at(1), 'kantinku123');
      FocusManager.instance.primaryFocus?.unfocus();
      await SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Masuk ke KantinKu'));
      await tester.tap(find.text('Masuk ke KantinKu'));
      await tester.pumpAndSettle();
      expect(find.text('Halo, Dimas Pratama! 👋'), findsOneWidget);
      await binding.takeScreenshot('02-Beranda');
      await Future<void>.delayed(const Duration(seconds: 20));

      await tester.tap(find.bySemanticsLabel('Pesan Sekarang'));
      await tester.pumpAndSettle();
      expect(find.text('Detail Menu'), findsOneWidget);
      await binding.takeScreenshot('03-Detail-Menu');
      await Future<void>.delayed(const Duration(seconds: 20));

      await tester.tap(find.textContaining('Pesan Sekarang •'));
      await tester.pumpAndSettle();
      expect(find.text('Konfirmasi Pesanan'), findsOneWidget);
      await binding.takeScreenshot('04-Form-Pemesanan');
      await Future<void>.delayed(const Duration(seconds: 25));

      await tester.tap(find.text('Konfirmasi & Bayar Pesanan'));
      await tester.pumpAndSettle();
      expect(find.text('Yeay, pesananmu masuk!'), findsOneWidget);
      await binding.takeScreenshot('05-Pesanan-Berhasil');
      await Future<void>.delayed(const Duration(seconds: 15));

      await tester.ensureVisible(find.text('Kembali ke Beranda'));
      await tester.tap(find.text('Kembali ke Beranda'));
      await tester.pumpAndSettle();
      expect(find.text('Halo, Dimas Pratama! 👋'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await Future<void>.delayed(const Duration(seconds: 25));
    } finally {
      semantics.dispose();
    }
  }, timeout: const Timeout(Duration(minutes: 6)));
}
