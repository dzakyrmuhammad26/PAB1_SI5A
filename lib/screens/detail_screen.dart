import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_provider.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    // di dalam build() DetailScreen
    final isFav = context.watch<FavoriteProvider>().isFavorite(candi.name);
    return Scaffold(
      body: SingleChildScrollView(
        // Ditambahkan agar halaman bisa di-scroll jika deskripsi panjang
        child: Column(
          children: [
            // --- BAGIAN UTAMA (GAMBAR & TOMBOL BACK) ---
            Stack(
              children: [
                // Gambar utama
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      candi.imageAsset,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.error),
                        ); // Proteksi jika gambar gagal load
                      },
                    ),
                  ),
                ),
                // Tombol back kustom
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100]?.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.read<FavoriteProvider>().toggle(candi.name);
                      },
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.red : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // --- BAGIAN KONTEN / DETAIL ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  // Info atas (Nama & Tombol Favorit)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        candi.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Info Lokasi
                  Row(
                    children: [
                      const Icon(Icons.place, color: Colors.red),
                      const SizedBox(width: 8),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(': ${candi.location}'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Pemisah / Garis Pembatas
                  Divider(color: Colors.deepPurple.shade100),
                  const SizedBox(height: 16),

                  // Info bawah (Deskripsi)
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(candi.description, textAlign: TextAlign.justify),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
