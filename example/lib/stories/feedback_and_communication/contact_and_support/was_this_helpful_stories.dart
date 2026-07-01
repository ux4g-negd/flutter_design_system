import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────

bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

Color _getScaffoldBg(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50;

final wasThisHelpfulComponent = WidgetbookComponent(
  name: 'Was This Helpful Alert',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Was This Helpful Alert',
          description: 'A bottom floating dialog/toast alert asking users for feedback on helpfulness.',
          code: _wasThisHelpfulCode,
          center: true,
          child: const _WasThisHelpfulMockup(),
        );
      },
    ),
  ],
);

class _WasThisHelpfulMockup extends StatelessWidget {
  const _WasThisHelpfulMockup();

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    final scaffoldBg = _getScaffoldBg(context);
    final cardBg = isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral0;
    final borderColor = isDark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200;
    final titleColor = isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;

    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: scaffoldBg,
        body: Stack(
          children: [
            // Mock background page content (simulating an article page)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mock Breadcrumbs/Category
                    Text(
                      'SUPPORT > REGISTRATION',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.bXS_default ?? const TextStyle()).copyWith(
                        color: isDark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Mock Article Title
                    Text(
                      'How to update your registered mobile number?',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.hM_default ?? const TextStyle()).copyWith(
                        color: titleColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Mock Article Body
                    Text(
                      'To update your mobile number, log in to your account dashboard and navigate to Account Settings. Under the Profile tab, locate your phone number, click Edit, enter the new mobile number, and verify using the OTP sent to your new number.',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle()).copyWith(
                        color: isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Semi-transparent backdrop overlay at the bottom half to highlight toast
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.15),
              ),
            ),

            // Floating Toast/Alert Card at bottom
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Was this helpful?',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.hXS_strong ?? const TextStyle()).copyWith(
                        color: titleColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Ux4gButton(
                          onPressed: () {},
                          text: 'Yes',
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.small,
                          leadingIcon: Icons.thumb_up_alt_outlined,
                          borderColor: borderColor,
                          contentColor: isDark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral800,
                        ),
                        const SizedBox(width: 8),
                        Ux4gButton(
                          onPressed: () {},
                          text: 'No',
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.small,
                          leadingIcon: Icons.thumb_down_alt_outlined,
                          borderColor: borderColor,
                          contentColor: isDark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral800,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _wasThisHelpfulCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class WasThisHelpfulScreen extends StatelessWidget {
  const WasThisHelpfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final scaffoldBg = isDark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50;
    final cardBg = isDark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral0;
    final borderColor = isDark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200;
    final titleColor = isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: Stack(
        children: [
          // Background Page Content (Article detail)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SUPPORT > REGISTRATION',
                    style: (Theme.of(context).extension<Ux4gTypography>()?.bXS_default ?? const TextStyle()).copyWith(
                      color: isDark ? Ux4gPalette.neutral400 : Ux4gPalette.neutral500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'How to update your registered mobile number?',
                    style: (Theme.of(context).extension<Ux4gTypography>()?.hM_default ?? const TextStyle()).copyWith(
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'To update your mobile number, log in to your account dashboard and navigate to Account Settings. Under the Profile tab, locate your phone number, click Edit, enter the new mobile number, and verify using the OTP sent to your new number.',
                    style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle()).copyWith(
                      color: isDark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Dialog / Toast alert overlaid at the bottom of the screen
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Was this helpful?',
                    style: (Theme.of(context).extension<Ux4gTypography>()?.hXS_strong ?? const TextStyle()).copyWith(
                      color: titleColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Ux4gButton(
                        onPressed: () {},
                        text: 'Yes',
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.small,
                        leadingIcon: Icons.thumb_up_alt_outlined,
                        borderColor: borderColor,
                        contentColor: isDark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral800,
                      ),
                      const SizedBox(width: 8),
                      Ux4gButton(
                        onPressed: () {},
                        text: 'No',
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.small,
                        leadingIcon: Icons.thumb_down_alt_outlined,
                        borderColor: borderColor,
                        contentColor: isDark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral800,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
""";
