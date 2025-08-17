import 'package:flutter/material.dart';
import 'package:tutor_finder_app/src/config/palette.dart';
import 'package:tutor_finder_app/src/features/general/presentation/widgets/app_bar.dart';

class AHomeScreen extends StatelessWidget {
  const AHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(isSignIn: true, isSignUp: true, isSearch: true),
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [Expanded(child: Text('data'))]),
          ],
        ),
      ),
    );
  }
}
