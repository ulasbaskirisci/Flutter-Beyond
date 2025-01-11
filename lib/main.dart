import 'package:flutter/material.dart';
import 'package:flutterankara_2/presentation/form_builder/form_builder.dart';
import 'package:flutterankara_2/presentation/show_case/show_case.dart';
import 'package:flutterankara_2/presentation/theme/thme_settings.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ankara',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: MyHomePage(
        title: 'Flutter Ankara',
        onThemeChanged: _changeTheme,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.onThemeChanged,
  });

  final String title;
  final ValueChanged<ThemeMode> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ThemeChangePage(
                    onThemeChanged: onThemeChanged,
                  ),
                ));
              },
              child: const Text('Go to Theme Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FormBuilderExamplePage(),
                ));
              },
              child: const Text('Form Builder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ShowCaseWidget(
                      builder: (context) => ShowCasePageTwo(),
                    ),
                  ),
                );
              },
              child: const Text('Show Case'),
            ),
          ],
        ),
      ),
    );
  }
}
