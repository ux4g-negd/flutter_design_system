import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../../widgets/component_docs.dart';

final inlineFeedbackGuidanceComponent = WidgetbookComponent(
  name: 'Inline Feedback Guidance',
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
          name: 'Inline Feedback Guidance ($variant)',
          description: isCard
              ? 'Conditional guidance with file upload area inside a card container. '
                    'Shows context-sensitive info based on selected field value.'
              : 'Conditional guidance with file upload area. '
                    'Shows context-sensitive info based on selected field value.',
          code: isCard
              ? _inlineFeedbackGuidanceCardCode
              : _inlineFeedbackGuidanceCode,
          center: true,
          child: _InlineFeedbackGuidanceMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Guidance Default
// ───────────────────────────────────────────────────────────────────────

const _inlineFeedbackGuidanceCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class InlineFeedbackGuidanceScreen extends StatelessWidget {
  const InlineFeedbackGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleColor = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);

    // Status Banner Colors
    final warningBg = isDark ? Ux4gPalette.orange900 : Ux4gPalette.orange50;
    final warningBorder = isDark ? Ux4gPalette.orange600 : Ux4gPalette.orange300;
    final warningTextColor = isDark ? Ux4gPalette.orange300 : Ux4gPalette.orange800;
    final warningIconColor = isDark ? Ux4gPalette.orange500 : Ux4gPalette.orange300;

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
              child: SingleChildScrollView(
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
                      'Conditional Guidance',
                      style: typography.hXS_strong.copyWith(color: titleColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Context-sensitive info appears based on the selected field value.',
                      style: typography.bS_default.copyWith(color: subtleColor),
                    ),
                    const SizedBox(height: 24),
                    Ux4gInputField(
                      value: 'SC/ST',
                      onValueChange: (_) {},
                      label: 'Reservation Category',
                      caption: 'Select your reservation category',
                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    Ux4gFileUpload(
                      maxFiles: 1,
                      maxFileSize: 5 * 1024 * 1024,
                      allowedExtensions: const ['pdf', 'jpg', 'png'],
                      borderStyle: Ux4gFileUploadBorderStyle.dashed,
                      variant: Ux4gFileUploadVariant.dropzone,
                      onFilesChanged: (_) {},
                    ),
                    const SizedBox(height: 20),
                    // Warning banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: warningBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: warningBorder),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.error, size: 18, color: warningIconColor),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Additional Document Required',
                                  style: typography.bS_strong.copyWith(color: warningTextColor),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Since you selected SC category, please upload your caste certificate in the Documents step.',
                                  style: typography.bS_default.copyWith(color: warningTextColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
// Source Code String — Guidance Card Style
// ───────────────────────────────────────────────────────────────────────

const _inlineFeedbackGuidanceCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class InlineFeedbackGuidanceCardScreen extends StatelessWidget {
  const InlineFeedbackGuidanceCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleColor = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
    final cardBg = isDark ? Ux4gPalette.neutral800 : Colors.white;

    // Status Banner Colors
    final warningBg = isDark ? Ux4gPalette.orange900 : Ux4gPalette.orange50;
    final warningBorder = isDark ? Ux4gPalette.orange600 : Ux4gPalette.orange300;
    final warningTextColor = isDark ? Ux4gPalette.orange300 : Ux4gPalette.orange800;
    final warningIconColor = isDark ? Ux4gPalette.orange500 : Ux4gPalette.orange300;

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
            Expanded(
              child: SingleChildScrollView(
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
                        'Conditional Guidance',
                        style: typography.hXS_strong.copyWith(color: titleColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Context-sensitive info appears based on the selected field value.',
                        style: typography.bS_default.copyWith(color: subtleColor),
                      ),
                      const SizedBox(height: 20),
                      Ux4gInputField(
                        value: 'SC/ST',
                        onValueChange: (_) {},
                        label: 'Reservation Category',
                        caption: 'Select your reservation category',
                      ),
                      const SizedBox(height: 20),
                      Ux4gFileUpload(
                        maxFiles: 1,
                        maxFileSize: 5 * 1024 * 1024,
                        allowedExtensions: const ['pdf', 'jpg', 'png'],
                        borderStyle: Ux4gFileUploadBorderStyle.dashed,
                        variant: Ux4gFileUploadVariant.dropzone,
                        onFilesChanged: (_) {},
                      ),
                      const SizedBox(height: 20),
                      // Warning banner
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: warningBg,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: warningBorder),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.error, size: 18, color: warningIconColor),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Additional Document Required',
                                    style: typography.bS_strong.copyWith(color: warningTextColor),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Since you selected SC category, please upload your caste certificate in the Documents step.',
                                    style: typography.bS_default.copyWith(color: warningTextColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
// Guidance Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _InlineFeedbackGuidanceMockup extends StatelessWidget {
  final bool isCard;

  const _InlineFeedbackGuidanceMockup({this.isCard = false});

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
              // App Header with elevation
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
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: isCard
                      ? _buildCardContent(context, cardBg, primaryColor, titleColor, subtleColor, isDark)
                      : _buildDefaultContent(context, primaryColor, titleColor, subtleColor, isDark),
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
      ),
    );
  }

  Widget _buildFormFields(BuildContext context, Color primaryColor, Color titleColor, Color subtleColor, bool isDark) {
    final typography = Ux4gTheme.typography(context);

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
          'Conditional Guidance',
          style: typography.hXS_strong.copyWith(color: titleColor),
        ),
        const SizedBox(height: 10),

        // Description
        Text(
          'Context-sensitive info appears based on the selected field value.',
          style: typography.bS_default.copyWith(color: subtleColor),
        ),
        const SizedBox(height: 24),

        // Reservation Category input
        Ux4gInputField(
          value: 'SC/ST',
          onValueChange: (_) {},
          label: 'Reservation Category',
          caption: 'Select your reservation category',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
        ),
        const SizedBox(height: 20),

        // File upload area
        Ux4gFileUpload(
          maxFiles: 1,
          maxFileSize: 5 * 1024 * 1024,
          allowedExtensions: const ['pdf', 'jpg', 'png'],
          borderStyle: Ux4gFileUploadBorderStyle.dashed,
          variant: Ux4gFileUploadVariant.dropzone,
          onFilesChanged: (_) {},
        ),
        const SizedBox(height: 20),

        // Warning banner
        _buildWarningBanner(context, isDark),
      ],
    );
  }

  Widget _buildWarningBanner(BuildContext context, bool isDark) {
    final typography = Ux4gTheme.typography(context);
    final warningBg = isDark ? Ux4gPalette.orange900 : Ux4gPalette.orange50;
    final warningBorder = isDark ? Ux4gPalette.orange600 : Ux4gPalette.orange300;
    final warningTextColor = isDark ? Ux4gPalette.orange300 : Ux4gPalette.orange800;
    final warningIconColor = isDark ? Ux4gPalette.orange500 : Ux4gPalette.orange300;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: warningBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: warningBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error, size: 18, color: warningIconColor),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Additional Document Required',
                  style: typography.bS_strong.copyWith(color: warningTextColor),
                ),
                const SizedBox(height: 4),
                Text(
                  'Since you selected SC category, please upload your caste certificate in the Documents step.',
                  style: typography.bS_default.copyWith(color: warningTextColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultContent(BuildContext context, Color primaryColor, Color titleColor, Color subtleColor, bool isDark) {
    return _buildFormFields(context, primaryColor, titleColor, subtleColor, isDark);
  }

  Widget _buildCardContent(BuildContext context, Color cardBg, Color primaryColor, Color titleColor, Color subtleColor, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildFormFields(context, primaryColor, titleColor, subtleColor, isDark),
    );
  }
}
