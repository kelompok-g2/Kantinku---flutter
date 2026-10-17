# Arsitektur Aplikasi KantinKu - Flutter

## 1. Deskripsi Project
KantinKu adalah aplikasi pemesanan makanan dan minuman kantin kampus berbasis Flutter.

## 2. Arsitektur MVVM
Project menggunakan pola Model-View-ViewModel (MVVM) untuk memisahkan data, antarmuka, dan logika aplikasi.

## 3. Struktur Folder

lib/
- main.dart
- models/
  - menu_model.dart
- repositories/
  - menu_repository.dart
- services/
- viewmodels/
  - menu_viewmodel.dart
- views/
  - menu_view.dart

## 4. Penjelasan Komponen
- Model: Mendefinisikan struktur data menu.
- View: Menampilkan antarmuka aplikasi.
- ViewModel: Mengelola state dan logika tampilan.
- Repository: Menyediakan akses data untuk ViewModel.
- Services: Disiapkan untuk komunikasi REST API Laravel.

## 5. Alur Data
View -> ViewModel -> Repository -> REST API Laravel

Data hasil permintaan dikembalikan melalui Repository dan ViewModel untuk ditampilkan oleh View.

## 6. Status Implementasi
- Struktur dasar MVVM telah dibuat.
- Halaman utama dan halaman menu dapat dijalankan.
- Repository menu masih mengembalikan daftar kosong.
- Integrasi REST API Laravel belum dilakukan.

## Pertemuan 7: presentation dan data lokal

Implementasi UI statis berada pada branch `feature/static-ui-screens`.
`lib/presentation/screens` menggantikan peran View untuk lima layar baru;
`lib/presentation/widgets` berisi komponen lintas layar dan bagian tampilan.
`lib/presentation/theme/app_theme.dart` memusatkan warna, tipografi, spacing
dan ukuran komponen sesuai Figma. View lama tetap menjadi baseline historis.

Alur baru: Screen -> OrderViewModel -> CampusMenuRepository -> CampusMenu.
`CampusMenuRepository` menyediakan fixture lokal, tanpa HTTP. Repository dan
model baseline tetap terpisah agar integrasi API berikutnya tidak tercampur.
`OrderViewModel` mengelola pilihan jumlah, level pedas, minuman, waktu ambil,
metode pembayaran dan perhitungan total lokal. Tidak ada transaksi pembayaran
atau autentikasi server pada pertemuan ini.

`lib/navigation/app_router.dart` memakai go_router untuk
`/login` -> `/home` -> `/menu/:id` -> `/booking` -> `/success` -> `/home`.
Rute menu tidak dikenal kembali ke Beranda. Rute success hanya ditampilkan
setelah konfirmasi lokal. Login hanya memeriksa kelengkapan input lokal.

Komponen reusable yang dipakai di beberapa tempat: PrimaryAction,
LabeledField, SectionCard, StatusPill, MenuCard dan QuantityControl.
Inter dan Plus Jakarta Sans serta aset asli Figma dibundel dalam `assets`.
Referensi frame dan persetujuan dua layar tambahan dicatat pada
[referensi P07](p07/design_reference.md).

## 7. Menjalankan Project
flutter pub get
flutter run -d chrome

## 8. Pemeriksaan Kode
flutter analyze
