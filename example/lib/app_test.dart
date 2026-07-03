import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

void main() {
  runApp(const AppTest());
}

class AppTest extends StatefulWidget {
  const AppTest({super.key});

  @override
  State<AppTest> createState() => _AppTestState();
}

class _AppTestState extends State<AppTest> {
  bool _isDark = false;
  String value = '';
  bool checked = false;
  RangeValues range = RangeValues(20, 90);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ux4gInputField Changes Test',
      debugShowCheckedModeBanner: false,
      theme: Ux4gTheme.themeData(isDark: _isDark),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ux4gInputField Changes Test'),
          actions: [
            IconButton(
              icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => setState(() => _isDark = !_isDark),
              tooltip: 'Toggle Theme',
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ux4gSearchField(
                    value: value,
                    onValueChange: (v) => setState(() => value = v),
                    placeholder: 'Search...',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
