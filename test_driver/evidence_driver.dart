import 'dart:convert';
import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async {
  final directory = Directory('artifacts/p07')..createSync(recursive: true);
  final record = await Process.start('adb', [
    'shell',
    'screenrecord',
    '--time-limit',
    '125',
    '--size',
    '384x864',
    '--bit-rate',
    '1500000',
    '/sdcard/kantinku-p07.mp4',
  ]);
  final errors = <int>[];
  record.stdout.listen((_) {});
  record.stderr.listen(errors.addAll);
  final names = <String>[];
  await integrationDriver(
    onScreenshot: (name, bytes, [args]) async {
      if (bytes.length < 512 || bytes[0] != 137 || bytes[1] != 80) return false;
      await File('${directory.path}/$name.png').writeAsBytes(bytes);
      names.add(name);
      return true;
    },
    writeResponseOnFailure: true,
    responseDataCallback: (data) async {
      final exit = await record.exitCode.timeout(const Duration(seconds: 150));
      await File('${directory.path}/screenrecord.log')
          .writeAsString(utf8.decode(errors, allowMalformed: true));
      final pull = await Process.run('adb', [
        'pull',
        '/sdcard/kantinku-p07.mp4',
        '${directory.path}/Video-Demo-KantinKu.mp4',
      ]);
      final sdk = await Process.run('adb', ['shell', 'getprop', 'ro.build.version.sdk']);
      await File('${directory.path}/capture-metadata.json').writeAsString(
        const JsonEncoder.withIndent('  ').convert({
          'source_sha': Platform.environment['GITHUB_SHA'],
          'capture_method': 'Android integration_test screenshots and adb screenrecord',
          'automation': 'Real Android emulator; navigation driven by integration test',
          'android_api': sdk.stdout.toString().trim(),
          'screenshots': names,
          'record_exit': exit,
          'pull_exit': pull.exitCode,
        }),
      );
      if (exit != 0 || pull.exitCode != 0 || names.length != 5) {
        throw StateError(
          'Android evidence incomplete: ${names.length} screenshots, video $exit/${pull.exitCode}',
        );
      }
    },
  );
}
