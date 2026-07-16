import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../../widgets/component_docs.dart';

final inlineFeedbackVerificationComponent = WidgetbookComponent(
  name: 'Inline Feedback Verification',
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
          name: 'Inline Feedback Verification ($variant)',
          description: isCard
              ? 'Document verification progress with timeline inside a card container.'
              : 'Document verification progress with timeline showing real-time status updates.',
          code: isCard ? _verificationCardCode : _verificationDefaultCode,
          center: true,
          child: _VerificationMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _verificationDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    final titleColor = isDark ? Ux4gColors.neutral50 : const Color(0xFF111827);
    final subtleText = isDark ? Ux4gColors.neutral200 : const Color(0xFF4B5563);
    final primaryColor = isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB);

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.neutral900 : Colors.white,
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
                      ? const ColorFilter.mode(Ux4gColors.neutral50, BlendMode.srcIn)
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
                    isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
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
                      'Verifying your Income Certificate Document',
                      style: typography.hS_strong.copyWith(color: titleColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'We are checking your uploaded PDF in real time. Each step below updates as the system completes it — keep this page open until all checks finish.',
                      style: typography.bS_default.copyWith(color: subtleText, height: 1.4),
                    ),
                    const SizedBox(height: 24),

                    // Document card with progress
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.neutral800 : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Income Certificate',
                                  style: typography.tM_strong.copyWith(color: titleColor),
                                ),
                              ),
                              Ux4gTag(
                                text: 'Verifying',
                                size: Ux4gTagSize.m,
                                style: Ux4gTagStyle.tonal,
                                colorScheme: Ux4gTagColor.warning,
                                customBackgroundColor: isDark ? Ux4gColors.orange800 : Ux4gColors.orange100,
                                customContentColor: isDark ? Ux4gColors.orange300 : Ux4gColors.orange800,
                                customBorderRadius: BorderRadius.circular(4),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'PDF document · 1.2 MB',
                            style: typography.bXS_default.copyWith(color: subtleText),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '2 of 3 checks passed — final check in progress',
                            style: typography.bXS_default.copyWith(color: subtleText),
                          ),
                          const SizedBox(height: 8),
                          Ux4gLinearProgress(
                            value: 0.66,
                            height: 6,
                            gradientColors: isDark
                                ? const [Ux4gColors.secondary600, Ux4gColors.secondary300]
                                : const [Ux4gColors.secondary200, Ux4gColors.secondary600],
                            trackColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                            shape: Ux4gProgressShape.rounded,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Timeline using Ux4gJourneyTimeline
                    Ux4gJourneyTimeline(
                      activeColor: primaryColor,
                      dateStyle: typography.bS_strong,
                      titleStyle: typography.tS_default,
                      steps: [
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.completed,
                          date: '22 June 2026',
                          title: 'File format and size within limits',
                          status: Ux4gJourneyStepStatus(
                            text: 'Passed',
                            badgeText: 'Passed',
                            badgeColor: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                            badgeTextColor: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                            badgePosition: Ux4gJourneyBadgePosition.topRight,
                          ),
                        ),
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.completed,
                          date: '25 June 2026',
                          title: 'Document is readable and not blurred',
                          status: Ux4gJourneyStepStatus(
                            text: 'Passed',
                            badgeText: 'Passed',
                            badgeColor: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                            badgeTextColor: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                            badgePosition: Ux4gJourneyBadgePosition.topRight,
                          ),
                        ),
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.current,
                          date: '31 June 2026',
                          title: 'Figures match the declared income',
                          status: Ux4gJourneyStepStatus(
                            text: 'Verifying',
                            badgeText: 'Verifying',
                            badgeColor: isDark ? Ux4gColors.orange800 : Ux4gColors.orange100,
                            badgeTextColor: isDark ? Ux4gColors.orange300 : Ux4gColors.orange800,
                            badgePosition: Ux4gJourneyBadgePosition.topRight,
                          ),
                        ),
                      ],
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
                  text: 'Track Status',
                  onPressed: () {},
                  variant: Ux4gButtonVariant.primary,
                  size: Ux4gButtonSize.large,
                  height: 48,
                  backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF4A2BC2),
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
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _verificationCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class VerificationCardScreen extends StatelessWidget {
  const VerificationCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    final titleColor = isDark ? Ux4gColors.neutral50 : const Color(0xFF111827);
    final subtleText = isDark ? Ux4gColors.neutral200 : const Color(0xFF4B5563);
    final primaryColor = isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB);
    final cardBg = isDark ? Ux4gColors.neutral800 : Colors.white;

    return Scaffold(
      backgroundColor: isDark ? Ux4gColors.primary800 : const Color(0xFFF2EFFF),
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
                      ? const ColorFilter.mode(Ux4gColors.neutral50, BlendMode.srcIn)
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
                    isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
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
                        'Verifying your Income Certificate Document',
                        style: typography.hS_strong.copyWith(color: titleColor),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'We are checking your uploaded PDF in real time. Each step below updates as the system completes it — keep this page open until all checks finish.',
                        style: typography.bS_default.copyWith(color: subtleText, height: 1.4),
                      ),
                      const SizedBox(height: 24),

                      // Document card with progress
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: isDark ? Ux4gColors.neutral900 : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Income Certificate',
                                    style: typography.tM_strong.copyWith(color: titleColor),
                                  ),
                                ),
                                Ux4gTag(
                                  text: 'Verifying',
                                  size: Ux4gTagSize.m,
                                  style: Ux4gTagStyle.tonal,
                                  colorScheme: Ux4gTagColor.warning,
                                  customBackgroundColor: isDark ? Ux4gColors.orange800 : Ux4gColors.orange100,
                                  customContentColor: isDark ? Ux4gColors.orange300 : Ux4gColors.orange800,
                                  customBorderRadius: BorderRadius.circular(4),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'PDF document · 1.2 MB',
                              style: typography.bXS_default.copyWith(color: subtleText),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '2 of 3 checks passed — final check in progress',
                              style: typography.bXS_default.copyWith(color: subtleText),
                            ),
                            const SizedBox(height: 8),
                            Ux4gLinearProgress(
                              value: 0.66,
                              height: 6,
                              gradientColors: isDark
                                  ? const [Ux4gColors.secondary600, Ux4gColors.secondary300]
                                  : const [Ux4gColors.secondary200, Ux4gColors.secondary600],
                              trackColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
                              shape: Ux4gProgressShape.rounded,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Timeline using Ux4gJourneyTimeline
                      Ux4gJourneyTimeline(
                        activeColor: primaryColor,
                        dateStyle: typography.bS_strong,
                        titleStyle: typography.tS_default,
                        steps: [
                          Ux4gJourneyStep(
                            state: Ux4gJourneyStepState.completed,
                            date: '22 June 2026',
                            title: 'File format and size within limits',
                            status: Ux4gJourneyStepStatus(
                              text: 'Passed',
                              badgeText: 'Passed',
                              badgeColor: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                              badgeTextColor: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                              badgePosition: Ux4gJourneyBadgePosition.topRight,
                            ),
                          ),
                          Ux4gJourneyStep(
                            state: Ux4gJourneyStepState.completed,
                            date: '25 June 2026',
                            title: 'Document is readable and not blurred',
                            status: Ux4gJourneyStepStatus(
                              text: 'Passed',
                              badgeText: 'Passed',
                              badgeColor: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                              badgeTextColor: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                              badgePosition: Ux4gJourneyBadgePosition.topRight,
                            ),
                          ),
                          Ux4gJourneyStep(
                            state: Ux4gJourneyStepState.current,
                            date: '31 June 2026',
                            title: 'Figures match the declared income',
                            status: Ux4gJourneyStepStatus(
                              text: 'Verifying',
                              badgeText: 'Verifying',
                              badgeColor: isDark ? Ux4gColors.orange800 : Ux4gColors.orange100,
                              badgeTextColor: isDark ? Ux4gColors.orange300 : Ux4gColors.orange800,
                              badgePosition: Ux4gJourneyBadgePosition.topRight,
                            ),
                          ),
                        ],
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
                  text: 'Track Status',
                  onPressed: () {},
                  variant: Ux4gButtonVariant.primary,
                  size: Ux4gButtonSize.large,
                  height: 48,
                  backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF4A2BC2),
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
// Verification Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _VerificationMockup extends StatelessWidget {
  final bool isCard;

  const _VerificationMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? Ux4gColors.primary300 : const Color(0xFF432CBB);
    final titleColor = isDark ? Ux4gColors.neutral50 : const Color(0xFF111827);
    final subtleText = isDark ? Ux4gColors.neutral200 : const Color(0xFF4B5563);
    final cardBg = isDark ? Ux4gColors.neutral800 : Colors.white;

    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: isCard
            ? (isDark ? Ux4gColors.primary800 : const Color(0xFFF2EFFF))
            : (isDark ? Ux4gColors.neutral900 : Colors.white),
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
                        ? const ColorFilter.mode(Ux4gColors.neutral50, BlendMode.srcIn)
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
                      isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
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
                      ? _buildCardContent(context, cardBg, primaryColor, titleColor, subtleText, isDark)
                      : _buildDefaultContent(context, primaryColor, titleColor, subtleText, isDark),
                ),
              ),

              // Track Status button
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: Ux4gButton(
                    text: 'Track Status',
                    onPressed: () {},
                    variant: Ux4gButtonVariant.primary,
                    size: Ux4gButtonSize.large,
                    height: 48,
                    backgroundColor: isDark ? Ux4gColors.primary300 : const Color(0xFF4A2BC2),
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

  Widget _buildFormFields(BuildContext context, Color primaryColor, Color titleColor, Color subtleText, bool isDark) {
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
          'Verifying your Income Certificate Document',
          style: typography.hS_strong.copyWith(color: titleColor),
        ),
        const SizedBox(height: 10),

        // Description
        Text(
          'We are checking your uploaded PDF in real time. Each step below updates as the system completes it — keep this page open until all checks finish.',
          style: typography.bS_default.copyWith(color: subtleText, height: 1.4),
        ),
        const SizedBox(height: 24),

        // Document card
        _buildDocumentCard(context, titleColor, subtleText, isDark),
        const SizedBox(height: 20),

        // Timeline using Ux4gJourneyTimeline
        Ux4gJourneyTimeline(
          activeColor: primaryColor,
          dateStyle: typography.bS_strong,
          titleStyle: typography.tS_default,
          steps: [
            Ux4gJourneyStep(
              state: Ux4gJourneyStepState.completed,
              date: '22 June 2026',
              title: 'File format and size within limits',
              status: Ux4gJourneyStepStatus(
                text: 'Passed',
                badgeText: 'Passed',
                badgeColor: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                badgeTextColor: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                badgePosition: Ux4gJourneyBadgePosition.topRight,
              ),
            ),
            Ux4gJourneyStep(
              state: Ux4gJourneyStepState.completed,
              date: '25 June 2026',
              title: 'Document is readable and not blurred',
              status: Ux4gJourneyStepStatus(
                text: 'Passed',
                badgeText: 'Passed',
                badgeColor: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
                badgeTextColor: isDark ? Ux4gColors.green300 : Ux4gColors.green800,
                badgePosition: Ux4gJourneyBadgePosition.topRight,
              ),
            ),
            Ux4gJourneyStep(
              state: Ux4gJourneyStepState.current,
              date: '31 June 2026',
              title: 'Figures match the declared income',
              status: Ux4gJourneyStepStatus(
                text: 'Verifying',
                badgeText: 'Verifying',
                badgeColor: isDark ? Ux4gColors.orange800 : Ux4gColors.orange100,
                badgeTextColor: isDark ? Ux4gColors.orange300 : Ux4gColors.orange800,
                badgePosition: Ux4gJourneyBadgePosition.topRight,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDocumentCard(BuildContext context, Color titleColor, Color subtleText, bool isDark) {
    final typography = Ux4gTheme.typography(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.neutral800 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row with tag
          Row(
            children: [
              Expanded(
                child: Text(
                  'Income Certificate',
                  style: typography.tM_strong.copyWith(color: titleColor),
                ),
              ),
              Ux4gTag(
                text: 'Verifying',
                size: Ux4gTagSize.m,
                style: Ux4gTagStyle.tonal,
                colorScheme: Ux4gTagColor.warning,
                customBackgroundColor: isDark ? Ux4gColors.orange800 : Ux4gColors.orange100,
                customContentColor: isDark ? Ux4gColors.orange300 : Ux4gColors.orange800,
                customBorderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'PDF document · 1.2 MB',
            style: typography.bXS_default.copyWith(color: subtleText),
          ),
          const SizedBox(height: 8),
          Text(
            '2 of 3 checks passed — final check in progress',
            style: typography.bXS_default.copyWith(color: subtleText),
          ),
          const SizedBox(height: 8),
          // Progress bar using Ux4gLinearProgress
          Ux4gLinearProgress(
            value: 0.66,
            height: 6,
            gradientColors: isDark
                ? const [Ux4gColors.secondary600, Ux4gColors.secondary300]
                : const [Ux4gColors.secondary200, Ux4gColors.secondary600],
            trackColor: isDark ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB),
            shape: Ux4gProgressShape.rounded,
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultContent(BuildContext context, Color primaryColor, Color titleColor, Color subtleText, bool isDark) {
    return _buildFormFields(context, primaryColor, titleColor, subtleText, isDark);
  }

  Widget _buildCardContent(BuildContext context, Color cardBg, Color primaryColor, Color titleColor, Color subtleText, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _buildFormFields(context, primaryColor, titleColor, subtleText, isDark),
    );
  }
}
