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

class _NotificationRow extends StatelessWidget {
  const _NotificationRow();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;
    final textColor = isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.phone_iphone, size: 20, color: iconColor),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'SMS sent to +91\n98765 •••••',
            style: TextStyle(fontSize: 12, color: textColor, height: 1.4),
          ),
        ),
        SizedBox(width: 16),
        Icon(Icons.email_outlined, size: 20, color: iconColor),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            'Email sent to\nr••••@gmail.com',
            style: TextStyle(fontSize: 12, color: textColor, height: 1.4),
          ),
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
                    Ux4gJourneyTimeline(
                      header: const Ux4gJourneyHeader(title: 'What happens next'),
                      indicatorCardSpacing: 16,
                      indicatorSize: 24,
                      steps: [
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.completed,
                          stepNumber: '1',
                          date: 'Date',
                          title: 'Title',
                          helpingText: 'Helping Text',
                        ),
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.completed,
                          stepNumber: '2',
                          date: 'Date',
                          title: 'Title',
                          helpingText: 'Helping Text',
                        ),
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.completed,
                          stepNumber: '3',
                          date: 'Date',
                          title: 'Title',
                          helpingText: 'Helping Text',
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Notification row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.phone_iphone, size: 20, color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                        SizedBox(width: 8),
                        Expanded(child: Text('SMS sent to +91\n98765 •••••', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700, height: 1.4))),
                        SizedBox(width: 16),
                        Icon(Icons.email_outlined, size: 20, color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                        SizedBox(width: 8),
                        Expanded(child: Text('Email sent to\nr••••@gmail.com', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700, height: 1.4))),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400))),
                  SizedBox(height: 6),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 24, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
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
                      Ux4gJourneyTimeline(
                        header: const Ux4gJourneyHeader(title: 'What happens next'),
                        indicatorCardSpacing: 16,
                        indicatorSize: 24,
                        steps: [
                          Ux4gJourneyStep(
                            state: Ux4gJourneyStepState.completed,
                            stepNumber: '1',
                            date: 'Date',
                            title: 'Title',
                            helpingText: 'Helping Text',
                          ),
                          Ux4gJourneyStep(
                            state: Ux4gJourneyStepState.completed,
                            stepNumber: '2',
                            date: 'Date',
                            title: 'Title',
                            helpingText: 'Helping Text',
                          ),
                          Ux4gJourneyStep(
                            state: Ux4gJourneyStepState.completed,
                            stepNumber: '3',
                            date: 'Date',
                            title: 'Title',
                            helpingText: 'Helping Text',
                          ),
                        ],
                      ),
                      SizedBox(height: 24),

                      // Notification row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.phone_iphone, size: 20, color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                          SizedBox(width: 8),
                          Expanded(child: Text('SMS sent to +91\n98765 •••••', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700, height: 1.4))),
                          SizedBox(width: 16),
                          Icon(Icons.email_outlined, size: 20, color: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600),
                          SizedBox(width: 8),
                          Expanded(child: Text('Email sent to\nr••••@gmail.com', style: TextStyle(fontSize: 12, color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700, height: 1.4))),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: (Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral500 : Ux4gColors.neutral400))),
                  SizedBox(height: 6),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 24, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
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
                    Ux4gJourneyTimeline(
                      header: const Ux4gJourneyHeader(
                        title: 'What happens next',
                      ),
                      indicatorCardSpacing: 16,
                      indicatorSize: 24,
                      steps: [
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.completed,
                          stepNumber: '1',
                          date: 'Date',
                          title: 'Title',
                          helpingText: 'Helping Text',
                        ),
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.completed,
                          stepNumber: '2',
                          date: 'Date',
                          title: 'Title',
                          helpingText: 'Helping Text',
                        ),
                        Ux4gJourneyStep(
                          state: Ux4gJourneyStepState.completed,
                          stepNumber: '3',
                          date: 'Date',
                          title: 'Title',
                          helpingText: 'Helping Text',
                        ),
                      ],
                    ),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  SizedBox(height: 6),
                  Image.asset(
                    _digitalIndiaLogoPath,
                    height: 24,
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
                          color: Colors.black.withOpacity(0.06),
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
                        Ux4gJourneyTimeline(
                          header: const Ux4gJourneyHeader(
                            title: 'What happens next',
                          ),
                          indicatorCardSpacing: 16,
                          indicatorSize: 24,
                          steps: [
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '1',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '2',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              stepNumber: '3',
                              date: 'Date',
                              title: 'Title',
                              helpingText: 'Helping Text',
                            ),
                          ],
                        ),
                        SizedBox(height: 24),

                        // Notification row
                        const _NotificationRow(),
                      ],
                    ),
                  ),
                ),
              ),

              // Actions
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: const _ActionButtons(),
              ),

              // Footer
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    SizedBox(height: 6),
                    Image.asset(
                      _digitalIndiaLogoPath,
                      height: 24,
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
