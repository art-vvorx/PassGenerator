import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'dart:io' as io;
import 'package:flutter/services.dart';

import 'buttons/exit_btn.dart';
import 'buttons/generate24_btn.dart';
import 'buttons/generate16_btn.dart';
import 'buttons/generate8_btn.dart';
import 'buttons/author_btn.dart';
import 'buttons/donate_btn.dart';
import 'buttons/copy_btn.dart';
import 'buttons/theme_btn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> _toggleTheme() async {
    final newThemeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newThemeMode == ThemeMode.dark);
    setState(() {
      _themeMode = newThemeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Generator',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'Password Generator',
        onThemeChange: _toggleTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.onThemeChange});

  final String title;
  final VoidCallback onThemeChange;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _password = '';

  void _generate24Password() {
    setState(() {
      _password = _generate24RandomPassword();
    });
  }

  void _generate16Password() {
    setState(() {
      _password = _generate16RandomPassword();
    });
  }

  void _generate8Password() {
    setState(() {
      _password = _generate8RandomPassword();
    });
  }

  void _exitFunc() {
    if (io.Platform.isWindows) {
      io.exit(0);
    } else {
      SystemNavigator.pop();
    }
  }

  void _copyFunc() {
    if (_password.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: _password));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password copied to clipboard')),
      );
    }
  }

  Future<void> _authorFunc() async {
    final Uri url = Uri.parse('https://taplink.cc/b9v6r');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _donateFunc() async {
    final Uri url = Uri.parse('https://revolut.me/bulatnikow');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  String _generate24RandomPassword() {
    const String lowerCase = 'abcdefghijklmnopqrstuvwxyz';
    const String upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String digits = '0123456789';
    const String specialChars = '!@#\$%^&*()_+[]{}|;:,.<>?';
    const String allChars = lowerCase + upperCase + digits + specialChars;
    Random rnd = Random();
    int length = 24;
    String password = '';
    password += lowerCase[rnd.nextInt(lowerCase.length)];
    password += upperCase[rnd.nextInt(upperCase.length)];
    password += digits[rnd.nextInt(digits.length)];
    password += specialChars[rnd.nextInt(specialChars.length)];
    Set<int> usedIndexes = password.codeUnits.toSet();
    while (password.length < length) {
      int index;
      do {
        index = rnd.nextInt(allChars.length);
      } while (usedIndexes.contains(allChars.codeUnitAt(index)));
      password += allChars[index];
      usedIndexes.add(allChars.codeUnitAt(index));
    }
    List<String> shuffledPassword = password.split('');
    shuffledPassword.shuffle(rnd);
    return shuffledPassword.join();
  }

  String _generate16RandomPassword() {
    const String lowerCase = 'abcdefghijklmnopqrstuvwxyz';
    const String upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String digits = '0123456789';
    const String specialChars = '!@#\$%^&*()_+[]{}|;:,.<>?';
    const String allChars = lowerCase + upperCase + digits + specialChars;
    Random rnd = Random();
    int length = 16;
    String password = '';
    password += lowerCase[rnd.nextInt(lowerCase.length)];
    password += upperCase[rnd.nextInt(upperCase.length)];
    password += digits[rnd.nextInt(digits.length)];
    password += specialChars[rnd.nextInt(specialChars.length)];
    Set<int> usedIndexes = password.codeUnits.toSet();
    while (password.length < length) {
      int index;
      do {
        index = rnd.nextInt(allChars.length);
      } while (usedIndexes.contains(allChars.codeUnitAt(index)));
      password += allChars[index];
      usedIndexes.add(allChars.codeUnitAt(index));
    }
    List<String> shuffledPassword = password.split('');
    shuffledPassword.shuffle(rnd);
    return shuffledPassword.join();
  }

  String _generate8RandomPassword() {
    const String lowerCase = 'abcdefghijklmnopqrstuvwxyz';
    const String upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String digits = '0123456789';
    const String specialChars = '!@#\$%^&*()_+[]{}|;:,.<>?';
    const String allChars = lowerCase + upperCase + digits + specialChars;
    Random rnd = Random();
    int length = 8;
    String password = '';
    password += lowerCase[rnd.nextInt(lowerCase.length)];
    password += upperCase[rnd.nextInt(upperCase.length)];
    password += digits[rnd.nextInt(digits.length)];
    password += specialChars[rnd.nextInt(specialChars.length)];
    Set<int> usedIndexes = password.codeUnits.toSet();
    while (password.length < length) {
      int index;
      do {
        index = rnd.nextInt(allChars.length);
      } while (usedIndexes.contains(allChars.codeUnitAt(index)));
      password += allChars[index];
      usedIndexes.add(allChars.codeUnitAt(index));
    }
    List<String> shuffledPassword = password.split('');
    shuffledPassword.shuffle(rnd);
    return shuffledPassword.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 239, 177),
        foregroundColor: Colors.black,
        title: Text(widget.title),
        centerTitle: true,
        leading: ThemeButton(onPressed: widget.onThemeChange),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Your password:',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 22.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _password,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              CopyButton(onPressed: _copyFunc),
              const SizedBox(height: 30),
              Generate8Button(onPressed: _generate8Password),
              const SizedBox(height: 30),
              Generate16Button(onPressed: _generate16Password),
              const SizedBox(height: 30),
              Generate24Button(onPressed: _generate24Password),
              const SizedBox(height: 30),
              AuthorButton(onPressed: _authorFunc),
              const SizedBox(height: 30),
              DonateButton(onPressed: _donateFunc),
              const SizedBox(height: 30),
              ExitButton(onPressed: _exitFunc),
            ],
          ),
        ),
      ),
    );
  }
}
