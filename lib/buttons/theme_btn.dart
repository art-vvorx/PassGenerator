import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ThemeButton({required this.onPressed, super.key, TextStyle? style});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.brightness_6),
      onPressed: onPressed,
    );
  }
}
