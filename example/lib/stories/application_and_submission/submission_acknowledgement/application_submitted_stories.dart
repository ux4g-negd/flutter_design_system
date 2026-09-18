import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final applicationSubmittedComponent = WidgetbookComponent(
  name: 'Application Submitted',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _applicationSubmittedCardCode
            : _applicationSubmittedDefaultCode;
        final child = variant == 'Card style'
            ? const _ApplicationSubmittedCardMockup()
            : const _ApplicationSubmittedMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Application Submitted',
          description:
              'A success confirmation screen shown after an application is submitted, '
              'displaying a reference number, next steps timeline, and action buttons.',
          code: code,
          center: true,
          child: child,
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Shared widgets
// ───────────────────────────────────────────────────────────────────────

class _SuccessIcon extends StatelessWidget {
  const _SuccessIcon();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark ? Ux4gColors.green800 : Ux4gColors.green100,
      ),
      child: Icon(
        Icons.check_circle,
        color: isDark ? Ux4gColors.green500 : Ux4gColors.green600,
        size: 36,
      ),
    );
  }
}

class _ReferenceCard extends StatelessWidget {
  const _ReferenceCard();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Ux4gColors.primary900 : Ux4gColors.primary50,
        border: Border.all(
          color: isDark ? Ux4gColors.primary600 : Ux4gColors.primary300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Application Reference',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'INC-2026-MH-04127',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? Ux4gColors.neutral50
                      : Ux4gColors.neutral900,
                ),
              ),
              Icon(
                Icons.copy_outlined,
                color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                size: 22,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ApplicationProgressTimeline extends StatelessWidget {
  const _ApplicationProgressTimeline();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What happens next',
          style: (Theme.of(context).extension<Ux4gTypography>()?.hS_strong ??
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
              .copyWith(
            color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
            border: Border.all(
              color: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Application Progress',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Track the status of your Income Certificate application',
                style: TextStyle(
                  fontSize: 13,
                  color: isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 20),
              Ux4gJourneyTimeline(
                activeColor: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                indicatorSize: 20,
                lineWidth: 3,
                indicatorCardSpacing: 12,
                stepSpacing: 12,
                cardColor: isDark ? Ux4gColors.neutral900 : Colors.white,
                cardBorderColor: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                cardBorderRadius: 8,
                steps: [
                  Ux4gJourneyStep(
                    state: Ux4gJourneyStepState.completed,
                    date: '02 Sep 2026',
                    title: 'Application Submitted',
                    status: Ux4gJourneyStepStatus(
                      text: '',
                      badgeText: 'Completed',
                      badgeColor: isDark ? Ux4gColors.green900 : const Color(0xFFDCFCE7),
                      badgeTextColor: isDark ? Ux4gColors.green400 : const Color(0xFF15803D),
                      badgePosition: Ux4gJourneyBadgePosition.topRight,
                    ),
                  ),
                  const Ux4gJourneyStep(
                    state: Ux4gJourneyStepState.current,
                    date: '03 Sep 2026',
                    title: 'Document Verification',
                    tag: 'Upcoming',
                  ),
                  const Ux4gJourneyStep(
                    state: Ux4gJourneyStepState.upcoming,
                    date: '06 Sep 2026',
                    title: 'Field Enquiry',
                    tag: 'Upcoming',
                  ),
                  const Ux4gJourneyStep(
                    state: Ux4gJourneyStepState.upcoming,
                    date: '10 Sep 2026',
                    title: 'Certificate Issued',
                    tag: 'Upcoming',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NotificationRow extends StatelessWidget {
  const _NotificationRow();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;
    final textColor = isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone_iphone, size: 20, color: iconColor),
            const SizedBox(width: 8),
            Text(
              'SMS sent to +91 98765 •••••',
              style: TextStyle(fontSize: 12, color: textColor),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.email_outlined, size: 20, color: iconColor),
            const SizedBox(width: 8),
            Text(
              'Email sent to r••••@gmail.com',
              style: TextStyle(fontSize: 12, color: textColor),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Ux4gButton(
          text: 'Track my application',
          onPressed: () {},
          size: Ux4gButtonSize.large,
          width: double.infinity,
          height: 48,
          backgroundColor: isDark
              ? Ux4gColors.primary300
              : Ux4gColors.primary600,
          contentColor: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
        ),
        SizedBox(height: 12),
        Ux4gButton(
          text: 'Download acknowledgement (PDF)',
          onPressed: () {},
          variant: Ux4gButtonVariant.outline,
          size: Ux4gButtonSize.large,
          width: double.infinity,
          height: 48,
          contentColor: isDark
              ? Ux4gColors.primary300
              : Ux4gColors.primary600,
          borderColor: isDark ? Ux4gColors.primary600 : Ux4gColors.primary300,
        ),
        SizedBox(height: 12),
        Ux4gButton(
          text: 'Add to calendar',
          onPressed: () {},
          size: Ux4gButtonSize.large,
          width: double.infinity,
          height: 48,
          backgroundColor: isDark
              ? Ux4gColors.primary800
              : Ux4gColors.primary100,
          contentColor: isDark
              ? Ux4gColors.primary300
              : Ux4gColors.primary600,
        ),
      ],
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const _applicationSubmittedDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationSubmittedScreen extends StatelessWidget {
  const ApplicationSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
                
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.neutral900
          : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Theme.of(context).brightness == Brightness.dark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                Container(height: 32, width: 1, color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200)),
                SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                ),
              ],
              actions: [
                Ux4gAppHeaderAction(
                  customWidget: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Icon(Icons.menu, color: Color(0xFF4A2BC2), size: 20),
                    ),
                  ),
                ),
              ],
              verticalPadding: 16,
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Divider(height: 1, color: Color(0xFFE5E7EB)),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back link
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back, size: 18, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                          SizedBox(width: 6),
                          Text('Return to services', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600)),
                        ],
                      ),
                    ),
                    SizedBox(height: 32),

                    // Success icon
                    Center(
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green800 : Ux4gColors.green100),
                        child: Icon(Icons.check_circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green500 : Ux4gColors.green600, size: 36),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Title
                    Center(
                      child: Text(
                        'Application Submitted\nSuccessfully',
                        textAlign: TextAlign.center,
                        style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900),
                      ),
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Your Income Certificate application is now\nunder review by the Revenue Department.',
                        textAlign: TextAlign.center,
                        style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Reference card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? Ux4gColors.primary900 : Ux4gColors.primary50,
                        border: Border.all(color: isDark ? Ux4gColors.primary600 : Ux4gColors.primary300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Application Reference', style: TextStyle(fontSize: 12, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('INC-2026-MH-04127', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                              Icon(Icons.copy_outlined, color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 22),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // What happens next - Journey Timeline
                    Text(
                      'What happens next',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.hS_strong ??
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                          .copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral50
                            : Ux4gColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
                        border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Application Progress',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.neutral50
                                  : Ux4gColors.neutral900,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Track the status of your Income Certificate application',
                            style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.neutral400
                                  : Ux4gColors.neutral600,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(height: 20),
                          Ux4gJourneyTimeline(
                            activeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                            indicatorSize: 20,
                            lineWidth: 3,
                            indicatorCardSpacing: 12,
                            stepSpacing: 12,
                            cardColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                            cardBorderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                            cardBorderRadius: 8,
                            steps: [
                              Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.completed,
                                date: '02 Sep 2026',
                                title: 'Application Submitted',
                                status: Ux4gJourneyStepStatus(
                                  text: '',
                                  badgeText: 'Completed',
                                  badgeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green900 : const Color(0xFFDCFCE7),
                                  badgeTextColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green400 : const Color(0xFF15803D),
                                  badgePosition: Ux4gJourneyBadgePosition.topRight,
                                ),
                              ),
                              const Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.current,
                                date: '03 Sep 2026',
                                title: 'Document Verification',
                                tag: 'Upcoming',
                              ),
                              const Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.upcoming,
                                date: '06 Sep 2026',
                                title: 'Field Enquiry',
                                tag: 'Upcoming',
                              ),
                              const Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.upcoming,
                                date: '10 Sep 2026',
                                title: 'Certificate Issued',
                                tag: 'Upcoming',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    // Notifications
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.phone_iphone, size: 20, color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                            SizedBox(width: 8),
                            Text('SMS sent to +91 98765 •••••', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.email_outlined, size: 20, color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                            SizedBox(width: 8),
                            Text('Email sent to r••••@gmail.com', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(text: 'Track my application', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48, backgroundColor: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600, contentColor: isDark ? Ux4gColors.neutral900 : Ux4gColors.neutral50),
                  SizedBox(height: 12),
                  Ux4gButton(text: 'Download acknowledgement (PDF)', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, height: 48, contentColor: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600, borderColor: isDark ? Ux4gColors.primary600 : Ux4gColors.primary300),
                  SizedBox(height: 12),
                  Ux4gButton(text: 'Add to calendar', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48, backgroundColor: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100, contentColor: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400))),
                  SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
""";

const _applicationSubmittedCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationSubmittedCardScreen extends StatelessWidget {
  const ApplicationSubmittedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
                
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50,
      body: SafeArea(
        child: Column(
          children: [
            // Header with white background
            Container(
              color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: Theme.of(context).brightness == Brightness.dark ? Ux4gAppHeaderVariant.light : Ux4gAppHeaderVariant.light,
                    leadingWidgets: [
                      SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                      Container(height: 32, width: 1, color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral700 : Ux4gColors.neutral200)),
                      SvgPicture.asset(
                  Ux4gIcons.union, 
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                ),
                    ],
                    actions: [
                      Ux4gAppHeaderAction(
                        customWidget: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Icon(Icons.menu, color: Color(0xFF4A2BC2), size: 20),
                          ),
                        ),
                      ),
                    ],
                    verticalPadding: 16,
                    horizontalPadding: 16,
                    leadingSpacing: 8,
                  ),
                  Divider(height: 1, color: Color(0xFFE5E7EB)),
                ],
              ),
            ),

            // White card with all content inside
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20, spreadRadius: 2, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back link
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back, size: 18, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                            SizedBox(width: 6),
                            Text('Return to services', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600)),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),

                      // Success icon
                      Center(
                        child: Container(
                          width: 56, height: 56,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green800 : Ux4gColors.green100),
                          child: Icon(Icons.check_circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green500 : Ux4gColors.green600, size: 36),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Title
                      Center(
                        child: Text(
                          'Application Submitted\nSuccessfully',
                          textAlign: TextAlign.center,
                          style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900),
                        ),
                      ),
                      SizedBox(height: 12),
                      Center(
                        child: Text(
                          'Your Income Certificate application is now\nunder review by the Revenue Department.',
                          textAlign: TextAlign.center,
                          style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Reference card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : Ux4gColors.neutral200)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Application Reference', style: TextStyle(fontSize: 12, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('INC-2026-MH-04127', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                                Icon(Icons.copy_outlined, color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600), size: 22),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // What happens next - Journey Timeline
                      Text(
                        'What happens next',
                        style: (Theme.of(context).extension<Ux4gTypography>()?.hS_strong ??
                                const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                            .copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral0,
                          border: Border.all(
                            color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Application Progress',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Ux4gColors.neutral50
                                    : Ux4gColors.neutral900,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Track the status of your Income Certificate application',
                              style: TextStyle(
                                fontSize: 13,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Ux4gColors.neutral400
                                    : Ux4gColors.neutral600,
                                height: 1.4,
                              ),
                            ),
                            SizedBox(height: 20),
                            Ux4gJourneyTimeline(
                              activeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                              indicatorSize: 20,
                              lineWidth: 3,
                              indicatorCardSpacing: 12,
                              stepSpacing: 12,
                              cardColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                              cardBorderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                              cardBorderRadius: 8,
                              steps: [
                                Ux4gJourneyStep(
                                  state: Ux4gJourneyStepState.completed,
                                  date: '02 Sep 2026',
                                  title: 'Application Submitted',
                                  status: Ux4gJourneyStepStatus(
                                    text: '',
                                    badgeText: 'Completed',
                                    badgeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green900 : const Color(0xFFDCFCE7),
                                    badgeTextColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green400 : const Color(0xFF15803D),
                                    badgePosition: Ux4gJourneyBadgePosition.topRight,
                                  ),
                                ),
                                const Ux4gJourneyStep(
                                  state: Ux4gJourneyStepState.current,
                                  date: '03 Sep 2026',
                                  title: 'Document Verification',
                                  tag: 'Upcoming',
                                ),
                                const Ux4gJourneyStep(
                                  state: Ux4gJourneyStepState.upcoming,
                                  date: '06 Sep 2026',
                                  title: 'Field Enquiry',
                                  tag: 'Upcoming',
                                ),
                                const Ux4gJourneyStep(
                                  state: Ux4gJourneyStepState.upcoming,
                                  date: '10 Sep 2026',
                                  title: 'Certificate Issued',
                                  tag: 'Upcoming',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),

                      // Notifications
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.phone_iphone, size: 20, color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                              SizedBox(width: 8),
                              Text('SMS sent to +91 98765 •••••', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.email_outlined, size: 20, color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                              SizedBox(width: 8),
                              Text('Email sent to r••••@gmail.com', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Ux4gButton(text: 'Track my application', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48, backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50),
                  SizedBox(height: 12),
                  Ux4gButton(text: 'Download acknowledgement (PDF)', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, height: 48, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300),
                  SizedBox(height: 12),
                  Ux4gButton(text: 'Add to calendar', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48, backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary800 : Ux4gColors.primary100, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400))),
                  SizedBox(width: 8),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                ],
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
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _ApplicationSubmittedMockup extends StatelessWidget {
  const _ApplicationSubmittedMockup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.neutral900
          : Ux4gColors.neutral50,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Ux4gAppHeader(
              variant: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gAppHeaderVariant.light
                  : Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(
                  _nationalEmblemLogoPath,
                  height: 40,
                  colorFilter: Theme.of(context).brightness == Brightness.dark
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                      : null,
                  errorBuilder: (c, e, s) =>
                      Icon(Icons.account_balance, size: 32, color: Colors.grey),
                ),
                Container(
                  height: 32,
                  width: 1,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Ux4gColors.neutral700
                      : Ux4gColors.neutral200),
                ),
                SvgPicture.asset(
                  _unionLogoPath,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.primary300
                        : Ux4gColors.primary600,
                    BlendMode.srcIn,
                  ),
                  errorBuilder: (c, e, s) =>
                      Icon(Icons.blur_on, size: 32, color: Colors.blue),
                ),
              ],
              actions: [
                Ux4gAppHeaderAction(
                  customWidget: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral800
                            : const Color(0xFFE5E7EB),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.primary400
                            : Ux4gColors.primary600,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
              verticalPadding: 16,
              horizontalPadding: 16,
              leadingSpacing: 8,
            ),
            Divider(height: 1, color: Color(0xFFE5E7EB)),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back link
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.primary300
                              : Ux4gColors.primary600,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Return to services',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),

                    // Success icon
                    Center(child: _SuccessIcon()),
                    SizedBox(height: 20),

                    // Title
                    Center(
                      child: Text(
                        'Application Submitted\nSuccessfully',
                        textAlign: TextAlign.center,
                        style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Your Income Certificate application is now\nunder review by the Revenue Department.',
                        textAlign: TextAlign.center,
                        style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Reference card
                    const _ReferenceCard(),
                    SizedBox(height: 20),

                    // Next steps timeline
                    const _ApplicationProgressTimeline(),
                    SizedBox(height: 24),

                    // Notification row
                    const _NotificationRow(),
                  ],
                ),
              ),
            ),

            // Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: const _ActionButtons(),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powered by -',
                    style: TextStyle(
                      fontSize: 11,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral500
                          : Ux4gColors.neutral400),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    _digitalIndiaLogoPath,
                    height: 22,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : null,
                    errorBuilder: (c, e, s) => Text(
                      'Digital India',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ApplicationSubmittedCardMockup extends StatelessWidget {
  const _ApplicationSubmittedCardMockup();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.primary900
            : Ux4gColors.primary50,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.primary900
            : Ux4gColors.primary50,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with white background
              Container(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Ux4gColors.neutral900
                    : Ux4gColors.neutral0,
                child: Column(
                  children: [
                    Ux4gAppHeader(
                      variant: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gAppHeaderVariant.light
                          : Ux4gAppHeaderVariant.light,
                      title: '',
                      leadingWidgets: [
                        SvgPicture.asset(
                          _nationalEmblemLogoPath,
                          height: 40,
                          colorFilter:
                              Theme.of(context).brightness == Brightness.dark
                              ? const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                )
                              : null,
                          errorBuilder: (c, e, s) => Icon(
                            Icons.account_balance,
                            size: 32,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 32,
                          width: 1,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral700
                              : Ux4gColors.neutral200),
                        ),
                        SvgPicture.asset(
                          _unionLogoPath,
                          height: 32,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).brightness == Brightness.dark
                                ? Ux4gColors.primary300
                                : Ux4gColors.primary600,
                            BlendMode.srcIn,
                          ),
                          errorBuilder: (c, e, s) =>
                              Icon(Icons.blur_on, size: 32, color: Colors.blue),
                        ),
                      ],
                      actions: [
                        Ux4gAppHeaderAction(
                          customWidget: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Ux4gColors.neutral800
                                    : const Color(0xFFE5E7EB),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.menu,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Ux4gColors.primary400
                                    : Ux4gColors.primary600,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                      verticalPadding: 16,
                      horizontalPadding: 16,
                      leadingSpacing: 8,
                    ),
                    Divider(height: 1, color: Color(0xFFE5E7EB)),
                  ],
                ),
              ),

              // White card with all content inside
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.neutral900
                          : Ux4gColors.neutral50,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back link
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 18,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Return to services',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gColors.primary300
                                    : Ux4gColors.primary600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),

                        // Success icon
                        Center(child: _SuccessIcon()),
                        SizedBox(height: 20),

                        // Title
                        Center(
                          child: Text(
                            'Application Submitted\nSuccessfully',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Center(
                          child: Text(
                            'Your Income Certificate application is now\nunder review by the Revenue Department.',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Reference card
                        const _ReferenceCard(),
                        SizedBox(height: 20),

                        // Next steps timeline
                        const _ApplicationProgressTimeline(),
                        SizedBox(height: 24),

                        // Notification row
                        const _NotificationRow(),
                        const SizedBox(height: 24),
                        const _ActionButtons(),
                      ],
                    ),
                  ),
                ),
              ),

              // Footer
              Padding(
                padding: const EdgeInsets.only(bottom: 24, top: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(
                        fontSize: 11,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral500
                            : Ux4gColors.neutral400),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 22,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : null,
                      errorBuilder: (c, e, s) => Text(
                        'Digital India',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
