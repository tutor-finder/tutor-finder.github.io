import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tutor_finder_app/app.dart';
import 'package:tutor_finder_app/src/core/providers/supabase_provider.dart';
import 'package:tutor_finder_app/src/features/auth/providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: ASupabaseProvider.supabaseUrl,
    anonKey: ASupabaseProvider.supabaseAnonKey,
  );

  runApp(
    MultiProvider(
      providers: <ChangeNotifierProvider>[
        ChangeNotifierProvider<ASupabaseProvider>(
          create: (_) {
            return ASupabaseProvider();
          },
        ),
        ChangeNotifierProvider<AAuthProvider>(
          create: (_) {
            return AAuthProvider();
          },
        ),
      ],
      child: const ATutorFinderApp(),
    ),
  );
}
