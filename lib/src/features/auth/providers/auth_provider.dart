import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AAuthProvider with ChangeNotifier {
  bool? _isSignedIn;

  final SupabaseClient _aSupabaseClient = Supabase.instance.client;

  bool? get isSignedIn => _isSignedIn;

  Future<AuthResponse> signUpWithEmailAndPassword({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _aSupabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'username': username,
        },
      );

      _isSignedIn = true;
      notifyListeners();

      return response;
    } catch (error) {
      debugPrint('Sign up error: $error');
      _isSignedIn = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _aSupabaseClient.auth
          .signInWithPassword(email: email, password: password);

      if (response.user != null) {
        _isSignedIn = true;
        notifyListeners();
      }

      return response;
    } catch (error) {
      debugPrint('Sign in error: $error');
      _isSignedIn = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _aSupabaseClient.auth.signOut();
      _isSignedIn = false;
      notifyListeners();
    } catch (error) {
      debugPrint('Sign out error: $error');
      rethrow;
    }
  }
}
