import 'package:flutter/material.dart';

class ThemeChangePage extends StatelessWidget {
  const ThemeChangePage({super.key, required this.onThemeChanged});

  final ValueChanged<ThemeMode> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onThemeChanged(ThemeMode.light),
              child: const Text('Light Mode'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => onThemeChanged(ThemeMode.dark),
              child: const Text('Dark Mode'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => onThemeChanged(ThemeMode.system),
              child: const Text('System Mode'),
            ),
          ],
        ),
      ),
    );
  }
}
