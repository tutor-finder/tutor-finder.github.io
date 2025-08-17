import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutor_finder_app/src/config/routes.dart';

class ASplashScreen extends StatefulWidget {
  const ASplashScreen({super.key});

  @override
  State<ASplashScreen> createState() => _ASplashScreenState();
}

class _ASplashScreenState extends State<ASplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, ARoutes.aMenuRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.school),
                SizedBox(height: 16.0),
                Text('My App'),
                SizedBox(height: 16.0),
                CircularProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
