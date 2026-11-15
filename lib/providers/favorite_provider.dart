import 'package:flutter/foundation.dart';

class FavoriteProvider extends ChangeNotifier {
  // Kumpulan nama candi favorit. Set menolak nama ganda.
  // Garis bawah membuatnya privat: layar lain mengubah lewat toggle().
  final Set<String> _favorites = {};

  // Getter: jumlah favorit untuk ProfileScreen
  int get count => _favorites.length;

  bool isFavorite(String name) => _favorites.contains(name);

  void toggle(String name) {
    if (_favorites.contains(name)) {
      _favorites.remove(name);
    } else {
      _favorites.add(name);
    }
    // Memberi tahu semua widget yang watch supaya build ulang
    notifyListeners();
  }
}
