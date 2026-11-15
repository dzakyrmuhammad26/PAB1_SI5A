// CATATAN: Yang berasal dari slide 16 adalah import dan fungsi main()
// dengan MultiProvider. Class MyApp (termasuk theme dari Pertemuan 13)
// hanya kerangka pembantu. Jika main.dart proyekmu sudah punya isi lain,
// JANGAN ditimpa: cukup tambahkan import dan bungkus MyApp dengan
// MultiProvider di main().

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi/screens/search_screen.dart';

import 'providers/favorite_provider.dart';
import 'providers/auth_provider.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(
    // MultiProvider dipakai karena kita punya dua provider.
    // Dipasang paling atas (di atas MyApp) supaya semua layar bisa mengakses.
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ).copyWith(primary: Colors.deepPurple, surface: Colors.deepPurple[50]),
        useMaterial3: true,
      ),
      home: const SearchScreen(),
    );
  }
}
