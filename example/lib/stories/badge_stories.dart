import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

final badgeComponent = WidgetbookComponent(
  name: 'Badge',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return ComponentDocs(
          name: 'Badge',
          description:
              'Badge displays concise contextual information such as counts, statuses or notifications. It is commonly attached to other interface elements to draw attention without interrupting the user experience.',
          showPreview: false,
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visual Showcase',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Explore the core styles and animation variants available in the design system.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDark ? Colors.white60 : Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 32),
                // ── Dot Badges ──
                _buildBadgeSection(
                  title: 'Dot Badges',
                  isDark: isDark,
                  items: [
                    _buildBadgeItem(
                      badge: const Ux4gBadge.dot(
                        containerColor: Color(0xFF6366F1),
                      ),
                      label: 'Primary',
                      isDark: isDark,
                    ),
                    _buildBadgeItem(
                      badge: const Ux4gBadge.dot(
                        containerColor: Color(0xFF10B981),
                      ),
                      label: 'Success',
                      isDark: isDark,
                    ),
                    _buildBadgeItem(
                      badge: const Ux4gBadge.dot(
                        containerColor: Color(0xFFEF4444),
                      ),
                      label: 'Danger',
                      isDark: isDark,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // ── Icon Badges ──
                _buildBadgeSection(
                  title: 'Icon Badges',
                  isDark: isDark,
                  items: [
                    _buildBadgeItem(
                      badge: const Ux4gBadge.icon(
                        Icons.check,
                        containerColor: Color(0xFF6366F1),
                      ),
                      label: 'Check',
                      isDark: isDark,
                    ),
                    _buildBadgeItem(
                      badge: const Ux4gBadge.icon(
                        Icons.warning_amber_rounded,
                        containerColor: Color(0xFFF59E0B),
                      ),
                      label: 'Warning',
                      isDark: isDark,
                    ),
                    _buildBadgeItem(
                      badge: const Ux4gBadge.icon(
                        Icons.close,
                        containerColor: Color(0xFFEF4444),
                      ),
                      label: 'Error',
                      isDark: isDark,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // ── Digit Badges ──
                _buildBadgeSection(
                  title: 'Digit Badges',
                  isDark: isDark,
                  items: [
                    _buildBadgeItem(
                      badge: const Ux4gBadge.count(
                        1,
                        containerColor: Color(0xFF6366F1),
                      ),
                      label: 'Single',
                      isDark: isDark,
                    ),
                    _buildBadgeItem(
                      badge: const Ux4gBadge.count(
                        11,
                        containerColor: Color(0xFF06B6D4),
                      ),
                      label: 'Double',
                      isDark: isDark,
                    ),
                    _buildBadgeItem(
                      badge: const Ux4gBadge.count(
                        150,
                        limit: Ux4gBadgeLimit.doubleDigit,
                        containerColor: Color(0xFFEF4444),
                      ),
                      label: 'Overflow',
                      isDark: isDark,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Dot',
      builder: (context) => ComponentDocs(
        name: 'Badge',
        description:
            'Badge displays concise contextual information such as counts, statuses or notifications. It is commonly attached to other interface elements to draw attention without interrupting the user experience.',
        code: '''// Dot badge – simple presence indicator
Ux4gBadge.dot(
  child: Icon(Icons.notifications, size: 32),
);

// Count badge
Ux4gBadge.count(5, child: Icon(Icons.mail, size: 32));

// Label badge
Ux4gBadge.label('NEW', child: Icon(Icons.star, size: 32));

// Icon badge
Ux4gBadge.icon(Icons.check, child: Icon(Icons.person, size: 32));''',
        props: const [
          PropRow(
            name: 'child',
            type: 'Widget?',
            description: 'Widget the badge is anchored to.',
          ),
          PropRow(
            name: 'containerColor',
            type: 'Color?',
            description: 'Background color of the badge.',
          ),
          PropRow(
            name: 'contentColor',
            type: 'Color?',
            description: 'Color of the badge content (text/icon).',
          ),
          PropRow(
            name: 'alignment',
            type: 'AlignmentGeometry',
            description: 'Position of the badge relative to child.',
            defaultValue: 'Alignment.topRight',
          ),
          PropRow(
            name: 'showBorder',
            type: 'bool',
            description: 'Whether to show an outer border stroke.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'borderColor',
            type: 'Color?',
            description:
                'Color of the outer border. Defaults to surface color.',
          ),
          PropRow(
            name: 'count (factory)',
            type: 'int',
            description: 'Number shown on count badge.',
            required: true,
          ),
          PropRow(
            name: 'limit',
            type: 'Ux4gBadgeLimit',
            description: 'Limit for count display (9+ or 99+).',
            defaultValue: 'singleDigit',
          ),
          PropRow(
            name: 'label (factory)',
            type: 'String',
            description: 'Text shown on label badge.',
            required: true,
          ),
          PropRow(
            name: 'icon (factory)',
            type: 'IconData',
            description: 'Icon shown on icon badge.',
            required: true,
          ),
          PropRow(
            name: 'assetPath (factory)',
            type: 'String',
            description: 'Asset path for readyToUse badge.',
            required: true,
          ),
        ],
        child: Ux4gBadge.dot(child: const Icon(Icons.notifications, size: 32)),
      ),
    ),
    WidgetbookUseCase(
      name: 'Count',
      builder: (context) => ComponentDocs(
        name: 'Badge — Count',
        description:
            'Shows a numeric count. Use the limit param to cap at 9 or 99.',
        code: '''Ux4gBadge.count(
  5,
  limit: Ux4gBadgeLimit.singleDigit,   // shows "9+" when > 9
  child: Icon(Icons.mail, size: 32),
);''',
        child: Ux4gBadge.count(
          context.knobs.int.input(label: 'Count', initialValue: 5),
          limit: context.knobs.list(
            label: 'Limit',
            options: Ux4gBadgeLimit.values,
            initialOption: Ux4gBadgeLimit.singleDigit,
            labelBuilder: (v) => v.name,
          ),
          child: const Icon(Icons.mail, size: 32),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Label',
      builder: (context) => ComponentDocs(
        name: 'Badge — Label',
        description: 'Displays a short text string as a badge.',
        code: '''Ux4gBadge.label('NEW', child: Icon(Icons.star, size: 32));''',
        child: Ux4gBadge.label(
          context.knobs.string(label: 'Label', initialValue: 'NEW'),
          child: const Icon(Icons.star, size: 32),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Standalone variants',
      builder: (context) => ComponentDocs(
        name: 'Badge — Standalone',
        description:
            'Badges can be used without a child widget as standalone indicators.',
        code: '''Row(
  children: [
    Ux4gBadge.dot(),
    Ux4gBadge.count(7),
    Ux4gBadge.count(99),
    Ux4gBadge.count(150, limit: Ux4gBadgeLimit.doubleDigit),
    Ux4gBadge.label('BETA'),
    Ux4gBadge.label('NEW'),
    Ux4gBadge.icon(Icons.check),
    Ux4gBadge.readyToUse(Ux4gIcons.verification),
    Ux4gBadge.readyToUse(Ux4gIcons.star),
  ],
);''',
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            Ux4gBadge.dot(),
            Ux4gBadge.count(7),
            Ux4gBadge.count(99),
            Ux4gBadge.count(150, limit: Ux4gBadgeLimit.doubleDigit),
            Ux4gBadge.label('BETA'),
            Ux4gBadge.label('NEW'),
            Ux4gBadge.icon(Icons.check),
            Ux4gBadge.readyToUse(Ux4gIcons.verification),
            Ux4gBadge.readyToUse(Ux4gIcons.star),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Semantic Colors & Border',
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final semanticColors = isDark
            ? [
                Ux4gColors.primary300,
                Ux4gColors.green500,
                Ux4gColors.orange500,
                Ux4gColors.red300,
                Ux4gColors.neutral600,
                Ux4gColors.cyan500,
              ]
            : [
                Ux4gColors.primary600,
                Ux4gColors.green600,
                Ux4gColors.orange600,
                Ux4gColors.red600,
                Ux4gColors.neutral300,
                Ux4gColors.cyan600,
              ];

        return ComponentDocs(
          name: 'Badge — Semantic Colors & Border',
          description:
              'Showcasing the border stroke property across semantic colors.',
          code:
              '''// Enable showBorder: true to add a surface-colored outer stroke
final isDark = Theme.of(context).brightness == Brightness.dark;
final successColor = isDark ? Ux4gColors.green500 : Ux4gColors.green600;
final primaryColor = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;

Ux4gBadge.dot(showBorder: true, containerColor: successColor);
Ux4gBadge.icon(Icons.check, showBorder: true, containerColor: successColor);
Ux4gBadge.count(3, showBorder: true, containerColor: successColor);
Ux4gBadge.readyToUse(Ux4gIcons.verification, showBorder: true);
Ux4gBadge.readyToUse(Ux4gIcons.star, showBorder: true);
Ux4gBadge.icon(Icons.shield, showBorder: true, containerColor: primaryColor);''',
          child: Container(
            color: Theme.of(context).colorScheme.onSurface.withValues(
              alpha: 0.05,
            ), // slightly grey background to make white borders pop
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: semanticColors
                      .map(
                        (c) =>
                            Ux4gBadge.dot(containerColor: c, showBorder: true),
                      )
                      .toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: semanticColors
                      .map(
                        (c) => Ux4gBadge.icon(
                          Icons.check,
                          containerColor: c,
                          showBorder: true,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: semanticColors
                      .map(
                        (c) => Ux4gBadge.count(
                          3,
                          containerColor: c,
                          showBorder: true,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Ux4gBadge.readyToUse(
                      Ux4gIcons.verification,
                      showBorder: true,
                    ),
                    Ux4gBadge.readyToUse(Ux4gIcons.star, showBorder: true),
                    Ux4gBadge.icon(
                      Icons.shield,
                      containerColor: isDark
                          ? Ux4gColors.primary300
                          : Ux4gColors.primary600,
                      showBorder: true,
                    ),
                    Ux4gBadge.readyToUse(
                      Ux4gIcons.verification,
                      showBorder: true,
                    ),
                    Ux4gBadge.readyToUse(Ux4gIcons.star, showBorder: true),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  ],
);

Widget _buildBadgeSection({
  required String title,
  required List<Widget> items,
  bool isDark = false,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24.0),
    decoration: BoxDecoration(
      color: isDark ? const Color(0xFF1E2130) : Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        color: isDark ? const Color(0xFF2D3348) : Colors.grey.shade200,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: item,
                ),
              )
              .toList(),
        ),
      ],
    ),
  );
}

Widget _buildBadgeItem({
  required Widget badge,
  required String label,
  bool isDark = false,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        height: 24,
        child: Center(child: badge),
      ),
      const SizedBox(height: 12),
      Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: isDark ? Colors.white60 : const Color(0xFF4B5563),
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}
