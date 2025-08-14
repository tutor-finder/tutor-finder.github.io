import 'package:flutter/material.dart';
import 'package:tutor_finder_app/src/config/routes.dart';
import 'package:tutor_finder_app/src/features/general/presentation/views/home_screen.dart';

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
          return const AHomeScreen();
        },
        ARoutes.aSignUpRoute: (context) {
          return const AHomeScreen();
        },
      },
      initialRoute: ARoutes.aHomeRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
