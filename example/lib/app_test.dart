import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

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
  List<String> selectedIds = [];
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<Ux4gTypography>();

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
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BiometricTestScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              child: const Text('Open Biometric Verification'),
            ),
          ),
        ),
      ),
    );
  }
}

class BiometricTestScreen extends StatelessWidget {
  const BiometricTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Biometric Verification')),
      body: BiometricVerificationFlow(
        mockSuccess: true,
        theme: const BiometricThemeData(
          colors: BiometricColors(
            primary: Color(0xFF0057FF),
            success: Color(0xFF00C48C),
            ovalActive: Color(0xFF00C48C),
          ),
          cardRadius: 20,
          buttonRadius: 8,
        ),
        onSuccess: (result) {
          print("=============>${result}");
          Navigator.of(context).pop();
        },
        onDismiss: () => Navigator.of(context).pop(),
      ),
    );
  }
}
