# Panduan proyek KantinKu — Flutter

## Konteks dan struktur
Dokumentasi tugas terdahulu dan perbedaan terhadap kode dicatat di [kesesuaian konteks](context_alignment.md).
Repo ini menggunakan MVVM. Baca [arsitektur](architecture.md) dan
[aturan AI](../agents.md). View di lib/views, state di lib/viewmodels, akses data di lib/repositories, model di lib/models. Jangan memanggil HTTP langsung dari View. MenuRepository baseline mengembalikan daftar kosong; integrasi API belum dibuat.

Baseline yang diperiksa: 1b58384917ec99afe131423ab4df7312475a9f2e.
Panduan menetapkan alur kerja; pelaksanaannya dicatat di [checklist](pertemuan6_checklist.md).

## Setup laptop
Clone repo ke folder pilihan, masuk ke root dan cek git status --short --branch.
Jangan menyalin kredensial teman. Instal dependensi dari lockfile yang tersedia.
SDK Dart harus memenuhi pubspec.yaml (saat ini ^3.13.3). Cek flutter --version dan flutter doctor, lalu flutter pub get dan flutter run -d chrome. Menu kosong adalah kondisi baseline. test/widget_test.dart masih menguji counter bawaan yang tidak ada pada UI KantinKu; jangan klaim tes lulus.

## Konvensi
Gunakan nama deskriptif, perubahan kecil dan gaya kode bawaan proyek.
Perbarui docs/architecture.md jika alur atau struktur berubah.
Jangan memasukkan rahasia, log lokal atau dependency hasil instalasi ke Git.

## Branch dan PR
- main: versi stabil, wajib protected dan menerima perubahan melalui PR.
- dev: integrasi kelompok, dibuat dari main awal jika belum ada.
- feature/context-management: aturan dan panduan Pertemuan 6; pekerjaan lain memakai feature/nama-singkat.
- Awali fitur dari dev terbaru: git fetch origin, git switch dev, git pull --ff-only, lalu git switch -c feature/nama-singkat.
- Tinjau diff, verifikasi, stage file spesifik, commit deskriptif, lalu push feature branch tanpa force.
- PR feature/* menuju dev diperiksa anggota lain dan di-merge setelah perbaikan.
- PR dev menuju main juga memerlukan review anggota lain.
- Pertahankan feature/context-management sampai screenshot struktur branch direkam.
- Selesaikan konflik di feature branch; jangan force push main/dev.

## Proteksi main — admin repo
Aktifkan branch protection/ruleset untuk main: wajib PR, minimal satu approving review,
dismiss approval saat commit baru, dan percakapan review terselesaikan.
Larang force push dan deletion; terapkan pada admin bila tersedia dan periksa bypass.
Simpan screenshot pengaturan aktif. Keberadaan panduan ini tidak membuktikan proteksi aktif.
Jika izin/paket GitHub membatasi fitur, catat dan minta admin menanganinya tanpa
mengubah visibilitas repo sepihak.

## Verifikasi sebelum PR
Pemeriksaan aplikasi: flutter pub get; dart format --output=none --set-exit-if-changed lib test; flutter analyze; flutter test.
Dokumentasi diperiksa konsistensi arsitektur, tautan relatif dan git diff --check.
Perubahan aplikasi membutuhkan pemeriksaan perilaku yang relevan.
Tulis BELUM DIJALANKAN beserta alasan bila pemeriksaan terhalang.

## Rules AI aktif dan log
Codex menemukan AGENTS.override.md dan diarahkan membaca agents.md.
Buka repo sebagai root proyek dan mulai sesi baru; sesi lama belum tentu memuat file baru.
Minta AI menyebut sumber instruksi dan batas arsitektur, lalu rekam screenshot hasil aktual
pada masing-masing repo. Lakukan tes perilaku; file rules saja bukan bukti kepatuhan.
Referensi: https://learn.chatgpt.com/docs/agent-configuration/agents-md

Gunakan Prompt 2 dan Prompt 3 persis dari dosen. Untuk setiap repo catat prompt, respons,
tindakan/file/diff, waktu, commit dan hasil kepatuhan. PDF satu halaman dibuat setelah
tes benar-benar berlangsung. Jangan menulis hasil lulus sebelum ada bukti.

## Rollback
Ikuti [rencana rollback](rollback_demo.md) setelah nomor skenario cocok dengan petunjuk dosen.
Perubahan rusak hanya di feature/rollback-demo, jangan main/dev.
Untuk commit shared, gunakan revert dan PR. Perubahan belum di-commit hanya boleh di-restore
pada file demo yang sengaja diubah setelah meninjau diff; jangan hilangkan pekerjaan lain.

## Kriteria selesai
Artefak kedua repo terunggah; main/dev/feature terlihat; main benar-benar protected;
minimal satu PR direview anggota lain dan merged; screenshot aktual lengkap;
PDF satu halaman memakai Prompt 2/3 asli; video tiga menit mengikuti skenario dosen;
online text memakai permalink commit serta URL PR/video yang dapat diakses.
