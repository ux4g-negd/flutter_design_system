import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../../widgets/component_docs.dart';

final inlineFeedbackNoteComponent = WidgetbookComponent(
  name: 'Inline Feedback Note',
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
          name: 'Inline Feedback Note ($variant)',
          description: isCard
              ? 'A note from a reviewing officer inside a card container. Shows an important message with action required.'
              : 'A note from a reviewing officer displayed inline. Shows an important message with action required.',
          code: isCard ? _noteCardCode : _noteDefaultCode,
          center: true,
          child: _NoteMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _noteDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class NoteToCitizenScreen extends StatelessWidget {
  const NoteToCitizenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleText = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);

    final bannerBg = isDark ? Ux4gPalette.orange900 : Ux4gPalette.orange50;
    final bannerBorder = isDark ? Ux4gPalette.orange600 : Ux4gPalette.orange300;
    final bannerText = isDark ? Ux4gPalette.orange300 : Ux4gPalette.orange800;
    final bannerIcon = isDark ? Ux4gPalette.orange500 : Ux4gPalette.orange600;

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
                      'Note to Citizen',
                      style: typography.hXS_strong.copyWith(color: titleColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'A note written by a reviewing officer.',
                      style: typography.bS_default.copyWith(color: subtleText, height: 1.4),
                    ),
                    const SizedBox(height: 24),

                    // Note card status banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: bannerBg,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: bannerBorder),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.error, size: 20, color: bannerIcon),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Note from Revenue Inspector - 12 April 2026, 11:34 AM',
                                  style: typography.bS_strong.copyWith(color: bannerText),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Please resubmit the income proof with a clearer scan. The current file shows glare on the income figure row. Resubmit within 5 working days to avoid delay.',
                                  style: typography.bS_default.copyWith(color: bannerText, height: 1.4),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        text: 'Resubmit Documents',
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

const _noteCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class NoteToCitizenCardScreen extends StatelessWidget {
  const NoteToCitizenCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleText = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final cardBg = isDark ? Ux4gPalette.neutral800 : Colors.white;

    final bannerBg = isDark ? Ux4gPalette.orange900 : Ux4gPalette.orange50;
    final bannerBorder = isDark ? Ux4gPalette.orange600 : Ux4gPalette.orange300;
    final bannerText = isDark ? Ux4gPalette.orange300 : Ux4gPalette.orange800;
    final bannerIcon = isDark ? Ux4gPalette.orange500 : Ux4gPalette.orange600;

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
                        'Note to Citizen',
                        style: typography.hXS_strong.copyWith(color: titleColor),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'A note written by a reviewing officer.',
                        style: typography.bS_default.copyWith(color: subtleText, height: 1.4),
                      ),
                      const SizedBox(height: 24),

                      // Note card status banner
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: bannerBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: bannerBorder),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.error, size: 20, color: bannerIcon),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Note from Revenue Inspector - 12 April 2026, 11:34 AM',
                                    style: typography.bS_strong.copyWith(color: bannerText),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Please resubmit the income proof with a clearer scan. The current file shows glare on the income figure row. Resubmit within 5 working days to avoid delay.',
                                    style: typography.bS_default.copyWith(color: bannerText, height: 1.4),
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
                  text: 'Resubmit Documents',
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
// Note Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _NoteMockup extends StatelessWidget {
  final bool isCard;

  const _NoteMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Ux4gPalette.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gPalette.neutral50 : const Color(0xFF111827);
    final subtleText = isDark ? Ux4gPalette.neutral200 : const Color(0xFF4B5563);
    final cardBg = isDark ? Ux4gPalette.neutral800 : Colors.white;

    final bannerBg = isDark ? Ux4gPalette.orange900 : Ux4gPalette.orange50;
    final bannerBorder = isDark ? Ux4gPalette.orange600 : Ux4gPalette.orange300;
    final bannerText = isDark ? Ux4gPalette.orange300 : Ux4gPalette.orange800;
    final bannerIcon = isDark ? Ux4gPalette.orange500 : Ux4gPalette.orange600;

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
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: isCard
                      ? _buildCardContent(context, cardBg, primaryColor, titleColor, subtleText, bannerBg, bannerBorder, bannerText, bannerIcon)
                      : _buildFormFields(context, primaryColor, titleColor, subtleText, bannerBg, bannerBorder, bannerText, bannerIcon),
                ),
              ),

              // Resubmit Documents button
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: Ux4gButton(
                    text: 'Resubmit Documents',
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

  Widget _buildFormFields(
    BuildContext context,
    Color primaryColor,
    Color titleColor,
    Color subtleText,
    Color bannerBg,
    Color bannerBorder,
    Color bannerText,
    Color bannerIcon,
  ) {
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
          'Note to Citizen',
          style: typography.hXS_strong.copyWith(color: titleColor),
        ),
        const SizedBox(height: 10),

        // Description
        Text(
          'A note written by a reviewing officer.',
          style: typography.bS_default.copyWith(color: subtleText, height: 1.4),
        ),
        const SizedBox(height: 24),

        // Note card status banner
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bannerBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: bannerBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.error, size: 20, color: bannerIcon),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note from Revenue Inspector - 12 April 2026, 11:34 AM',
                      style: typography.bS_strong.copyWith(color: bannerText),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Please resubmit the income proof with a clearer scan. The current file shows glare on the income figure row. Resubmit within 5 working days to avoid delay.',
                      style: typography.bS_default.copyWith(color: bannerText, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardContent(
    BuildContext context,
    Color cardBg,
    Color primaryColor,
    Color titleColor,
    Color subtleText,
    Color bannerBg,
    Color bannerBorder,
    Color bannerText,
    Color bannerIcon,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildFormFields(context, primaryColor, titleColor, subtleText, bannerBg, bannerBorder, bannerText, bannerIcon),
    );
  }
}
