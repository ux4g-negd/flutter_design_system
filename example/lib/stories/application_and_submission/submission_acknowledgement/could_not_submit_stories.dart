import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

// ───────────────────────────────────────────────────────────────────────
// Constants
// ───────────────────────────────────────────────────────────────────────

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final couldNotSubmitComponent = WidgetbookComponent(
  name: 'Could Not Submit',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card style'],
          initialOption: 'Default',
          description:
              'Switch between the standard flat layout and the card-style layout.',
        );

        final code = variant == 'Card style'
            ? _couldNotSubmitCardCode
            : _couldNotSubmitDefaultCode;
        final child = variant == 'Card style'
            ? const _CouldNotSubmitCardMockup()
            : const _CouldNotSubmitMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Could Not Submit',
          description:
              'An error screen shown when the application could not be submitted due to '
              'a network or server error, with options to retry, save draft, or contact support.',
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

class _ErrorIcon extends StatelessWidget {
  const _ErrorIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.red900
            : Ux4gColors.red50,
      ),
      child: Icon(
        Icons.error,
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.red500
            : Ux4gColors.red600,
        size: 30,
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
                'Submission failed due to a network error. Your data is saved — retry when ready',
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
                    title: 'Draft Saved',
                    status: Ux4gJourneyStepStatus(
                      text: '',
                      badgeText: 'Saved',
                      badgeColor: isDark ? Ux4gColors.green900 : const Color(0xFFDCFCE7),
                      badgeTextColor: isDark ? Ux4gColors.green400 : const Color(0xFF15803D),
                      badgePosition: Ux4gJourneyBadgePosition.topRight,
                    ),
                  ),
                  Ux4gJourneyStep(
                    state: Ux4gJourneyStepState.current,
                    date: '02 Sep 2026',
                    title: 'Submission Failed',
                    status: Ux4gJourneyStepStatus(
                      text: '',
                      badgeText: 'Failed',
                      badgeColor: isDark ? const Color(0xFF7F1D1D) : const Color(0xFFFEE2E2),
                      badgeTextColor: isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626),
                      badgePosition: Ux4gJourneyBadgePosition.topRight,
                    ),
                  ),
                  const Ux4gJourneyStep(
                    state: Ux4gJourneyStepState.upcoming,
                    date: 'Pending',
                    title: 'Document Verification',
                    tag: 'Blocked',
                  ),
                  const Ux4gJourneyStep(
                    state: Ux4gJourneyStepState.upcoming,
                    date: 'Pending',
                    title: 'Certificate Issued',
                    tag: 'Blocked',
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

class _ErrorToastCard extends StatelessWidget {
  final VoidCallback? onClose;
  const _ErrorToastCard({this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.neutral900
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).brightness == Brightness.dark
                ? Ux4gColors.red500
                : Ux4gColors.red600,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Could not submit',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral50
                        : Ux4gColors.neutral900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Network or server issue',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral400
                        : Ux4gColors.neutral500,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onClose,
            child: Icon(
              Icons.close,
              size: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Ux4gColors.neutral400
                  : Ux4gColors.neutral500,
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Source Code Strings
// ───────────────────────────────────────────────────────────────────────

const _couldNotSubmitDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CouldNotSubmitScreen extends StatelessWidget {
  const CouldNotSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    
    
    

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Ux4gAppHeader(
                        variant: Ux4gAppHeaderVariant.light,
                        leadingWidgets: [
                          SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                          Container(height: 32, width: 1, color: const Color(0xFFD1D5DB)),
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
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                    ],
                  ),
                ),

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
                              Icon(
                                Icons.arrow_back,
                                size: 18,
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Return to services',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        // Error icon
                        Center(
                          child: Container(
                            width: 56, height: 56,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red900 : Ux4gColors.red50),
                            child: const Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red500 : Ux4gColors.red600, size: 30),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Title
                        Center(
                          child: Text(
                            'Could Not Submit\nApplication',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            'We could not submit your application due to\na network or server error. Your data is saved —\ntry again.',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
                          ),
                        ),
                        const SizedBox(height: 32),

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
                                'Submission failed due to a network error. Your data is saved — retry when ready',
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
                                    title: 'Draft Saved',
                                    status: Ux4gJourneyStepStatus(
                                      text: '',
                                      badgeText: 'Saved',
                                      badgeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green900 : const Color(0xFFDCFCE7),
                                      badgeTextColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green400 : const Color(0xFF15803D),
                                      badgePosition: Ux4gJourneyBadgePosition.topRight,
                                    ),
                                  ),
                                  Ux4gJourneyStep(
                                    state: Ux4gJourneyStepState.current,
                                    date: '02 Sep 2026',
                                    title: 'Submission Failed',
                                    status: Ux4gJourneyStepStatus(
                                      text: '',
                                      badgeText: 'Failed',
                                      badgeColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF7F1D1D) : const Color(0xFFFEE2E2),
                                      badgeTextColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFFF87171) : const Color(0xFFDC2626),
                                      badgePosition: Ux4gJourneyBadgePosition.topRight,
                                    ),
                                  ),
                                  const Ux4gJourneyStep(
                                    state: Ux4gJourneyStepState.upcoming,
                                    date: 'Pending',
                                    title: 'Document Verification',
                                    tag: 'Blocked',
                                  ),
                                  const Ux4gJourneyStep(
                                    state: Ux4gJourneyStepState.upcoming,
                                    date: 'Pending',
                                    title: 'Certificate Issued',
                                    tag: 'Blocked',
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                      Ux4gButton(text: 'Retry submission', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                      const SizedBox(height: 12),
                      Ux4gButton(text: 'Save draft', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: primaryColor, borderColor: primaryColor),
                      const SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text('Contact support', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                        ),
                      ),
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
                      const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                      const SizedBox(width: 8),
                      Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                    ],
                  ),
                ),
              ],
            ),

            // Error toast notification
            Positioned(
              left: 16,
              right: 16,
              top: 24,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 16, offset: const Offset(0, -4)),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red500 : Ux4gColors.red600, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Could not submit', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                          const SizedBox(height: 4),
                          Text('Network or server issue', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.close, size: 18, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
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

const _couldNotSubmitCardCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CouldNotSubmitCardScreen extends StatelessWidget {
  const CouldNotSubmitCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    
    
    
    

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header with white background
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Ux4gAppHeader(
                        variant: Ux4gAppHeaderVariant.light,
                        leadingWidgets: [
                          SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40, colorFilter: Theme.of(context).brightness == Brightness.dark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                          Container(height: 32, width: 1, color: const Color(0xFFD1D5DB)),
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
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                    ],
                  ),
                ),

                // White card with content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
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
                                Icon(
                                  Icons.arrow_back,
                                  size: 18,
                                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Return to services',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          
                          // Error icon
                          Center(
                            child: Container(
                              width: 56, height: 56,
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red900 : Ux4gColors.red50),
                              child: const Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red500 : Ux4gColors.red600, size: 30),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Title
                          Center(
                            child: Text('Could Not Submit\nApplication', textAlign: TextAlign.center, style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Text('We could not submit your application due to\na network or server error. Your data is saved —\ntry again.', textAlign: TextAlign.center, style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                          ),
                          const SizedBox(height: 32),

                          // Journey Timeline
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
                                  'Submission failed due to a network error. Your data is saved — retry when ready',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Ux4gColors.neutral400
                                        : Ux4gColors.neutral600,
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
                                      title: 'Draft Saved',
                                      status: Ux4gJourneyStepStatus(
                                        text: '',
                                        badgeText: 'Saved',
                                        badgeColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green900 : const Color(0xFFDCFCE7),
                                        badgeTextColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.green400 : const Color(0xFF15803D),
                                        badgePosition: Ux4gJourneyBadgePosition.topRight,
                                      ),
                                    ),
                                    Ux4gJourneyStep(
                                      state: Ux4gJourneyStepState.current,
                                      date: '02 Sep 2026',
                                      title: 'Submission Failed',
                                      status: Ux4gJourneyStepStatus(
                                        text: '',
                                        badgeText: 'Failed',
                                        badgeColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF7F1D1D) : const Color(0xFFFEE2E2),
                                        badgeTextColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFFF87171) : const Color(0xFFDC2626),
                                        badgePosition: Ux4gJourneyBadgePosition.topRight,
                                      ),
                                    ),
                                    const Ux4gJourneyStep(
                                      state: Ux4gJourneyStepState.upcoming,
                                      date: 'Pending',
                                      title: 'Document Verification',
                                      tag: 'Blocked',
                                    ),
                                    const Ux4gJourneyStep(
                                      state: Ux4gJourneyStepState.upcoming,
                                      date: 'Pending',
                                      title: 'Certificate Issued',
                                      tag: 'Blocked',
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                      Ux4gButton(text: 'Retry submission', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity),
                      const SizedBox(height: 12),
                      Ux4gButton(text: 'Save draft', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, contentColor: primaryColor, borderColor: primaryColor),
                      const SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text('Contact support', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                        ),
                      ),
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
                      const Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                      const SizedBox(width: 8),
                      Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                    ],
                  ),
                ),
              ],
            ),

            // Error toast notification
            Positioned(
              left: 16,
              right: 16,
              top: 24,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 16, offset: const Offset(0, -4)),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.error, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.red500 : Ux4gColors.red600, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Could not submit', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900)),
                          const SizedBox(height: 4),
                          Text('Network or server issue', style: TextStyle(fontSize: 13, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.close, size: 18, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral200 : Ux4gColors.neutral700),
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
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _CouldNotSubmitMockup extends StatefulWidget {
  const _CouldNotSubmitMockup();

  @override
  State<_CouldNotSubmitMockup> createState() => _CouldNotSubmitMockupState();
}

class _CouldNotSubmitMockupState extends State<_CouldNotSubmitMockup> {
  bool _showToast = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? Ux4gColors.neutral900
          : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Ux4gAppHeader(
                        variant: Ux4gAppHeaderVariant.light,
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
                            errorBuilder: (c, e, s) => const Icon(
                              Icons.account_balance,
                              size: 32,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 32,
                            width: 1,
                            color: const Color(0xFFD1D5DB),
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
                            errorBuilder: (c, e, s) => const Icon(
                              Icons.blur_on,
                              size: 32,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                        actions: [
                          Ux4gAppHeaderAction(
                            customWidget: Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.menu,
                                  color: isDark ? Ux4gColors.primary400 : Ux4gColors.primary600,
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
                      const Divider(height: 1, color: Color(0xFFE5E7EB)),
                    ],
                  ),
                ),

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
                        GestureDetector(
                          onTap: () {},
                          child: Row(
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
                              const SizedBox(width: 6),
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
                        ),
                        const SizedBox(height: 32),

                        // Error icon
                        Center(child: _ErrorIcon()),
                        const SizedBox(height: 20),

                        // Title
                        Center(
                          child: Text(
                            'Could Not Submit\nApplication',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            'We could not submit your application due to\na network or server error. Your data is saved —\ntry again.',
                            textAlign: TextAlign.center,
                            style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // What happens next - Journey Timeline
                        const _ApplicationProgressTimeline(),
                      ],
                    ),
                  ),
                ),

                // Actions
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Ux4gButton(
                        text: 'Retry submission',
                        onPressed: () => setState(() => _showToast = true),
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        height: 48,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        contentColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.neutral900
                            : Ux4gColors.neutral50,
                      ),
                      const SizedBox(height: 12),
                      Ux4gButton(
                        text: 'Save draft',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        width: double.infinity,
                        height: 48,
                        contentColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.primary300
                            : Ux4gColors.primary600,
                        borderColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Ux4gColors.primary600
                            : Ux4gColors.primary300,
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Contact support',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.neutral50
                                  : Ux4gColors.neutral900,
                            ),
                          ),
                        ),
                      ),
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
                      const Text(
                        'Powered by -',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        _digitalIndiaLogoPath,
                        height: 22,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : null,
                        errorBuilder: (c, e, s) => const Text(
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

            // Error toast
            if (_showToast)
              Positioned(
                left: 16,
                right: 16,
                top: 24,
                child: _ErrorToastCard(
                  onClose: () => setState(() => _showToast = false),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CouldNotSubmitCardMockup extends StatefulWidget {
  const _CouldNotSubmitCardMockup();

  @override
  State<_CouldNotSubmitCardMockup> createState() =>
      _CouldNotSubmitCardMockupState();
}

class _CouldNotSubmitCardMockupState extends State<_CouldNotSubmitCardMockup> {
  bool _showToast = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark
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
        backgroundColor: isDark
            ? Ux4gColors.primary900
            : Ux4gColors.primary50,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header with white background
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Ux4gAppHeader(
                          variant: Ux4gAppHeaderVariant.light,
                          title: '',
                          leadingWidgets: [
                            SvgPicture.asset(
                              _nationalEmblemLogoPath,
                              height: 40,
                              colorFilter:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    )
                                  : null,
                              errorBuilder: (c, e, s) => const Icon(
                                Icons.account_balance,
                                size: 32,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              height: 32,
                              width: 1,
                              color: const Color(0xFFD1D5DB),
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
                              errorBuilder: (c, e, s) => const Icon(
                                Icons.blur_on,
                                size: 32,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                          actions: [
                            Ux4gAppHeaderAction(
                              customWidget: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isDark ? Ux4gColors.neutral800 : const Color(0xFFE5E7EB),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.menu,
                                    color: isDark ? Ux4gColors.primary400 : Ux4gColors.primary600,
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
                        const Divider(height: 1, color: Color(0xFFE5E7EB)),
                      ],
                    ),
                  ),

                  // White card with content
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
                              : Colors.white,
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
                            GestureDetector(
                              onTap: () {},
                              child: Row(
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
                                  const SizedBox(width: 6),
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
                            ),
                            const SizedBox(height: 32),

                            // Error icon
                            Center(child: _ErrorIcon()),
                            const SizedBox(height: 20),

                            // Title
                            Center(
                              child: Text(
                                'Could Not Submit\nApplication',
                                textAlign: TextAlign.center,
                                style: (Theme.of(context).extension<Ux4gTypography>()?.hL_strong ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.w800)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: Text(
                                'We could not submit your application due to\na network or server error. Your data is saved —\ntry again.',
                                textAlign: TextAlign.center,
                                style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle(fontSize: 14)).copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                              ),
                            ),
                            const SizedBox(height: 32),

                            // What happens next - Journey Timeline
                            const _ApplicationProgressTimeline(),
                            const SizedBox(height: 24),
                            Ux4gButton(
                              text: 'Retry submission',
                              onPressed: () => setState(() => _showToast = true),
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                              height: 48,
                              backgroundColor:
                                  Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                              contentColor:
                                  Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.neutral900
                                  : Ux4gColors.neutral50,
                            ),
                            const SizedBox(height: 12),
                            Ux4gButton(
                              text: 'Save draft',
                              onPressed: () {},
                              variant: Ux4gButtonVariant.outline,
                              size: Ux4gButtonSize.large,
                              width: double.infinity,
                              height: 48,
                              contentColor:
                                  Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                              borderColor:
                                  Theme.of(context).brightness == Brightness.dark
                                  ? Ux4gColors.primary600
                                  : Ux4gColors.primary300,
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Contact support',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gColors.neutral50
                                        : Ux4gColors.neutral900,
                                  ),
                                ),
                              ),
                            ),
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
                        const Text(
                          'Powered by -',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          _digitalIndiaLogoPath,
                          height: 22,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : null,
                          errorBuilder: (c, e, s) => const Text(
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

              // Error toast
              if (_showToast)
                Positioned(
                  left: 16,
                  right: 16,
                  top: 24,
                  child: _ErrorToastCard(
                    onClose: () => setState(() => _showToast = false),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
