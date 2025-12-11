import 'package:flutter/material.dart';

class CopyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CopyButton({required this.onPressed, super.key, TextStyle? style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor:
            const Color.fromARGB(255, 255, 255, 255), // Цвет текста кнопки
        backgroundColor:
            const Color.fromARGB(255, 77, 77, 77), // Цвет фона кнопки
      ),
      child: const Text('Copy password'),
    );
  }
}
