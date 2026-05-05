// ============================================================
// FILE: lib/main.dart
// DESKRIPSI: Aplikasi Daftar Workshop - UTS Mobile Programming
// AUTHOR: [Arya Saputra]
// ============================================================

import 'package:flutter/material.dart';

// Fungsi utama yang dijalankan pertama kali saat aplikasi dibuka
void main() {
  runApp(const MyApp()); // Menjalankan widget utama aplikasi
}

// ============================================================
// WIDGET: MyApp
// Fungsi: Widget root (induk) dari seluruh aplikasi.
//         Mengatur tema dan halaman awal.
// ============================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Workshop', // Judul aplikasi
      debugShowCheckedModeBanner: false, // Sembunyikan banner "DEBUG"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(
            0xFF1565C0,
          ), // Warna biru tua sebagai tema utama
        ),
        useMaterial3: true,
      ),
      home: const HalamanWorkshop(), // Halaman pertama yang ditampilkan
    );
  }
}

// ============================================================
// MODEL: Workshop
// Fungsi: Menyimpan data/struktur informasi setiap workshop.
//         Seperti "cetakan" untuk setiap data workshop.
// ============================================================
class Workshop {
  final String judul; // Judul workshop
  final String tanggal; // Tanggal pelaksanaan
  final String lokasi; // Tempat pelaksanaan
  final int kuota; // Jumlah peserta maksimal

  // Constructor: cara membuat objek Workshop baru
  const Workshop({
    required this.judul,
    required this.tanggal,
    required this.lokasi,
    required this.kuota,
  });
}

// ============================================================
// WIDGET: HalamanWorkshop
// Fungsi: Halaman utama yang menampilkan daftar workshop.
//         Menggunakan StatefulWidget karena ada perubahan data
//         (status pendaftaran bisa berubah saat tombol ditekan).
// ============================================================
class HalamanWorkshop extends StatefulWidget {
  const HalamanWorkshop({super.key});

  @override
  State<HalamanWorkshop> createState() => _HalamanWorkshopState();
}

class _HalamanWorkshopState extends State<HalamanWorkshop> {
  // --------------------------------------------------------
  // DATA DUMMY: Daftar workshop yang akan ditampilkan
  // Di aplikasi nyata, data ini biasanya diambil dari server/API
  // --------------------------------------------------------
  final List<Workshop> daftarWorkshop = const [
    Workshop(
      judul: 'Flutter untuk Pemula',
      tanggal: 'Sabtu, 14 Juni 2025',
      lokasi: 'Lab Komputer A, Gedung Teknik Lt. 2',
      kuota: 30,
    ),
    Workshop(
      judul: 'Machine Learning dengan Python',
      tanggal: 'Minggu, 15 Juni 2025',
      lokasi: 'Aula Serbaguna, Gedung Rektorat',
      kuota: 50,
    ),
    Workshop(
      judul: 'UI/UX Design Thinking',
      tanggal: 'Sabtu, 21 Juni 2025',
      lokasi: 'Ruang Seminar B, Gedung Informatika',
      kuota: 25,
    ),
    Workshop(
      judul: 'Cyber Security Essentials',
      tanggal: 'Minggu, 22 Juni 2025',
      lokasi: 'Lab Jaringan, Gedung Teknik Lt. 1',
      kuota: 20,
    ),
    Workshop(
      judul: 'Web Development dengan React',
      tanggal: 'Sabtu, 28 Juni 2025',
      lokasi: 'Lab Komputer B, Gedung Teknik Lt. 3',
      kuota: 35,
    ),
  ];

  // --------------------------------------------------------
  // STATE: Menyimpan status pendaftaran setiap workshop
  // Key = indeks workshop, Value = sudah daftar atau belum
  // --------------------------------------------------------
  final Map<int, bool> statusDaftar = {};

  // --------------------------------------------------------
  // FUNGSI: Menampilkan dialog konfirmasi saat tombol ditekan
  // Parameter: index = urutan workshop yang dipilih
  // --------------------------------------------------------
  void tampilkanDialog(int index) {
    final workshop = daftarWorkshop[index];
    final sudahDaftar = statusDaftar[index] ?? false;

    // Jika sudah daftar, tampilkan pesan berbeda
    if (sudahDaftar) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Info'),
          content: Text('Kamu sudah terdaftar di\n"${workshop.judul}"'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Tampilkan dialog konfirmasi pendaftaran
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.event_available, color: Color(0xFF1565C0)),
            SizedBox(width: 8),
            Text('Konfirmasi Daftar'),
          ],
        ),
        content: Text(
          'Apakah kamu yakin ingin mendaftar ke workshop:\n\n"${workshop.judul}"\n\nTanggal: ${workshop.tanggal}',
        ),
        actions: [
          // Tombol Batal
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          // Tombol Konfirmasi
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx); // Tutup dialog
              // Ubah status pendaftaran menjadi true
              setState(() {
                statusDaftar[index] = true;
              });
              // Tampilkan snackbar (notifikasi bawah layar)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Berhasil daftar: ${workshop.judul} ✓'),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1565C0),
              foregroundColor: Colors.white,
            ),
            child: const Text('Ya, Daftar'),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------
  // BUILD: Membangun tampilan halaman utama
  // --------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --------------------------------------------------
      // APPBAR: Bagian header/navigasi di atas layar
      // --------------------------------------------------
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0), // Warna latar AppBar
        foregroundColor: Colors.white, // Warna teks & ikon
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workshop Campus',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Pilih dan daftarkan dirimu sekarang!',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          // Ikon informasi di pojok kanan AppBar
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Tentang Aplikasi'),
                  content: const Text(
                    'Aplikasi Workshop Campus\n\nDibuat untuk UTS Mobile Programming.\nVersi 1.0.0',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),

      // --------------------------------------------------
      // BODY: Bagian isi halaman
      // --------------------------------------------------
      body: Column(
        children: [
          // Banner info di atas list
          Container(
            width: double.infinity,
            color: const Color(0xFF1976D2),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              '${daftarWorkshop.length} Workshop Tersedia  •  Scroll untuk melihat semua',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),

          // --------------------------------------------------
          // LISTVIEW: Menampilkan daftar card workshop
          // Expanded agar ListView mengisi sisa ruang layar
          // --------------------------------------------------
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12), // Jarak tepi list dari layar
              itemCount: daftarWorkshop.length, // Jumlah item = jumlah workshop
              itemBuilder: (context, index) {
                // itemBuilder dipanggil untuk setiap item di list
                // index = nomor urut item (mulai dari 0)
                final workshop = daftarWorkshop[index];
                final sudahDaftar = statusDaftar[index] ?? false;

                // Kembalikan widget CardWorkshop untuk setiap item
                return CardWorkshop(
                  workshop: workshop,
                  sudahDaftar: sudahDaftar,
                  onDaftar: () => tampilkanDialog(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WIDGET: CardWorkshop
// Fungsi: Menampilkan satu kartu informasi workshop.
//         Dipisah menjadi widget sendiri agar kode lebih rapi
//         dan mudah dibaca (prinsip "separation of concern").
// ============================================================
class CardWorkshop extends StatelessWidget {
  final Workshop workshop; // Data workshop yang ditampilkan
  final bool sudahDaftar; // Status apakah sudah daftar
  final VoidCallback onDaftar; // Fungsi yang dipanggil saat tombol ditekan

  const CardWorkshop({
    super.key,
    required this.workshop,
    required this.sudahDaftar,
    required this.onDaftar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Margin luar card (jarak antar card)
      margin: const EdgeInsets.only(bottom: 12),
      // Sudut card dibuat melengkung
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      // Bayangan card
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------------------------------------------------
          // HEADER CARD: Judul workshop dengan background biru
          // ------------------------------------------------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: sudahDaftar
                    ? [Colors.green.shade600, Colors.green.shade400]
                    : [const Color(0xFF1565C0), const Color(0xFF1976D2)],
              ),
            ),
            child: Row(
              children: [
                // Ikon workshop
                const Icon(Icons.laptop_mac, color: Colors.white, size: 22),
                const SizedBox(width: 10),
                // Judul workshop (Expanded agar tidak overflow)
                Expanded(
                  child: Text(
                    workshop.judul,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                // Badge "Terdaftar" jika sudah daftar
                if (sudahDaftar)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '✓ Terdaftar',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
              ],
            ),
          ),

          // ------------------------------------------------
          // BODY CARD: Informasi detail workshop
          // Padding untuk memberi jarak dari tepi card
          // ------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Baris informasi: Tanggal
                _InfoBaris(
                  ikon: Icons.calendar_today,
                  label: 'Tanggal',
                  nilai: workshop.tanggal,
                ),

                const SizedBox(height: 10), // Jarak antar baris
                // Baris informasi: Lokasi
                _InfoBaris(
                  ikon: Icons.location_on,
                  label: 'Lokasi',
                  nilai: workshop.lokasi,
                ),

                const SizedBox(height: 10),

                // Baris informasi: Kuota
                _InfoBaris(
                  ikon: Icons.people,
                  label: 'Kuota',
                  nilai: '${workshop.kuota} peserta',
                ),

                const SizedBox(height: 16),

                // Garis pemisah
                const Divider(height: 1),

                const SizedBox(height: 14),

                // ----------------------------------------
                // TOMBOL DAFTAR
                // ----------------------------------------
                SizedBox(
                  width: double.infinity, // Tombol selebar card
                  child: ElevatedButton.icon(
                    onPressed: onDaftar, // Jalankan fungsi saat ditekan
                    icon: Icon(
                      sudahDaftar ? Icons.check_circle : Icons.app_registration,
                    ),
                    label: Text(
                      sudahDaftar ? 'Sudah Terdaftar' : 'Daftar Sekarang',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      // Warna tombol berbeda jika sudah daftar
                      backgroundColor: sudahDaftar
                          ? Colors.green.shade600
                          : const Color(0xFF1565C0),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WIDGET HELPER: _InfoBaris
// Fungsi: Menampilkan satu baris informasi dengan ikon,
//         label, dan nilai. Dipakai berulang untuk tanggal,
//         lokasi, dan kuota agar kode tidak redundant.
// ============================================================
class _InfoBaris extends StatelessWidget {
  final IconData ikon; // Ikon di sebelah kiri
  final String label; // Teks label (contoh: "Tanggal")
  final String nilai; // Nilai/isi informasi

  const _InfoBaris({
    required this.ikon,
    required this.label,
    required this.nilai,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ikon
        Icon(ikon, size: 18, color: const Color(0xFF1565C0)),
        const SizedBox(width: 10),
        // Label + Nilai dalam kolom
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                nilai,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
