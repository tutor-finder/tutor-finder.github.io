import 'package:flutter/material.dart';
import 'package:tutor_finder_app/src/config/routes.dart';

class AMenuScreen extends StatelessWidget {
  const AMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  debugPrint('Student / Parents part clicked');
                  Navigator.pushNamed(context, ARoutes.aSignUpRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.school),
                      SizedBox(height: 16),
                      Text('Student / Parents'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  debugPrint('Tutor part clicked');
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(height: 16),
                      Text('Tutor'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
