import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

const Color _primaryColor = Ux4gColors.primary600;

final confirmAppointmentV2Component = WidgetbookComponent(
  name: 'Confirm Appointment V2',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Confirm Appointment V2',
          description:
              'Appointment confirmation screen with left-bordered details card, '
              'warning with icon, and confirm/change slot actions.',
          code: _confirmAppointmentV2Code,
          center: true,
          child: const _ConfirmAppointmentV2Mockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _confirmAppointmentV2Code = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class ConfirmAppointmentV2Screen extends StatelessWidget {
  const ConfirmAppointmentV2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.filled,
              title: 'National Services Portal',
              showBackButton: true,
              onBackPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text('Confirm appointment', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text('Review before confirming. Slot not reserved until confirmed.',
                      style: TextStyle(fontSize: 13, color: Color(0xFF4B5563))),
                    const SizedBox(height: 24),
                    // Details card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFF2EFFF),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFA391FF)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _DetailRow(label: 'Date & time', value: 'Thu, 18 Apr 2026 · 11:00 – 11:30 AM'),
                          const SizedBox(height: 16),
                          _DetailRow(label: 'Advocate', value: 'Adv. M. Sharma · Family Law'),
                          const SizedBox(height: 16),
                          _DetailRow(label: 'Office', value: 'Block C, Room 12, District Legal Services Authority, Pune'),
                          const SizedBox(height: 16),
                          _DetailRow(label: 'Consultation type', value: 'In-person · 30 minutes'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Warning with icon
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF3C7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error, size: 18, color: Color(0xFFD97706)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Your slot is held for 5 minutes — please confirm soon to avoid losing it.',
                              style: TextStyle(fontSize: 13, color: Color(0xFFB45309)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Confirm button
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        text: 'Confirm booking',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.primary,
                        size: Ux4gButtonSize.large,
                        backgroundColor: const Color(0xFF4A2BC2),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Choose different slot
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        text: 'Choose different slot',
                        onPressed: () {},
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        contentColor: const Color(0xFF432CBB),
                        borderColor: const Color(0xFFE5E7EB),
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

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF4B5563))),
        const SizedBox(height: 2),
        Text(value, style: TextStyle(fontSize: 14, color: Color(0xFF111827))),
      ],
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _ConfirmAppointmentV2Mockup extends StatelessWidget {
  const _ConfirmAppointmentV2Mockup();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Theme(
      data: Ux4gTheme.themeData(isDark: isDark),
      child: Scaffold(
        backgroundColor: isDark
            ? Ux4gColors.neutral950
            : Ux4gColors.neutral50,
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: _primaryColor,
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    const SizedBox(width: 12),
                    Text(
                      'National Services Portal',
                      style: typography.tS_default.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm appointment',
                        style: typography.hS_strong.copyWith(
                          color: isDark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Review before confirming. Slot not reserved until confirmed.',
                        style: typography.bS_default.copyWith(
                          color: isDark
                              ? Ux4gColors.neutral200
                              : Ux4gColors.neutral700,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Details card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Ux4gColors.primary950
                              : Ux4gColors.primary50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDark
                                ? Ux4gColors.primary600
                                : Ux4gColors.primary300,
                          ),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _DetailItem(
                              label: 'Date & time',
                              value: 'Thu, 18 Apr 2026 · 11:00 – 11:30 AM',
                            ),
                            SizedBox(height: 12),
                            _DetailItem(
                              label: 'Advocate',
                              value: 'Adv. M. Sharma · Family Law',
                            ),
                            SizedBox(height: 12),
                            _DetailItem(
                              label: 'Office',
                              value:
                                  'Block C, Room 12, District Legal Services Authority, Pune',
                            ),
                            SizedBox(height: 12),
                            _DetailItem(
                              label: 'Consultation type',
                              value: 'In-person · 30 minutes',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Warning banner with icon
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Ux4gColors.orange950
                              : Ux4gColors.orange50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isDark
                                ? Ux4gColors.orange700
                                : Ux4gColors.orange300,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error,
                              size: 18,
                              color: isDark
                                  ? Ux4gColors.orange300
                                  : Ux4gColors.orange600,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Your slot is held for 5 minutes — please confirm soon to avoid losing it.',
                                style: typography.bS_default.copyWith(
                                  color: isDark
                                      ? Ux4gColors.orange100
                                      : Ux4gColors.orange700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Confirm button
                      SizedBox(
                        width: double.infinity,
                        child: Ux4gButton(
                          text: 'Confirm booking',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.primary,
                          size: Ux4gButtonSize.large,
                          height: 44,
                          backgroundColor: isDark
                              ? Ux4gColors.primary300
                              : Ux4gColors.primary600,
                          contentColor: isDark
                              ? Ux4gColors.primary950
                              : Colors.white,
                          textStyle: typography.lL_default,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Choose different slot button
                      SizedBox(
                        width: double.infinity,
                        child: Ux4gButton(
                          text: 'Choose different slot',
                          onPressed: () {},
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.large,
                          height: 44,
                          contentColor: isDark
                              ? Ux4gColors.neutral50
                              : Ux4gColors.primary600,
                          borderColor: isDark
                              ? Ux4gColors.neutral600
                              : Ux4gColors.primary300,
                          textStyle: typography.lL_default,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final typography = Ux4gTheme.typography(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: typography.lM_strong.copyWith(
            color: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: typography.tS_default.copyWith(
            color: isDark ? Ux4gColors.neutral50 : Ux4gColors.neutral900,
          ),
        ),
      ],
    );
  }
}
