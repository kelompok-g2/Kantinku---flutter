# Design tokens KantinKu - Pertemuan 7

Rujukan awal: [design tokens Pertemuan 3](https://github.com/kelompok-g2/Kelompok-G/blob/01b319365076608ae72fbd4693d6a510c429449d/docs/design_tokens.md).
Implementasi UI memakai warna dan tipografi yang terlihat pada
[Figma kelompok](https://www.figma.com/design/KuWGYTKH8PwGjCSSv8g7X6/Untitled).
Nama produk mengikuti repository, KantinKu. Primary memakai primary-900 dari
rancangan awal; penambahan berikut menyesuaikan frame high fidelity.

| Token | Nilai | Penggunaan |
|---|---|---|
| primary | #1E3A8A | Tombol utama, promo, nominal |
| background | #F8F9FF | Latar layar |
| surface | #FFFFFF | Input dan card |
| ink | #011D35 | Judul |
| body | #444651 | Isi |
| muted | #757682 | Keterangan |
| pale | #EEF4FF | Pilihan dan panel informasi |
| border | #DBE2F0 | Garis card/input |
| blue | #0058BE | Tautan dan informasi |
| green / mint | #047857 / #ECFDF5 | Status berhasil/buka |
| amber | #F59E0B | Penilaian dan aksen |
| brown / peach | #6E2D00 / #FFF1E6 | Promo dan status ramai |

Heading memakai Plus Jakarta Sans, body memakai Inter. Font dibundel lokal
beserta lisensi OFL. Skala teks 10, 12, 14, 16, 18, 20, 24 dan 28 piksel
ditetapkan melalui TextTheme, lalu dibaca widget dari Theme.of(context).

Spacing utama 4, 8, 12, 16, 20, 24, 32 dan 40 piksel. Radius 12 untuk input,
16 untuk card, 99 untuk pill. Tombol utama minimum 48 piksel. Ukuran gambar
dan batas lebar layout yang spesifik pada Figma juga dipusatkan di Space.

Satu sumber nilai implementasi: `lib/presentation/theme/app_theme.dart`.
Screen membaca theme dan token, tanpa literal warna, ukuran font atau spacing.
SVG asli mempertahankan ukuran intrinsik. Gambar raster dipotong melalui
BoxFit.cover sesuai slot; seluruh aset tersedia lokal di assets/figma.
