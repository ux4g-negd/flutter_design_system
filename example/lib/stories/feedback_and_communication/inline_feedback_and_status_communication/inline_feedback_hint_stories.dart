import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../../widgets/component_docs.dart';

final inlineFeedbackHintComponent = WidgetbookComponent(
  name: 'Inline Feedback Hint',
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
          name: 'Inline Feedback Hint ($variant)',
          description:
              'Aadhaar input with built-in Verhoeff validation. '
              'Type a 12-digit number and the field auto-validates, '
              'showing success or error feedback inline.',
          code: isCard ? _inlineFeedbackHintCardCode : _inlineFeedbackHintCode,
          center: true,
          child: _InlineFeedbackHintMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _inlineFeedbackHintCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class InlineFeedbackHintScreen extends StatefulWidget {
  const InlineFeedbackHintScreen({super.key});

  @override
  State<InlineFeedbackHintScreen> createState() => _InlineFeedbackHintScreenState();
}

class _InlineFeedbackHintScreenState extends State<InlineFeedbackHintScreen> {
  String _aadhaarValue = '';

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
                      'Identity Verification',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: titleColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter your Aadhaar number to auto-fill your personal details.',
                      style: TextStyle(fontSize: 13, color: subtleColor),
                    ),
                    const SizedBox(height: 20),
                    // Ux4gAadhaarInputField internally validates the
                    // 12-digit Aadhaar using the Verhoeff algorithm and
                    // shows success / error caption automatically.
                    Ux4gAadhaarInputField(
                      value: _aadhaarValue,
                      onValueChange: (val) => setState(() => _aadhaarValue = val),
                      label: 'Aadhaar Number',
                      placeholder: 'Enter 12-digit Aadhaar number',
                      caption: 'Enter 12 digits — we will prefill your name and address',
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        text: 'Verify',
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
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _inlineFeedbackHintCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class InlineFeedbackHintCardScreen extends StatefulWidget {
  const InlineFeedbackHintCardScreen({super.key});

  @override
  State<InlineFeedbackHintCardScreen> createState() => _InlineFeedbackHintCardScreenState();
}

class _InlineFeedbackHintCardScreenState extends State<InlineFeedbackHintCardScreen> {
  String _aadhaarValue = '';

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
                      'Identity Verification',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: titleColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter your Aadhaar number to auto-fill your personal details.',
                      style: TextStyle(fontSize: 13, color: subtleColor),
                    ),
                    const SizedBox(height: 20),
                    // Ux4gAadhaarInputField internally validates the
                    // 12-digit Aadhaar using the Verhoeff algorithm and
                    // shows success / error caption automatically.
                    Ux4gAadhaarInputField(
                      value: _aadhaarValue,
                      onValueChange: (val) => setState(() => _aadhaarValue = val),
                      label: 'Aadhaar Number',
                      placeholder: 'Enter 12-digit Aadhaar number',
                      caption: 'Enter 12 digits — we will prefill your name and address',
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: Ux4gButton(
                  text: 'Verify',
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
// Hint Mockup Widget (interactive — StatefulWidget)
// ───────────────────────────────────────────────────────────────────────

class _InlineFeedbackHintMockup extends StatefulWidget {
  final bool isCard;

  const _InlineFeedbackHintMockup({this.isCard = false});

  @override
  State<_InlineFeedbackHintMockup> createState() => _InlineFeedbackHintMockupState();
}

class _InlineFeedbackHintMockupState extends State<_InlineFeedbackHintMockup> {
  String _aadhaarValue = '';

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
        backgroundColor: widget.isCard
            ? (isDark ? Ux4gPalette.primary800 : const Color(0xFFF2EFFF))
            : (isDark ? Ux4gPalette.neutral900 : Colors.white),
        body: SafeArea(
          child: Column(
            children: [
              // App Header
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
              if (!widget.isCard)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildDefaultContent(primaryColor, titleColor, subtleColor),
                  ),
                ),
              if (widget.isCard)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildCardContent(cardBg, primaryColor, titleColor, subtleColor),
                ),

              if (widget.isCard) const Spacer(),

              if (widget.isCard)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      text: 'Verify',
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
        Text(
          'Identity Verification',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter your Aadhaar number to auto-fill your personal details.',
          style: TextStyle(fontSize: 13, color: subtleColor),
        ),
        const SizedBox(height: 20),

        // Ux4gAadhaarInputField — internally validates via Verhoeff
        Ux4gAadhaarInputField(
          value: _aadhaarValue,
          onValueChange: (val) => setState(() => _aadhaarValue = val),
          label: 'Aadhaar Number',
          placeholder: 'Enter 12-digit Aadhaar number',
          caption: 'Enter 12 digits — we will prefill your name and address',
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
            SizedBox(
              width: double.infinity,
              child: Ux4gButton(
                text: 'Verify',
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
      },
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
