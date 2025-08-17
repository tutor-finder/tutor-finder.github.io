import 'package:flutter/material.dart';
import 'package:tutor_finder_app/src/config/routes.dart';
import 'package:tutor_finder_app/src/features/auth/presentation/views/sign_in_screen.dart';
import 'package:tutor_finder_app/src/features/auth/presentation/views/sign_up_screen.dart';
import 'package:tutor_finder_app/src/features/general/presentation/views/home_screen.dart';
import 'package:tutor_finder_app/src/features/general/presentation/views/menu_screen.dart';
import 'package:tutor_finder_app/src/features/general/presentation/views/splash_screen.dart';

class ATutorFinderApp extends StatelessWidget {
  const ATutorFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        ARoutes.aHomeRoute: (context) {
          return const AHomeScreen();
        },
        ARoutes.aSignInRoute: (context) {
          return const ASignInScreen();
        },
        ARoutes.aSignUpRoute: (context) {
          return const ASignUpScreen();
        },
        ARoutes.aMenuRoute: (context) {
          return const AMenuScreen();
        },
        ARoutes.aSplashRoute: (context) {
          return const ASplashScreen();
        },
      },
      initialRoute: ARoutes.aSplashRoute,
      theme: ThemeData.light(useMaterial3: true).copyWith(),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
