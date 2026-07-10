import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

final badgeComponent = WidgetbookComponent(
  name: 'Badge',
  useCases: [
    WidgetbookUseCase(
      name: 'Dot',
      builder: (context) => ComponentDocs(
        name: 'Badge',
        description:
            'A small indicator overlaid on another widget. '
            'Use the named constructors: .dot(), .count(), .label(), .icon().',
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
                Ux4gPalette.primary300,
                Ux4gPalette.green500,
                Ux4gPalette.orange500,
                Ux4gPalette.red300,
                Ux4gPalette.neutral600,
                Ux4gPalette.cyan500,
              ]
            : [
                Ux4gPalette.primary600,
                Ux4gPalette.green600,
                Ux4gPalette.orange600,
                Ux4gPalette.red600,
                Ux4gPalette.neutral300,
                Ux4gPalette.cyan600,
              ];

        return ComponentDocs(
          name: 'Badge — Semantic Colors & Border',
          description:
              'Showcasing the border stroke property across semantic colors.',
          code:
              '''// Enable showBorder: true to add a surface-colored outer stroke
final isDark = Theme.of(context).brightness == Brightness.dark;
final successColor = isDark ? Ux4gPalette.green500 : Ux4gPalette.green600;
final primaryColor = isDark ? Ux4gPalette.primary300 : Ux4gPalette.primary600;

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
                          ? Ux4gPalette.primary300
                          : Ux4gPalette.primary600,
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
