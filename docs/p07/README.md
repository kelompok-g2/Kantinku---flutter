# Bukti tugas 7 KantinKu

**[Unduh semua bukti dalam satu ZIP](Paket-Tugas-7-KantinKu.zip)**

1. Buka ZIP, lalu folder **01-Unggah-LMS**: unggah lima PNG dan satu PDF.
2. Video ada di **02-Video**; tautan dan status pengumpulan ada di **03-Online-Text.txt**.
3. Review anggota dan merge menunggu anggota aktif kembali, sesuai arahan pengguna.

## Hasil aktual, 19 Oktober 2026

- Lima layar statis dan alur Login -> Beranda -> Detail Menu -> Form Pemesanan -> Pesanan Berhasil -> Beranda berjalan.
- [PR #4](https://github.com/kelompok-g2/Kantinku---flutter/pull/4): feature/static-ui-screens menuju dev, masih terbuka.
- [GitHub Actions](https://github.com/kelompok-g2/Kantinku---flutter/actions/runs/39102795924): format, analyzer, lima tes unit/widget, build APK dan tes integrasi Android lulus.
- Screenshot berasal dari emulator Android API 29, 390 x 884 saat pengujian. PNG menangkap surface aplikasi; area OS dapat berbeda.
- Video asli dari adb screenrecord, 146.4 detik. Navigasi digerakkan integration test; bukan rekayasa frame aplikasi.
- Snapshot implementasi: `38e3c513e5f63a3390dbca150584591993675ea7`, 25 commit. Commit pengarsipan bukti ditambahkan sesudah snapshot.
- Semua file Dart di bawah 300 baris; terbesar 240 baris. Warna, font dan spacing terpusat di theme.
- Detail Menu dan Pesanan Berhasil merupakan pengembangan dengan gaya Figma yang sama, disetujui pengguna.

## Berkas langsung

- [Login](evidence/01-Login.png)
- [Beranda](evidence/02-Beranda.png)
- [Detail Menu](evidence/03-Detail-Menu.png)
- [Form Pemesanan](evidence/04-Form-Pemesanan.png)
- [Pesanan Berhasil](evidence/05-Pesanan-Berhasil.png)
- [PDF riwayat Git, PR dan checklist](evidence/06-Laporan-Git-PR-Checklist.pdf)
- [Video demo Android](evidence/Video-Demo-KantinKu.mp4)
- [Online text](Online-Text.txt)
- [Metadata verifikasi dan hash bukti](evidence/Verifikasi-Aktual.json)
- [Pembagian unit pekerjaan](task_decomposition.md)

## Status yang belum selesai

Review manusia, merge dan clone-run dev setelah merge belum dilakukan.
Video tersedia di GitHub; belum diunggah ke Drive/YouTube. Tautan layanan tersebut
perlu ditambahkan sebelum pengumpulan final LMS. Tidak ada klaim review atau
pengumpulan LMS otomatis pada paket ini.

## Mengulang pengambilan bukti

Workflow `.github/workflows/p07-flutter.yml` memakai Flutter 3.47.7 dan emulator API 29.
`integration_test/app_flow_test.dart` menavigasi layar dan mengambil screenshot
Android. `test_driver/evidence_driver.dart` menyimpan PNG asli dan menarik rekaman
adb dari emulator. Dua snapshot tambahan memverifikasi kembali ke Beranda;
hanya lima screenshot layar utama dimasukkan dalam enam berkas unggahan LMS.
SHA pada metadata capture adalah checkout merge sementara milik run PR GitHub;
SHA implementasi pada verifikasi adalah head feature branch yang diuji.
