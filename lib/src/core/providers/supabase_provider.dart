import 'package:flutter/widgets.dart';

class ASupabaseProvider with ChangeNotifier {
  static final String _supabaseUrl = 'https://oavwpsmuhrmsicnjqxxy.supabase.co';
  static final String _supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9hdndwc211aHJtc2ljbmpxeHh5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUyNjkwNDcsImV4cCI6MjA3MDg0NTA0N30._lIoCvX1ulTC9JTk1DvmjudkvhootmETV6lQQrEKWI0';
  static String get supabaseUrl => _supabaseUrl;
  static String get supabaseAnonKey => _supabaseAnonKey;
}
