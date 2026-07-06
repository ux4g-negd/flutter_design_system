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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Accordion style (collapsed)
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningLight,
                    title: 'Income Certificate Application',
                    titleStyle: typography?.tS_default?.copyWith(
                      color: const Color(0xFF111827),
                    ),
                    subtitleWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('Step 3 of 5', style: typography?.lM_default),
                        const SizedBox(height: 8),
                        Text(
                          'Last saved: 10 Apr 2026',
                          style: typography?.bS_default?.copyWith(
                            color: const Color(0xFF374151),
                          ),
                        ),
                      ],
                    ),
                    trailingIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                  const SizedBox(height: 24),

                  // 2. Solid Warning Banner
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningSolid,
                    title: 'Your draft expires tomorrow. Submit today',
                    titleStyle: typography?.bS_strong,
                  ),
                  const SizedBox(height: 24),

                  // 3. Saving State
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningLight,
                    title: '',
                    trailingIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: Ux4gLoader(strokeWidth: 2.0),
                        ),
                        const SizedBox(width: 8),
                        Text('Saving', style: typography?.bS_default),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 4. Success Banner (Left Icon)
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.successLight,
                    title: 'Draft saved successfully at 3:14 PM',
                    titleStyle: typography?.bS_default,
                    leadingIcon: const Icon(Icons.check_circle_outline),
                  ),
                  const SizedBox(height: 24),

                  // 5. Expiry Warning with Badge
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningLight,
                    title: 'Your draft expires in 5 days',
                    titleStyle: typography?.bS_strong?.copyWith(
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 6. Error Banner with Action
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.errorLight,
                    title: 'Draft expired on 9 April\\n2026',
                    titleStyle: typography?.bS_default?.copyWith(
                      color: const Color(0xFF111827),
                    ),
                    leadingIcon: const Icon(Icons.error_outline),
                    trailingIcon: Text(
                      'Action',
                      style: typography?.lXL_default?.copyWith(
                        color: const Color(0xFF9A3412),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 7. Success Banner (Right Icon)
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.successLight,
                    title: '',
                    trailingIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle_outline, size: 18),
                        const SizedBox(width: 4),
                        Text('Saved 3:14 PM', style: typography?.bM_default),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 8. Accordion style (expanded)
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningLight,
                    title: 'Income Certificate Application',
                    titleStyle: typography?.tS_default?.copyWith(
                      color: const Color(0xFF111827),
                    ),
                    subtitleWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text('Step 3 of 5', style: typography?.lM_default),
                        const SizedBox(height: 8),
                        Text(
                          'Last saved: 10 Apr 2026',
                          style: typography?.bS_default?.copyWith(
                            color: const Color(0xFF374151),
                          ),
                        ),
                      ],
                    ),
                    trailingIcon: const Icon(Icons.keyboard_arrow_up),
                    actionsAlignment: WrapAlignment.spaceBetween,
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Discard',
                          style: typography?.lXL_default?.copyWith(
                            color: const Color(0xFFDB372D),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Resume', style: typography?.lXL_default),
                      ),
                    ],
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
