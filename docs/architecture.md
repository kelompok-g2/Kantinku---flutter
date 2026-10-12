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

## 7. Menjalankan Project
flutter pub get
flutter run -d chrome

## 8. Pemeriksaan Kode
flutter analyze
