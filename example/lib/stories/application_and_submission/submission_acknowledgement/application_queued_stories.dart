import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;
const String _digitalIndiaLogoPath = Ux4gIcons.digitalIndiaLogoPng;

final applicationQueuedComponent = WidgetbookComponent(
  name: 'Application Queued',
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
            ? _applicationQueuedCardCode
            : _applicationQueuedDefaultCode;
        final child = variant == 'Card style'
            ? _ApplicationQueuedCardMockup()
            : _ApplicationQueuedMockup();

        return ComponentDocs(
          mobileMockup: true,
          name: 'Application Queued',
          description:
              'A pattern shown when the application is queued for submission due to connectivity issues, '
              'with a toast notification and options to retry or save draft.',
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

class _QueuedIcon extends StatelessWidget {
  const _QueuedIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.primary800
            : Ux4gColors.primary100,
      ),
      child: Icon(
        Icons.hourglass_bottom,
        color: (Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.primary300
            : Ux4gColors.primary600),
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
                'Your application is queued and will be submitted once you\'re back online',
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
                    title: 'Application Saved Locally',
                    status: Ux4gJourneyStepStatus(
                      text: '',
                      badgeText: 'Saved',
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

class _ToastCard extends StatelessWidget {
  final VoidCallback? onClose;
  const _ToastCard({this.onClose});

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
          Icon(Icons.warning_amber_rounded, color: Color(0xFFF59E0B), size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Application queued',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral50
                        : Ux4gColors.neutral900),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Will submit when connection is restored.',
                  style: TextStyle(
                    fontSize: 13,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral400
                        : Ux4gColors.neutral500),
                  ),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: onClose,
                  child: Text(
                    'Understood',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Ux4gColors.primary300
                          : Ux4gColors.primary600),
                    ),
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
              color: (Theme.of(context).brightness == Brightness.dark
                  ? Ux4gColors.neutral400
                  : Ux4gColors.neutral500),
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

const _applicationQueuedDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationQueuedScreen extends StatelessWidget {
  const ApplicationQueuedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600;
    final titleColor = Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
    final subtleText = Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                              Icon(Icons.arrow_back, size: 18, color: primaryColor),
                              SizedBox(width: 6),
                              Text('Return to services', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor)),
                            ],
                          ),
                        ),
                        SizedBox(height: 32),

                        // Queued icon
                        Center(
                          child: Container(
                            width: 56, height: 56,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary800 : Ux4gColors.primary100),
                            child: Icon(Icons.hourglass_bottom, color: primaryColor, size: 30),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Title
                        Center(
                          child: Text(
                            'Application Queued',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: titleColor, height: 1.2),
                          ),
                        ),
                        SizedBox(height: 12),
                        Center(
                          child: Text(
                            'We\'ll submit your application automatically\nwhen your connection is restored. Your data is\nsaved.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: subtleText, height: 1.4),
                          ),
                        ),
                        SizedBox(height: 32),

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
                                'Your application is queued and will be submitted once you\'re back online',
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
                                    title: 'Application Saved Locally',
                                    status: Ux4gJourneyStepStatus(
                                      text: '',
                                      badgeText: 'Saved',
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
                      ],
                    ),
                  ),
                ),

                // Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      Ux4gButton(text: 'Try submitting now', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48, backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50),
                      SizedBox(height: 12),
                      Ux4gButton(text: 'Save draft and exit', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, height: 48, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300),
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
                      Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                      SizedBox(width: 8),
                      Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                    ],
                  ),
                ),
              ],
            ),

            // Toast notification from bottom
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Color(0xFFF59E0B), size: 20),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Application queued', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: titleColor)),
                              SizedBox(height: 4),
                              Text('Will submit when connection is restored.', style: TextStyle(fontSize: 13, color: subtleText)),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {},
                                child: Text('Understood', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primaryColor)),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.close, size: 18, color: subtleText),
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
""";

const _applicationQueuedCardCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationQueuedCardScreen extends StatelessWidget {
  const ApplicationQueuedCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600;
    final titleColor = Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
    final subtleText = Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral400 : Ux4gColors.neutral500;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary900 : Ux4gColors.primary50,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header with white background
                Container(
                  color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Colors.white,
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
                                Icon(Icons.arrow_back, size: 18, color: primaryColor),
                                SizedBox(width: 6),
                                Text('Return to services', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: primaryColor)),
                              ],
                            ),
                          ),
                          SizedBox(height: 32),

                          // Queued icon
                          Center(
                            child: Container(
                              width: 56, height: 56,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary800 : Ux4gColors.primary100),
                              child: Icon(Icons.hourglass_bottom, color: primaryColor, size: 30),
                            ),
                          ),
                          SizedBox(height: 20),

                          // Title
                          Center(
                            child: Text('Application Queued', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: titleColor, height: 1.2)),
                          ),
                          SizedBox(height: 12),
                          Center(
                            child: Text('We\'ll submit your application automatically\nwhen your connection is restored. Your data is\nsaved.', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: subtleText, height: 1.4)),
                          ),
                          SizedBox(height: 32),

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
                                  'Your application is queued and will be submitted once you\'re back online',
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
                                      title: 'Application Saved Locally',
                                      status: Ux4gJourneyStepStatus(
                                        text: '',
                                        badgeText: 'Saved',
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
                      Ux4gButton(text: 'Try submitting now', onPressed: () {}, size: Ux4gButtonSize.large, width: double.infinity, height: 48, backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.neutral900 : Ux4gColors.neutral50),
                      SizedBox(height: 12),
                      Ux4gButton(text: 'Save draft and exit', onPressed: () {}, variant: Ux4gButtonVariant.outline, size: Ux4gButtonSize.large, width: double.infinity, height: 48, contentColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary300 : Ux4gColors.primary600, borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gColors.primary600 : Ux4gColors.primary300),
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
                      Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
                      SizedBox(width: 8),
                      Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 22, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null),
                    ],
                  ),
                ),
              ],
            ),

            // Toast notification from bottom
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Color(0xFFF59E0B), size: 20),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Application queued', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: titleColor)),
                              SizedBox(height: 4),
                              Text('Will submit when connection is restored.', style: TextStyle(fontSize: 13, color: subtleText)),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () {},
                                child: Text('Understood', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: primaryColor)),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.close, size: 18, color: subtleText),
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
""";

// ───────────────────────────────────────────────────────────────────────
// Mockups
// ───────────────────────────────────────────────────────────────────────

class _ApplicationQueuedMockup extends StatefulWidget {
  const _ApplicationQueuedMockup();

  @override
  State<_ApplicationQueuedMockup> createState() =>
      _ApplicationQueuedMockupState();
}

class _ApplicationQueuedMockupState extends State<_ApplicationQueuedMockup> {
  bool _showToast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Ux4gColors.neutral900
          : Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                              color:
                                  (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Return to services',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color:
                                    (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Ux4gColors.primary300
                                    : Ux4gColors.primary600),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32),

                        // Queued icon
                        Center(child: _QueuedIcon()),
                        SizedBox(height: 20),

                        // Title
                        Center(
                          child: Text(
                            'Application Queued',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color:
                                  (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.neutral50
                                  : Ux4gColors.neutral900),
                              height: 1.2,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Center(
                          child: Text(
                            'We\'ll submit your application automatically\nwhen your connection is restored. Your data is\nsaved.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Ux4gColors.neutral400
                                  : Ux4gColors.neutral500),
                              height: 1.4,
                            ),
                          ),
                        ),
                        SizedBox(height: 32),

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
                        text: 'Try submitting now',
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
                      SizedBox(height: 12),
                      Ux4gButton(
                        text: 'Save draft and exit',
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
                      Text(
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

            // Toast from bottom on button tap
            if (_showToast)
              Positioned(
                left: 16,
                right: 16,
                top: 24,
                child: _ToastCard(
                  onClose: () => setState(() => _showToast = false),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ApplicationQueuedCardMockup extends StatefulWidget {
  const _ApplicationQueuedCardMockup();

  @override
  State<_ApplicationQueuedCardMockup> createState() =>
      _ApplicationQueuedCardMockupState();
}

class _ApplicationQueuedCardMockupState
    extends State<_ApplicationQueuedCardMockup> {
  bool _showToast = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.primary900
            : Ux4gColors.primary50),
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
        backgroundColor: (Theme.of(context).brightness == Brightness.dark
            ? Ux4gColors.primary900
            : Ux4gColors.primary50),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header with white background
                  Container(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Ux4gColors.neutral900
                        : Colors.white,
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
                              errorBuilder: (c, e, s) => Icon(
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
                              errorBuilder: (c, e, s) => Icon(
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
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  size: 18,
                                  color:
                                      (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gColors.primary300
                                      : Ux4gColors.primary600),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Return to services',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Ux4gColors.primary300
                                        : Ux4gColors.primary600),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 32),

                            // Queued icon
                            Center(child: _QueuedIcon()),
                            SizedBox(height: 20),

                            // Title
                            Center(
                              child: Text(
                                'Application Queued',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color:
                                      (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gColors.neutral50
                                      : Ux4gColors.neutral900),
                                  height: 1.2,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Center(
                              child: Text(
                                'We\'ll submit your application automatically\nwhen your connection is restored. Your data is\nsaved.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Ux4gColors.neutral400
                                      : Ux4gColors.neutral500),
                                  height: 1.4,
                                ),
                              ),
                            ),
                            SizedBox(height: 32),

                            // What happens next - Journey Timeline
                            const _ApplicationProgressTimeline(),
                            const SizedBox(height: 24),
                            Ux4gButton(
                              text: 'Try submitting now',
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
                              text: 'Save draft and exit',
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
                          colorBlendMode: BlendMode.srcIn,
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

              // Toast from bottom on button tap
              if (_showToast)
                Positioned(
                  left: 16,
                  right: 16,
                  top: 24,
                  child: _ToastCard(
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

// ───────────────────────────────────────────────────────────────────────
// Timeline item (local to this file)
// ───────────────────────────────────────────────────────────────────────
