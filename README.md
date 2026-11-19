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
```

Contoh:

```bash
bash src/arsip.sh data/input/simulasi backup-simulasi.tar.gz
```

Arsip akan disimpan di `data/backup/`, sedangkan aktivitas program dicatat di `logs/arsip.log`.

Direktori target harus berada di dalam `data/input`. Nama arsip harus menggunakan karakter huruf, angka, titik, garis bawah, atau tanda hubung dan diakhiri `.tar.gz`.

## 6. Exit Status

| Kode | Keterangan |
|---|---|
| 0 | Backup berhasil |
| 1 | Argumen atau nama arsip tidak valid |
| 2 | Direktori target tidak ditemukan |
| 3 | Pembuatan arsip gagal atau nama arsip sudah digunakan |
| 4 | Direktori target berada di luar lokasi yang diizinkan |

## 7. Hasil Pengujian

Pengujian dilakukan menggunakan dataset simulasi di `data/input/simulasi`.

| ID | Skenario | Hasil yang Diharapkan | Hasil |
|---|---|---|---|
| TC-01 | Backup dengan target dan nama arsip valid | Exit 0, arsip terbentuk | Berhasil |
| TC-02 | Nama arsip mengandung karakter tidak valid | Exit 1 | Berhasil |
| TC-03 | Direktori target tidak ditemukan | Exit 2 | Berhasil |

Bukti pengujian tersedia di:

- `evidence/TC-01-success.txt`
- `evidence/TC-02-invalid-name.txt`
- `evidence/TC-03-missing-path.txt`

Arsip diverifikasi menggunakan perintah `tar -tzvf` untuk memastikan file sumber masuk ke dalam arsip.

## 8. Logging

Aktivitas program dicatat pada `logs/arsip.log` dengan informasi waktu dan level pesan, yaitu INFO atau ERROR.

## 9. Cleanup dan Rollback

Untuk menghapus hasil backup simulasi dan mengembalikan kondisi penyimpanan sebelum pengujian, jalankan dari direktori utama repositori:

```bash
rm -f data/backup/backup-simulasi.tar.gz
rm -f data/backup/backup-verifikasi.tar.gz
rm -f logs/arsip.log
```

Perintah tersebut hanya menghapus hasil backup dan log simulasi. File sumber di `data/input/` serta kode program tidak dihapus.

## 10. Batasan

- Target backup dibatasi pada direktori di dalam `data/input`.
- Program tidak menimpa arsip dengan nama yang sudah tersedia.
- Program ditujukan untuk simulasi dan pengujian administrasi Linux, bukan pengganti sistem backup produksi.
- Pengelolaan jadwal backup otomatis belum termasuk dalam implementasi ini.
