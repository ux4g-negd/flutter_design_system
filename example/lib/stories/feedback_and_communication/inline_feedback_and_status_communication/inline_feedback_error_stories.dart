import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../../widgets/component_docs.dart';

final inlineFeedbackErrorComponent = WidgetbookComponent(
  name: 'Inline Feedback Error',
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
          name: 'Inline Feedback Error ($variant)',
          description: isCard
              ? 'Form input with inline error validation feedback inside a card container. '
                    'Shows an error message below the input field with a light purple card background.'
              : 'Form input with inline error validation feedback. '
                    'Shows an error message below the input field when validation fails.',
          code: isCard
              ? _inlineFeedbackErrorCardCode
              : _inlineFeedbackErrorCode,
          center: true,
          child: _InlineFeedbackErrorMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Error
// ───────────────────────────────────────────────────────────────────────

const _inlineFeedbackErrorCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class InlineFeedbackErrorScreen extends StatelessWidget {
  const InlineFeedbackErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleColor = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);

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
                  colorFilter: isDark
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
                    // Back button
                    Ux4gButton(
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.ghost,
                      leadingIcon: Icons.arrow_back,
                      contentColor: primaryColor,
                      size: Ux4gButtonSize.small,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Enter your Mobile Number',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: titleColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Provide your mobile number for OTP verification and updates.',
                      style: TextStyle(fontSize: 13, color: subtleColor),
                    ),
                    const SizedBox(height: 20),
                    // Input field with error
                    Ux4gInputField(
                      value: '98765432',
                      onValueChange: (_) {},
                      label: 'Mobile Number',
                      prefixText: '+91',
                      status: Ux4gInputFieldStatus.error,
                      caption: 'Enter a valid 10-digit mobile number',
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
// Source Code String — Error Card Style
// ───────────────────────────────────────────────────────────────────────

const _inlineFeedbackErrorCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class InlineFeedbackErrorCardScreen extends StatelessWidget {
  const InlineFeedbackErrorCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleColor = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
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
                  colorFilter: isDark
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    Ux4gButton(
                      text: 'Back',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.ghost,
                      leadingIcon: Icons.arrow_back,
                      contentColor: primaryColor,
                      size: Ux4gButtonSize.small,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Enter your Mobile Number',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: titleColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Provide your mobile number for OTP verification and updates.',
                      style: TextStyle(fontSize: 13, color: subtleColor),
                    ),
                    const SizedBox(height: 20),
                    // Input field with error
                    Ux4gInputField(
                      value: '98765432',
                      onValueChange: (_) {},
                      label: 'Mobile Number',
                      prefixText: '+91',
                      status: Ux4gInputFieldStatus.error,
                      caption: 'Enter a valid 10-digit mobile number',
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
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
// Error Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _InlineFeedbackErrorMockup extends StatelessWidget {
  final bool isCard;

  const _InlineFeedbackErrorMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleColor = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
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
                    colorFilter: isDark
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
              if (!isCard)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildDefaultContent(primaryColor, titleColor, subtleColor),
                  ),
                ),
              if (isCard)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildCardContent(cardBg, primaryColor, titleColor, subtleColor),
                ),

              if (isCard) const Spacer(),

              // Continue button at bottom for card style
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

  Widget _buildFormFields(Color primaryColor, Color titleColor, Color subtleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back button
        Align(
          alignment: Alignment.centerLeft,
          child: Ux4gButton(
            text: 'Back',
            onPressed: () {},
            variant: Ux4gButtonVariant.ghost,
            leadingIcon: Icons.arrow_back,
            contentColor: primaryColor,
            size: Ux4gButtonSize.small,
          ),
        ),
        const SizedBox(height: 20),

        // Title
        Text(
          'Enter your Mobile Number',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),

        // Description
        Text(
          'Provide your mobile number for OTP verification and updates.',
          style: TextStyle(fontSize: 13, color: subtleColor),
        ),
        const SizedBox(height: 20),

        // Input field with error
        Ux4gInputField(
          value: '98765432',
          onValueChange: (_) {},
          label: 'Mobile Number',
          prefixText: '+91',
          status: Ux4gInputFieldStatus.error,
          caption: 'Enter a valid 10-digit mobile number',
        ),
      ],
    );
  }

  Widget _buildDefaultContent(Color primaryColor, Color titleColor, Color subtleColor) {
    return Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormFields(primaryColor, titleColor, subtleColor),
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

  Widget _buildCardContent(Color cardBg, Color primaryColor, Color titleColor, Color subtleColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildFormFields(primaryColor, titleColor, subtleColor),
    );
  }
}
