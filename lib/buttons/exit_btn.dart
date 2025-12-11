import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ExitButton({required this.onPressed, super.key, TextStyle? style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor:
            const Color.fromARGB(255, 255, 255, 255), // Цвет текста кнопки
        backgroundColor:
            const Color.fromARGB(255, 197, 0, 0), // Цвет фона кнопки
      ),
      child: const Text('Exit'),
    );
  }
}
