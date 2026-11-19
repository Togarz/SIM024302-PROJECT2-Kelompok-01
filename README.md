# Proyek 2 - Modul Otomasi Administrasi (P11)

## 1. Deskripsi
Proyek ini merupakan implementasi modul otomasi administrasi Linux untuk melakukan backup direktori secara otomatis menggunakan Bash dan utilitas tar.

Sistem membuat arsip berformat `.tar.gz` dari direktori target yang berada di dalam `data/input`. Sistem juga melakukan validasi input, menangani kesalahan, dan mencatat aktivitas ke file log.

## 2. Use Case
Otomatisasi backup direktori simulasi agar file konfigurasi, aktivitas, dan catatan dapat disimpan dalam satu arsip terkompresi.

## 3. Struktur Direktori
- `src/arsip.sh`: program utama.
- `src/modules/validate.sh`: validasi direktori target dan nama arsip.
- `src/modules/archive.sh`: proses pembuatan arsip backup.
- `src/modules/log.sh`: pencatatan aktivitas.
- `data/input/`: direktori sumber untuk pengujian.
- `data/backup/`: lokasi penyimpanan arsip.
- `logs/`: penyimpanan log aktivitas.
- `tests/`: dokumentasi pengujian.
- `evidence/`: bukti hasil pengujian.
- `docs/`: dokumentasi kontribusi anggota.

## 4. Persyaratan
- Sistem operasi Linux.
- Bash.
- GNU tar.
- Utilitas realpath.
- Utilitas date dan tee.

## 5. Cara Menjalankan
Jalankan dari direktori utama repositori:

```bash
bash src/arsip.sh <direktori-target> <nama-arsip.tar.gz>
