import 'package:flutter/material.dart';

class ALayout extends StatelessWidget {
  final PreferredSizeWidget child;
  final Widget widget;

  const ALayout({super.key, required this.child, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: child, body: widget);
  }
}
