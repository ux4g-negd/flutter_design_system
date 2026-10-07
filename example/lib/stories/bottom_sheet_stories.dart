import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ─── Bottom Sheet Showcase Widget ───────────────────────────────────────────

class _BottomSheetShowcaseWidget extends StatefulWidget {
  const _BottomSheetShowcaseWidget();

  @override
  State<_BottomSheetShowcaseWidget> createState() =>
      _BottomSheetShowcaseWidgetState();
}

class _BottomSheetShowcaseWidgetState extends State<_BottomSheetShowcaseWidget> {
  String _actionFeedback = 'Click any trigger button to open live bottom sheet';

  void _openSheet(BuildContext context, Ux4gBottomSheetSize size, String title) {
    Ux4gBottomSheet.show(
      context,
      size: size,
      title: title,
      description:
          'A modal bottom sheet is an interactive overlay anchored to the bottom of the screen.',
      icon: Icons.layers_outlined,
      primaryButtonText: 'Confirm & Continue',
      onPrimaryPress: () {
        Navigator.of(context, rootNavigator: true).pop();
        setState(
            () => _actionFeedback = 'Sheet: Primary action confirmed!');
      },
      secondaryButtonText: 'Cancel',
      onSecondaryPress: () {
        Navigator.of(context, rootNavigator: true).pop();
        setState(() => _actionFeedback = 'Sheet: Cancelled');
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Application Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          for (int i = 1; i <= 6; i++) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1E2130)
                    : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline,
                      size: 18, color: Colors.green),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text('Step $i: Document verification completed'),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = const Color(0xFF4F46E5);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 600;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: Container(
              padding: EdgeInsets.all(isCompact ? 16.0 : 24.0),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Feedback banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primary.withValues(alpha: 0.2)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.touch_app_outlined, size: 16, color: primary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _actionFeedback,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    'TEST RESPONSIVE HEIGHT SNAP PRESETS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white54 : Colors.grey[600],
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Height Preset Trigger Cards in responsive Wrap
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildTriggerCard(
                        context: context,
                        title: 'Peek (26% Height)',
                        subtitle: 'Compact bottom drawer',
                        size: Ux4gBottomSheetSize.peek,
                        isDark: isDark,
                        primary: primary,
                        isCompact: isCompact,
                      ),
                      _buildTriggerCard(
                        context: context,
                        title: 'Half (50% Height)',
                        subtitle: 'Standard modal sheet',
                        size: Ux4gBottomSheetSize.half,
                        isDark: isDark,
                        primary: primary,
                        isCompact: isCompact,
                      ),
                      _buildTriggerCard(
                        context: context,
                        title: 'Expanded (75% Height)',
                        subtitle: 'Multi-step action form',
                        size: Ux4gBottomSheetSize.expanded,
                        isDark: isDark,
                        primary: primary,
                        isCompact: isCompact,
                      ),
                      _buildTriggerCard(
                        context: context,
                        title: 'Full (94% Height)',
                        subtitle: 'Full-screen sheet workflow',
                        size: Ux4gBottomSheetSize.full,
                        isDark: isDark,
                        primary: primary,
                        isCompact: isCompact,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTriggerCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Ux4gBottomSheetSize size,
    required bool isDark,
    required Color primary,
    required bool isCompact,
  }) {
    return Container(
      width: isCompact ? double.infinity : 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white60 : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => _openSheet(context, size, title),
              icon: const Icon(Icons.open_in_new, size: 14),
              label: const Text('Open Sheet'),
              style: FilledButton.styleFrom(
                backgroundColor: primary,
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Widgetbook Components ───────────────────────────────────────────────────

final bottomSheetIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Overview & Presets',
      builder: (context) => const ComponentDocs(
        name: 'Bottom Sheet',
        description:
            'Ux4gBottomSheet provides an accessible, draggable bottom modal sheet supporting smooth height transitions and fixed action buttons.',
        showPreview: false,
        child: _BottomSheetShowcaseWidget(),
      ),
    ),
  ],
);

final bottomSheetComponent = WidgetbookComponent(
  name: 'Standard',
  useCases: [
    WidgetbookUseCase(
      name: 'Interactive Trigger',
      builder: (context) {
        return ComponentDocs(
          name: 'Bottom Sheet',
          description:
              'Draggable modal bottom sheet with top pill handle, header description, custom scrollable child, and fixed footer buttons.',
          code: '''// Show UX4G Modal Bottom Sheet
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (ctx) => Ux4gBottomSheet(
    size: Ux4gBottomSheetSize.half,
    title: 'Application Details',
    description: 'Review and confirm your application submission.',
    icon: Icons.assignment_outlined,
    primaryButtonText: 'Submit Application',
    onPrimaryPress: () => Navigator.pop(ctx),
    secondaryButtonText: 'Cancel',
    onSecondaryPress: () => Navigator.pop(ctx),
    onDismiss: () => Navigator.pop(ctx),
    content: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text('Sheet content...'),
    ),
  ),
);''',
          props: const [
            PropRow(
              name: 'size',
              type: 'Ux4gBottomSheetSize',
              defaultValue: 'half',
              description: 'Height preset (peek 26%, half 50%, expanded 75%, full 94%).',
            ),
            PropRow(
              name: 'title',
              type: 'String?',
              defaultValue: 'null',
              description: 'Primary header title text.',
            ),
            PropRow(
              name: 'description',
              type: 'String?',
              defaultValue: 'null',
              description: 'Header description subtitle paragraph.',
            ),
            PropRow(
              name: 'primaryButtonText',
              type: 'String?',
              defaultValue: 'null',
              description: 'Text label for primary CTA button.',
            ),
            PropRow(
              name: 'secondaryButtonText',
              type: 'String?',
              defaultValue: 'null',
              description: 'Text label for secondary cancel/dismiss button.',
            ),
            PropRow(
              name: 'onDismiss',
              type: 'VoidCallback',
              defaultValue: 'required',
              description: 'Callback when sheet is dismissed via backdrop tap or swipe down.',
            ),
          ],
          child: Center(
            child: FilledButton.icon(
              onPressed: () {
                Ux4gBottomSheet.show(
                  context,
                  size: Ux4gBottomSheetSize.half,
                  title: 'Application Verification',
                  description:
                      'Confirm citizen identity details before final submission.',
                  icon: Icons.verified_user_outlined,
                  primaryButtonText: 'Verify Details',
                  onPrimaryPress: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  secondaryButtonText: 'Cancel',
                  onSecondaryPress: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  content: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Please review the submitted citizen documents.'),
                  ),
                );
              },
              icon: const Icon(Icons.layers_outlined),
              label: const Text('Open Bottom Sheet (50% Half)'),
            ),
          ),
        );
      },
    ),
  ],
);
