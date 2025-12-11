import 'package:flutter/material.dart';

class AuthorButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AuthorButton({required this.onPressed, super.key, TextStyle? style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor:
            const Color.fromARGB(255, 255, 255, 255), // Цвет текста кнопки
        backgroundColor:
            const Color.fromARGB(255, 17, 84, 172), // Цвет фона кнопки
      ),
      child: const Text('Author'),
    );
  }
}
