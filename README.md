# KantinKu - UI Flutter Pertemuan 7

Lima layar pemesanan kantin kampus dengan data lokal dan navigasi go_router:
Login -> Beranda -> Detail Menu -> Form Pemesanan -> Pesanan Berhasil -> Beranda.

[Pull Request tugas 7](https://github.com/kelompok-g2/Kantinku---flutter/pull/4)
ditujukan ke branch dev dari feature/static-ui-screens.

## Menjalankan

Gunakan Flutter 3.47.7 / Dart 3.13.5 atau versi yang memenuhi pubspec.yaml.

```sh
flutter pub get
flutter run
```

Untuk browser: `flutter run -d chrome`. Pilih Android emulator/device yang
sudah menyala untuk screenshot Android. Layar login memakai validasi lokal:
isi NIM/email dan kata sandi minimal enam karakter. Contoh data demo:
NIM 21060189 dan kata sandi kantinku123. Ini bukan kredensial akun nyata.

Tidak ada autentikasi server, API Laravel, atau pembayaran sungguhan pada
pertemuan ini. SSO, pendaftaran dan unggah media belum terhubung ke layanan.

## Struktur

- lib/presentation/screens: lima layar utama.
- lib/presentation/widgets: tombol, input, card, kontrol jumlah dan bagian layar.
- lib/presentation/theme: warna, font, spacing dan ukuran komponen.
- lib/navigation: konfigurasi go_router.
- lib/models dan lib/repositories: model serta fixture menu lokal.
- lib/viewmodels: state dan perhitungan pemesanan.
- assets/figma dan assets/fonts: aset asli desain serta font lokal berlisensi OFL.

Arsitektur MVVM dan batas implementasi dijelaskan di [architecture](docs/architecture.md).
[Design tokens](docs/design_tokens.md) menghubungkan rancangan awal dengan theme
yang terlihat pada Figma. Detail dan Success merupakan pengembangan mengikuti
gaya yang sama atas persetujuan pengguna; [referensi](docs/p07/design_reference.md)
mencatat frame sumber dan pembagian pekerjaan.

## Verifikasi

```sh
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
```

Tes mencakup perhitungan diskon, batas jumlah, pencarian, validasi login, dan
flow lima layar pada lebar 320 serta 390 piksel. Semua file Dart di bawah
300 baris. PrimaryAction, LabeledField, SectionCard dan QuantityControl dipakai
lintas layar. Hasil pemeriksaan dan bukti pengumpulan dicatat di docs/p07.

## Workflow kelompok

Perubahan masuk melalui PR ke dev, direview anggota lain, lalu di-merge.
main tetap protected. Dilarang force push pada shared branch. Anggota reviewer
memeriksa flow dan kesesuaian desain; hasil review tidak boleh digantikan oleh
klaim dari AI. Setelah merge, clone/pull dev dan jalankan aplikasi kembali.
