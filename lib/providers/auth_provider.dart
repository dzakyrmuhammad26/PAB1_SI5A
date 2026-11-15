import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  // Data privat
  bool _isSignedIn = false;
  String _username = '';

  // Getter untuk dibaca
  bool get isSignedIn => _isSignedIn;
  String get username => _username;

  // Fungsi untuk mengubah, selalu diakhiri notifyListeners()
  void signIn(String username) {
    _isSignedIn = true;
    _username = username;
    notifyListeners();
  }

  void signOut() {
    _isSignedIn = false;
    _username = '';
    notifyListeners();
  }
}
