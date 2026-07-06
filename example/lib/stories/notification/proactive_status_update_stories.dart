import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';
import '../../widgets/component_docs.dart';

class _ProactiveStatusMockup extends StatelessWidget {
  const _ProactiveStatusMockup({required this.stateVariant});
  final String stateVariant; // 'banner', 'live', 'reconnecting', 'refresh'

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primary = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    final bg = isDark ? const Color(0xFF121212) : const Color(0xFFF9FAFB);
    final cardBg = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final borderColor = isDark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200;
    final onSurface = isDark ? Colors.white : const Color(0xFF111827);
    final subtle = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);

    // Badge styling based on stateVariant
    String badgeText = 'Under Review';
    Color customTagBg = isDark ? const Color(0xFF262626) : const Color(0xFFE5E7EB);
    Color customTagText = isDark ? const Color(0xFFD1D5DB) : const Color(0xFF374151);

    if (stateVariant == 'live') {
      badgeText = 'Live';
      customTagBg = isDark ? const Color(0xFF064E3B) : const Color(0xFFDCFCE7);
      customTagText = isDark ? const Color(0xFF6EE7B7) : const Color(0xFF15803D);
    } else if (stateVariant == 'reconnecting') {
      badgeText = 'Reconnecting';
      customTagBg = isDark ? const Color(0xFF78350F) : const Color(0xFFFEF3C7);
      customTagText = isDark ? const Color(0xFFFDE68A) : const Color(0xFFB45309);
    }

    final bool showBottomBanner = stateVariant == 'banner' || stateVariant == 'refresh';

    return Container(
      width: 360,
      height: 760,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              // UX4G App Header
              Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 28, colorFilter: isDark ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                  SizedBox(height: 18, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: borderColor)),
                  SvgPicture.asset(Ux4gIcons.union, height: 28, colorFilter: ColorFilter.mode(primary, BlendMode.srcIn)),
                ],
                actions: [
                  Ux4gAppHeaderAction(
                    customWidget: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: primary),
                      ),
                      child: Icon(Icons.menu, size: 18, color: primary),
                    ),
                  ),
                ],
                horizontalPadding: 16,
              ),
              Ux4gDivider(thickness: 1, color: borderColor),

              // Scrollable Body
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back link
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back, size: 16, color: primary),
                            const SizedBox(width: 6),
                            Text('Back', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: primary)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Card 1: Application Status using Ux4g components
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Income Certificate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: onSurface)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(color: customTagBg, borderRadius: BorderRadius.circular(6)),
                                  child: Text(badgeText, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: customTagText)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text('Application ID · INC-2026-MH-04127', style: TextStyle(fontSize: 12, color: subtle)),
                            const SizedBox(height: 14),
                            const Ux4gLinearProgress(
                              value: 0.38,
                              label: '8 days left',
                              gradientColors: [Color(0xFFF59E0B), Color(0xFFD97706)],
                              shape: Ux4gProgressShape.rounded,
                              height: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Card 2: Journey Timeline using Ux4gJourneyTimeline
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: borderColor),
                        ),
                        child: Ux4gJourneyTimeline(
                          activeColor: primary,
                          indicatorSize: 18,
                          lineWidth: 2,
                          header: const Ux4gJourneyHeader(
                            title: 'Application journey',
                            description: 'Every step from submission to issuance',
                          ),
                          steps: [
                            const Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              date: '07 Apr 2026, 10:24 AM',
                              title: 'Application Submitted',
                            ),
                            const Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.completed,
                              date: '10 Apr 2026, 02:15 PM',
                              title: 'Documents Verified',
                            ),
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.current,
                              date: '11 Apr 2026 (Est)',
                              title: 'Under Review',
                              dateColor: primary,
                              cardColor: isDark ? const Color(0xFF2E1A47) : const Color(0xFFF3F0FF),
                              cardBorderColor: primary,
                            ),
                            Ux4gJourneyStep(
                              state: Ux4gJourneyStepState.upcoming,
                              date: '22 Apr 2026 (Est)',
                              title: 'Decision',
                              status: Ux4gJourneyStepStatus(
                                text: '2 days remaining',
                                dotColor: isDark ? const Color(0xFFFDE68A) : const Color(0xFFD97706),
                                badgeText: 'Pending',
                                badgeColor: isDark ? const Color(0xFF3B0A0A) : const Color(0xFFFEF2F2),
                                badgeTextColor: isDark ? const Color(0xFFF87171) : const Color(0xFFDC2626),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Footer
                      Center(
                        child: Column(
                          children: [
                            Text('Powered by -', style: TextStyle(fontSize: 10, color: subtle)),
                            const SizedBox(height: 4),
                            Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 18, color: isDark ? Colors.white : null),
                          ],
                        ),
                      ),
                      SizedBox(height: showBottomBanner ? 80 : 16),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Floating Bottom Toast Banner
          if (showBottomBanner)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Ux4gToast(
                      category: Ux4gToastCategory.info,
                      icon: Icons.info,
                      iconColor: const Color(0xFF06B6D4),
                      title: stateVariant == 'banner' ? 'Application Under Review' : 'Check Status',
                      subtitle: stateVariant == 'banner'
                          ? 'Your application moved to Under Review. This banner auto-dismisses in 5 seconds.'
                          : 'Tap refresh to see the latest status. Your view will not change automatically.',
                      showCloseButton: false,
                      backgroundColor: cardBg,
                      layout: Ux4gToastLayout.stacked,
                    ),
                    Positioned(
                      top: 14,
                      right: 14,
                      child: Text('12:30PM', style: TextStyle(fontSize: 11, color: subtle)),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Master Source Code Snippet Generator
String _getProactiveStatusCode(String variant) {
  final badgeString = variant == 'live' ? 'Live' : (variant == 'reconnecting' ? 'Reconnecting' : 'Under Review');
  final toastString = variant == 'banner'
      ? 'Your application moved to Under Review. This banner auto-dismisses in 5 seconds.'
      : 'Tap refresh to see the latest status. Your view will not change automatically.';
  final toastTitle = variant == 'banner' ? 'Application Under Review' : 'Check Status';

  return '''// Complete Proactive Status Update Flow – Government Digital Experience
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class ProactiveStatusTrackerScreen extends StatelessWidget {
  const ProactiveStatusTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;
    final cardBg = isDark ? Ux4gPalette.neutral900 : Colors.white;
    final borderColor = isDark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200;

    return Scaffold(
      backgroundColor: isDark ? Ux4gPalette.neutral950 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // 1. Government App Header
                Ux4gAppHeader(
                  variant: Ux4gAppHeaderVariant.light,
                  title: '',
                  leadingWidgets: [
                    SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 28),
                    SizedBox(height: 18, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical)),
                    SvgPicture.asset(Ux4gIcons.union, height: 28),
                  ],
                  actions: [
                    Ux4gAppHeaderAction(
                      customWidget: Container(
                        width: 32, height: 32,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: primary)),
                        child: Icon(Icons.menu, size: 18, color: primary),
                      ),
                    )
                  ],
                  horizontalPadding: 16,
                ),
                Ux4gDivider(thickness: 1),

                // 2. Scrollable Application Tracker
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back Link
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.arrow_back, size: 16, color: primary),
                              const SizedBox(width: 6),
                              Text('Back', style: TextStyle(color: primary, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Application Status Card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Income Certificate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Ux4gTag(
                                    text: '$badgeString',
                                    style: Ux4gTagStyle.tonal,
                                    size: Ux4gTagSize.s,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text('Application ID · INC-2026-MH-04127', style: TextStyle(color: Colors.grey)),
                              const SizedBox(height: 14),
                              const Ux4gLinearProgress(
                                value: 0.38,
                                label: '8 days left',
                                gradientColors: [Color(0xFFF59E0B), Color(0xFFD97706)],
                                shape: Ux4gProgressShape.rounded,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Journey Timeline Card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor),
                          ),
                          child: Ux4gJourneyTimeline(
                            activeColor: primary,
                            header: const Ux4gJourneyHeader(
                              title: 'Application journey',
                              description: 'Every step from submission to issuance',
                            ),
                            steps: [
                              const Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.completed,
                                date: '07 Apr 2026, 10:24 AM',
                                title: 'Application Submitted',
                              ),
                              const Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.completed,
                                date: '10 Apr 2026, 02:15 PM',
                                title: 'Documents Verified',
                              ),
                              Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.current,
                                date: '11 Apr 2026 (Est)',
                                title: 'Under Review',
                                dateColor: primary,
                                cardColor: isDark ? const Color(0xFF2E1A47) : const Color(0xFFF3F0FF),
                                cardBorderColor: primary,
                              ),
                              Ux4gJourneyStep(
                                state: Ux4gJourneyStepState.upcoming,
                                date: '22 Apr 2026 (Est)',
                                title: 'Decision',
                                status: Ux4gJourneyStepStatus(
                                  text: '2 days remaining',
                                  dotColor: Colors.amber,
                                  badgeText: 'Pending',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Footer
                        Center(
                          child: Column(
                            children: [
                              Text('Powered by -', style: TextStyle(fontSize: 10, color: Colors.grey)),
                              const SizedBox(height: 4),
                              Image.asset(Ux4gIcons.digitalIndiaLogoPng, height: 18),
                            ],
                          ),
                        ),
                        ${variant == 'banner' || variant == 'refresh' ? 'const SizedBox(height: 80),' : 'const SizedBox(height: 16),'}
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // 3. Floating Bottom Alert Banner (Ux4gToast)
            ${variant == 'banner' || variant == 'refresh' ? '''Positioned(
              left: 16, right: 16, bottom: 16,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16, offset: Offset(0, 4))],
                ),
                child: Stack(
                  children: [
                    Ux4gToast(
                      category: Ux4gToastCategory.info,
                      icon: Icons.info,
                      iconColor: const Color(0xFF06B6D4),
                      title: '$toastTitle',
                      subtitle: '$toastString',
                      showCloseButton: false,
                      backgroundColor: cardBg,
                      layout: Ux4gToastLayout.stacked,
                    ),
                    Positioned(
                      top: 14, right: 14,
                      child: Text('12:30PM', style: TextStyle(color: Colors.grey, fontSize: 11)),
                    ),
                  ],
                ),
              ),
            )''' : 'const SizedBox.shrink()'},
          ],
        ),
      ),
    );
  }
}
''';
}

final proactiveStatusBannerComponent = WidgetbookComponent(
  name: 'Auto-dismiss Banner',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        mobileMockup: true,
        name: 'Auto-dismiss Banner',
        description:
            'Demonstrates an auto-dismissing toast banner alerting the citizen when their application transitions to Under Review.',
        code: _getProactiveStatusCode('banner'),
        center: true,
        child: const _ProactiveStatusMockup(stateVariant: 'banner'),
      ),
    ),
  ],
);

final proactiveStatusLiveComponent = WidgetbookComponent(
  name: 'Live Status',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        mobileMockup: true,
        name: 'Live Status',
        description:
            'Demonstrates the application card view connected to a real-time live status feed (Live green badge).',
        code: _getProactiveStatusCode('live'),
        center: true,
        child: const _ProactiveStatusMockup(stateVariant: 'live'),
      ),
    ),
  ],
);

final proactiveStatusReconnectingComponent = WidgetbookComponent(
  name: 'Reconnecting State',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        mobileMockup: true,
        name: 'Reconnecting State',
        description:
            'Demonstrates the application card view when real-time connection drops (Reconnecting amber badge).',
        code: _getProactiveStatusCode('reconnecting'),
        center: true,
        child: const _ProactiveStatusMockup(stateVariant: 'reconnecting'),
      ),
    ),
  ],
);

final proactiveStatusManualRefreshComponent = WidgetbookComponent(
  name: 'Manual Refresh Prompt',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        mobileMockup: true,
        name: 'Manual Refresh Prompt',
        description:
            'Demonstrates a persistent bottom banner prompting the citizen to manually tap refresh when real-time feed is disabled.',
        code: _getProactiveStatusCode('refresh'),
        center: true,
        child: const _ProactiveStatusMockup(stateVariant: 'refresh'),
      ),
    ),
  ],
);
