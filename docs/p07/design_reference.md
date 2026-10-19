# Pertemuan 7 - Referensi desain dan micro-task

## Sumber dan scope
- Figma: https://www.figma.com/design/KuWGYTKH8PwGjCSSv8g7X6/Untitled
- Halaman: P03 - High Fidelity Mockup (0:1).
- Login Civitas: 99:1127, 390 x 884.
- Beranda Utama: 99:254, 390 x 3251.25 (konten dapat di-scroll).
- Katalog Menu: 99:769, 390 x 1774 (referensi card dan kategori).
- Konfirmasi Pesanan: 99:5, 390 x 1700.5 (referensi form pemesanan).
- Pengguna menyetujui melengkapi Detail Menu dan Pesanan Berhasil mengikuti gaya desain yang sama pada 17 Oktober 2026. Kedua layar tersebut merupakan pengembangan, bukan klaim frame Figma yang sudah ada.

## Keputusan implementasi
- Lima layar utama: Login -> Beranda -> Detail Menu -> Form Pemesanan -> Pesanan Berhasil -> Beranda.
- UI statis menggunakan data lokal; tidak memanggil backend Laravel atau API eksternal.
- go_router diwajibkan materi. flutter_svg diperlukan untuk merender SVG asli dari Figma tanpa mengganti ikon desain. Font Inter dan Plus Jakarta Sans dibundel lokal, bukan diunduh saat aplikasi berjalan.
- Struktur MVVM tetap dipertahankan. Model/fixture dan state terpisah dari lib/presentation/screens dan lib/presentation/widgets. UI lama baseline tidak menjadi sumber logika bisnis baru.
- Token lama menjadi referensi; warna dan font tambahan yang benar-benar ditemukan pada Figma dicatat terpusat di theme. Screen tidak menyimpan warna, ukuran font atau spacing literal.
- Gambar dan ikon desain disimpan sebagai aset lokal. Render seluruh frame Figma hanya untuk referensi pemeriksaan, tidak dipakai sebagai tampilan aplikasi.

## Micro-task (satu file/widget per langkah implementasi)
1. Catat referensi, scope dan kriteria verifikasi pada dokumen ini.
2. Konfigurasikan dependency dan aset/font pada pubspec.yaml; lockfile merupakan keluaran resolver, bukan edit manual.
3. Buat token/theme pada lib/presentation/theme/app_theme.dart.
4. Definisikan model menu dummy sesuai data kantin.
5. Buat repository fixture lokal yang menyediakan model tersebut.
6. Buat state pemesanan pada ViewModel terpisah.
7. Buat tombol aksi reusable.
8. Buat field form reusable.
9. Buat card/menu reusable.
10. Buat header/navigasi dan komponen bagian layar yang diperlukan.
11. Buat Login screen.
12. Buat Beranda screen.
13. Buat Detail Menu screen.
14. Buat Form Pemesanan screen.
15. Buat Pesanan Berhasil screen.
16. Buat GoRouter dan ubah entry point agar menggunakan theme/router.
17. Verifikasi flow dan ganti tes counter bawaan yang tidak sesuai aplikasi KantinKu.
18. Ambil lima screenshot emulator, video dua menit, dan ringkasan Git/PR untuk pengumpulan.

Setiap unit diverifikasi sebelum commit. Jangan membuat commit semu untuk mengejar
jumlah. Target minimal delapan commit atomic dalam PR feature/static-ui-screens ke dev.
File yang bergantung pada file lain diperiksa bersama setelah dependensinya tersedia;
jangan mengaku analyzer lulus jika impor belum dapat diselesaikan.

## Kriteria selesai
- Lima layar berjalan dan flow kembali ke Beranda berfungsi.
- Minimal tiga widget reusable, masing-masing dipakai minimal di dua tempat yang sesuai.
- Semua file Dart kurang dari 300 baris, tanpa TODO, print atau komentar sisa.
- Warna, font dan spacing screen berasal dari theme/token.
- flutter analyze dan flutter test lulus; build/run emulator diverifikasi nyata.
- Lima screenshot berasal dari emulator/device; browser tidak dilabeli emulator.
- Video navigasi sekitar dua menit; link Drive/YouTube dicantumkan setelah unggah nyata.
- PR direview anggota lain; setelah merge, dev diuji clone-run. Jangan membuat bukti review atau merge palsu.
- Unggahan LMS maksimal enam file: lima screenshot dan satu PDF history Git/PR serta checklist, maksimal 10 MB per file.
