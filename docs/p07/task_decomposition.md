# Task decomposition - UI statis KantinKu

Dokumen ini mencatat batas setiap unit implementasi, bukan transkrip percakapan
anggota. Konteks bersama: agents.md, project_guidelines.md, architecture.md,
design_tokens.md dan frame Figma pada design_reference.md.

Setiap unit memiliki satu output utama. Helper layar dipisahkan sebagai widget
agar file tetap kurang dari 300 baris. Integrasi dan perbaikan lintas file
dilakukan sesudah unit yang saling bergantung tersedia.

| Unit | Output utama | Referensi dan batas | Kriteria verifikasi |
|---|---|---|---|
| Dependency | pubspec.yaml | go_router untuk navigasi, flutter_svg untuk ikon asli; font lokal | Resolver menghasilkan lockfile dan aset dapat dimuat |
| Theme | presentation/theme/app_theme.dart | Warna dan tipografi Figma; pusatkan spacing | Screen menggunakan TextTheme, AppColors dan Space |
| Model | models/campus_menu.dart | Data tampilan menu lokal; pertahankan model API baseline | Model immutable dan format rupiah teruji |
| Fixture | repositories/campus_menu_repository.dart | Data menu yang terlihat pada Figma; tanpa HTTP | Pencarian nama/stand dan kategori teruji |
| State | viewmodels/order_viewmodel.dart | Pilihan jumlah, level pedas, pickup dan pembayaran lokal | Batas 1-10, diskon dan total teruji |
| Tombol | presentation/widgets/primary_action.dart | Tombol utama Figma; callback dari screen | Dipakai Login, Detail, Booking dan Success |
| Input | presentation/widgets/labeled_field.dart | Label/input dari Login dan catatan pesanan | Validasi login dan input catatan berfungsi |
| Card | presentation/widgets/section_card.dart | Surface, radius dan border dari theme | Dipakai lintas layar; ink ListTile tetap terlihat |
| Menu | presentation/widgets/menu_card.dart | Foto dan card dari Home/Katalog | Menu dapat dibuka dan daftar dapat di-scroll |
| Login | presentation/screens/login_screen.dart | Frame 99:1127; tanpa autentikasi server | Input kosong ditolak; input demo membuka Home |
| Home | presentation/screens/home_screen.dart | Frame 99:254; fixture lokal dan komponen bagian layar | Cari/filter menu, buka detail dan navigasi bawah |
| Detail | presentation/screens/detail_screen.dart | Pengembangan disetujui, mengikuti gaya Figma | Level pedas/jumlah berubah dan checkout terbuka |
| Booking | presentation/screens/booking_screen.dart | Frame 99:5; tidak memproses uang nyata | Minuman, waktu, pembayaran dan total dapat berubah |
| Success | presentation/screens/success_screen.dart | Pengembangan disetujui; ringkasan lokal | Nomor pesanan tampil dan kembali ke Home |
| Routing | navigation/app_router.dart | Lima rute go_router; ID menu tidak dikenal ditangani | Flow lengkap dan kembali ke Home lulus tes |
| Tes | test/widget_test.dart | Font lokal dan viewport 320/390 piksel | Dua flow UI, termasuk validasi, tanpa exception |
| Build | .github/workflows/p07-flutter.yml | Checkout kode PR, SDK terikat versi, izin contents:read | Formatter, analyzer, test dan build APK dijalankan |

Path tabel relatif terhadap lib, kecuali pubspec, test dan .github.
Tidak ada backend/API yang dipanggil atau kontrak Laravel yang diubah.
Hasil tes nyata dan artefak build dibedakan dari review anggota kelompok.
