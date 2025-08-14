import 'package:flutter/material.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const AAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
