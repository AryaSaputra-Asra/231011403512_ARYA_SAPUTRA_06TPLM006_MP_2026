# 🎓 Workshop Campus App
### UTS Mobile Programming — Flutter

---

## 👤 Identitas Mahasiswa

| Field | Detail |
|---|---|
| **Nama** | Arya Saputra |
| **NIM** | 231011403512 |
| **Mata Kuliah** | Mobile Programming |
| **Kelas** | 06TPLM006 |
| **Semester** | 6 |
| **Tahun** | 2026 |
| **Dosen** | [Nama Dosen] |

---

## 📱 Tentang Aplikasi

**Workshop Campus App** adalah aplikasi mobile berbasis Flutter yang menampilkan daftar workshop kampus. Pengguna dapat melihat informasi workshop dan mendaftarkan diri secara langsung melalui aplikasi.

---

## ✨ Fitur Aplikasi

- 📋 Menampilkan daftar workshop dalam format **Card**
- 🔄 Daftar dapat di-**scroll** menggunakan ListView
- 📅 Setiap card menampilkan **judul, tanggal, lokasi, dan kuota**
- ✅ Tombol **Daftar Sekarang** dengan dialog konfirmasi
- 🟢 Status berubah menjadi **"Sudah Terdaftar"** setelah mendaftar
- 🔔 Notifikasi **SnackBar** setelah pendaftaran berhasil

---

## 🧩 Widget yang Digunakan

| Widget | Fungsi |
|---|---|
| `Scaffold` | Kerangka utama halaman |
| `AppBar` | Header navigasi di atas layar |
| `ListView.builder` | Menampilkan daftar yang bisa discroll |
| `Card` | Kotak kartu untuk setiap workshop |
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `Text` | Menampilkan teks informasi |
| `SizedBox` | Memberi jarak antar widget |
| `ElevatedButton` | Tombol daftar workshop |
| `AlertDialog` | Pop-up konfirmasi pendaftaran |

---

## 📁 Struktur Project

```
workshop_app/
├── lib/
│   └── main.dart        # Seluruh kode aplikasi
├── android/             # Konfigurasi Android
├── ios/                 # Konfigurasi iOS
├── web/                 # Konfigurasi Web
├── pubspec.yaml         # Konfigurasi dependencies
└── README.md            # Dokumentasi project ini
```

---

## 🚀 Cara Menjalankan Aplikasi

### Prasyarat
- [Flutter SDK](https://flutter.dev/docs/get-started/install) sudah terinstall
- [Visual Studio Code](https://code.visualstudio.com/) dengan extension Flutter & Dart
- Google Chrome (untuk menjalankan di web)

### Langkah-langkah

**1. Clone repository ini**
```bash
git clone https://github.com/AryaSaputra-Asra/231011403512_ARYA_SAPUTRA_06TPLM006_MP_2026.git
```

**2. Masuk ke folder project**
```bash
cd 231011403512_ARYA_SAPUTRA_06TPLM006_MP_2026
```

**3. Install dependencies**
```bash
flutter pub get
```

**4. Jalankan aplikasi di Chrome**
```bash
flutter run -d chrome
```

---

## 📸 Screenshot

> *(Tambahkan screenshot aplikasi di sini setelah dijalankan)*

---

## 🛠️ Teknologi yang Digunakan

- **Framework:** Flutter 3.x
- **Bahasa:** Dart
- **IDE:** Visual Studio Code
- **Platform:** Web (Chrome), Android

---

## 📝 Catatan

- Semua kode ditulis dalam satu file `main.dart`
- Tidak menggunakan package tambahan (hanya Flutter SDK bawaan)
- Data workshop menggunakan dummy data statis
