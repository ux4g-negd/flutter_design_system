import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../../widgets/component_docs.dart';

final inlineFeedbackComponent = WidgetbookComponent(
  name: 'Inline Feedback',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.object.dropdown<String>(
          label: 'Variant',
          options: const ['Default', 'Card Style'],
          initialOption: 'Default',
        );
        final isCard = variant == 'Card Style';

        return ComponentDocs(
          mobileMockup: true,
          name: 'Inline Feedback ($variant)',
          description: isCard
              ? 'Form input with inline validation feedback inside a card container. '
                    'Shows a success message below the input field with a light purple card background.'
              : 'Form input with inline validation feedback. '
                    'Shows a success message below the input field on white background.',
          code: isCard ? _inlineFeedbackCardCode : _inlineFeedbackDefaultCode,
          center: true,
          child: _InlineFeedbackMockup(
            variant: isCard
                ? _CardVariant.cardStyle
                : _CardVariant.defaultStyle,
          ),
        );
      },
    ),
  ],
);

enum _CardVariant { defaultStyle, cardStyle }

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _inlineFeedbackDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class InlineFeedbackScreen extends StatelessWidget {
  const InlineFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleColor = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
    final successColor = isDark ? Ux4gPalette.green300 : const Color(0xFF16A34A);

    return Scaffold(
      backgroundColor: isDark ? Ux4gPalette.neutral900 : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Header with logos and elevation
            Ux4gAppHeader(
              elevation: 2,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingSpacing: 8,
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Ux4gPalette.neutral50, BlendMode.srcIn)
                      : null,
                ),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                SvgPicture.asset(
                  Ux4gIcons.union,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back link
                    Row(
                      children: [
                        Icon(Icons.arrow_back, size: 16, color: primaryColor),
                        const SizedBox(width: 4),
                        Text('Back', style: TextStyle(fontSize: 14, color: primaryColor)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Enter your Annual Income',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: titleColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter your total annual household income for FY 2025–2026 to verify eligibility.',
                      style: TextStyle(fontSize: 13, color: subtleColor),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Income Amount',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: titleColor),
                    ),
                    const SizedBox(height: 8),
                    // Input field
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(color: successColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '₹  2,50,000',
                        style: TextStyle(fontSize: 15, color: titleColor),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Success feedback
                    Row(
                      children: [
                        Icon(Icons.check_circle, size: 16, color: successColor),
                        const SizedBox(width: 6),
                        Text(
                          'Amount format looks correct',
                          style: TextStyle(fontSize: 13, color: successColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Continue button
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        text: 'Continue',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.primary,
                        size: Ux4gButtonSize.large,
                        height: 48,
                        backgroundColor: isDark ? Ux4gPalette.primary300 : const Color(0xFF4A2BC2),
                        contentColor: isDark ? Colors.black : Colors.white,
                        borderRadius: 8,
                      ),
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
""";

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _inlineFeedbackCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class InlineFeedbackCardScreen extends StatelessWidget {
  const InlineFeedbackCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleColor = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
    final successColor = isDark ? Ux4gPalette.green300 : const Color(0xFF16A34A);
    final cardBg = isDark ? Ux4gPalette.neutral800 : Colors.white;

    return Scaffold(
      backgroundColor: isDark ? Ux4gPalette.primary800 : const Color(0xFFF2EFFF),
      body: SafeArea(
        child: Column(
          children: [
            // App Header with logos and elevation
            Ux4gAppHeader(
              elevation: 2,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingSpacing: 8,
              leadingWidgets: [
                SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Ux4gPalette.neutral50, BlendMode.srcIn)
                      : null,
                ),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                SvgPicture.asset(
                  Ux4gIcons.union,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back link
                      Row(
                        children: [
                          Icon(Icons.arrow_back, size: 16, color: primaryColor),
                          const SizedBox(width: 4),
                          Text('Back', style: TextStyle(fontSize: 14, color: primaryColor)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Enter your Annual Income',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: titleColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Enter your total annual household income for FY 2025–2026 to verify eligibility.',
                        style: TextStyle(fontSize: 13, color: subtleColor),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Income Amount',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: titleColor),
                      ),
                      const SizedBox(height: 8),
                      // Input field
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: successColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '₹  2,50,000',
                          style: TextStyle(fontSize: 15, color: titleColor),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Success feedback
                      Row(
                        children: [
                          Icon(Icons.check_circle, size: 16, color: successColor),
                          const SizedBox(width: 6),
                          Text(
                            'Amount format looks correct',
                            style: TextStyle(fontSize: 13, color: successColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Continue button at bottom
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: Ux4gButton(
                  text: 'Continue',
                  onPressed: () {},
                  variant: Ux4gButtonVariant.primary,
                  size: Ux4gButtonSize.large,
                  height: 48,
                  backgroundColor: isDark ? Ux4gPalette.primary300 : const Color(0xFF4A2BC2),
                  contentColor: isDark ? Colors.black : Colors.white,
                  borderRadius: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _InlineFeedbackMockup extends StatelessWidget {
  final _CardVariant variant;

  const _InlineFeedbackMockup({this.variant = _CardVariant.defaultStyle});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isCard = variant == _CardVariant.cardStyle;
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleColor = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
    final successColor = isDark ? Ux4gPalette.green300 : const Color(0xFF16A34A);
    final cardBg = isDark ? Ux4gPalette.neutral800 : Colors.white;

    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: isCard 
            ? (isDark ? Ux4gPalette.primary800 : const Color(0xFFF2EFFF)) 
            : (isDark ? Ux4gPalette.neutral900 : Colors.white),
        body: SafeArea(
          child: Column(
            children: [
              // App Header with logos and elevation
              Ux4gAppHeader(
                elevation: 2,
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingSpacing: 8,
                leadingWidgets: [
                  SvgPicture.asset(
                  Ux4gIcons.nationalEmblem,
                  height: 40,
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Ux4gPalette.neutral50, BlendMode.srcIn)
                      : null,
                ),
                  SizedBox(
                    height: 32,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: const Color(0xFFD1D5DB),
                    ),
                  ),
                  SvgPicture.asset(
                    Ux4gIcons.union,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),

              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: isCard 
                      ? _buildCardContent(cardBg, primaryColor, titleColor, subtleColor, successColor) 
                      : _buildDefaultContent(primaryColor, titleColor, subtleColor, successColor),
                ),
              ),

              // Continue button at bottom
              if (isCard)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      text: 'Continue',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.primary,
                      size: Ux4gButtonSize.large,
                      height: 48,
                      backgroundColor: isDark ? Ux4gPalette.primary300 : const Color(0xFF4A2BC2),
                      contentColor: isDark ? Colors.black : Colors.white,
                      borderRadius: 8,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields(Color primaryColor, Color titleColor, Color subtleColor, Color successColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back link
        Row(
          children: [
            Icon(Icons.arrow_back, size: 16, color: primaryColor),
            const SizedBox(width: 4),
            Text('Back', style: TextStyle(fontSize: 14, color: primaryColor)),
          ],
        ),
        const SizedBox(height: 20),

        // Title
        Text(
          'Enter your Annual Income',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),

        // Description
        Text(
          'Enter your total annual household income for FY 2025–2026 to verify eligibility.',
          style: TextStyle(fontSize: 13, color: subtleColor),
        ),
        const SizedBox(height: 20),

        // Label
        Text(
          'Income Amount',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),

        // Input field with green border (success state)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: successColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '₹  2,50,000',
            style: TextStyle(fontSize: 15, color: titleColor),
          ),
        ),
        const SizedBox(height: 8),

        // Success inline feedback
        Row(
          children: [
            Icon(Icons.check_circle, size: 16, color: successColor),
            const SizedBox(width: 6),
            Text(
              'Amount format looks correct',
              style: TextStyle(fontSize: 13, color: successColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDefaultContent(Color primaryColor, Color titleColor, Color subtleColor, Color successColor) {
    return Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormFields(primaryColor, titleColor, subtleColor, successColor),
            const Spacer(),
            // Continue button
            SizedBox(
              width: double.infinity,
              child: Ux4gButton(
                text: 'Continue',
                onPressed: () {},
                variant: Ux4gButtonVariant.primary,
                size: Ux4gButtonSize.large,
                height: 48,
                backgroundColor: isDark ? Ux4gPalette.primary300 : const Color(0xFF4A2BC2),
                contentColor: isDark ? Colors.black : Colors.white,
                borderRadius: 8,
              ),
            ),
          ],
        );
      }
    );
  }

  Widget _buildCardContent(Color cardBg, Color primaryColor, Color titleColor, Color subtleColor, Color successColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildFormFields(primaryColor, titleColor, subtleColor, successColor),
    );
  }
}
