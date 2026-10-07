import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ─── Shared Props Documentation ───────────────────────────────────────────────

const _fabProps = [
  PropRow(
    name: 'variant',
    type: 'Ux4gFabVariant',
    defaultValue: 'icon',
    description: 'FAB layout style (icon, labelled, menuJoined, menuSpaced, menuLabelled).',
  ),
  PropRow(
    name: 'colorTheme',
    type: 'Ux4gFabColorTheme',
    defaultValue: 'brand',
    description: 'Color theme styling (brand = purple filled, surface = white elevated).',
  ),
  PropRow(
    name: 'size',
    type: 'Ux4gFabSize',
    defaultValue: 'medium',
    description: 'Button size (small: 44dp, medium: 56dp, large: 64dp).',
  ),
  PropRow(
    name: 'label',
    type: 'String',
    defaultValue: "''",
    description: 'Text label for extended pill variants.',
  ),
  PropRow(
    name: 'icon',
    type: 'dynamic',
    defaultValue: 'Icons.add',
    description: 'IconData or custom Widget for the FAB icon.',
  ),
  PropRow(
    name: 'showIcon',
    type: 'bool',
    defaultValue: 'true',
    description: 'Whether to display an icon in labelled pill variants.',
  ),
  PropRow(
    name: 'actions',
    type: 'List<Ux4gFabActionItem>?',
    defaultValue: 'null',
    description: 'List of speed-dial sub-action items.',
  ),
  PropRow(
    name: 'onPressed',
    type: 'VoidCallback?',
    defaultValue: 'null',
    description: 'Callback fired when single-action FAB is tapped.',
  ),
  PropRow(
    name: 'tooltip',
    type: 'String?',
    defaultValue: 'null',
    description: 'Accessibility tooltip message.',
  ),
];

List<Ux4gFabActionItem> _buildSampleActions(void Function(String msg) onAction) {
  return [
    Ux4gFabActionItem(
      id: 'add',
      label: 'New application',
      icon: Icons.add,
      onPressed: () => onAction('Action: "New application" tapped'),
    ),
    Ux4gFabActionItem(
      id: 'message',
      label: 'Chat support',
      icon: Icons.chat_bubble_outline_rounded,
      onPressed: () => onAction('Action: "Chat support" tapped'),
    ),
    Ux4gFabActionItem(
      id: 'share',
      label: 'Share link',
      icon: Icons.share_outlined,
      onPressed: () => onAction('Action: "Share link" tapped'),
    ),
  ];
}

// ─── FAB Showcase Matrix Widget (Introduction) ────────────────────────────────

class _FabShowcaseWidget extends StatefulWidget {
  const _FabShowcaseWidget();

  @override
  State<_FabShowcaseWidget> createState() => _FabShowcaseWidgetState();
}

class _FabShowcaseWidgetState extends State<_FabShowcaseWidget> {
  String _lastActionLog = 'Tap any FAB button or speed-dial action to interact';

  Widget _buildPreviewBox({
    required Widget child,
    required bool isDark,
    required double height,
    required Alignment alignment,
    String? badgeLabel,
    Color? badgeColor,
  }) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (badgeLabel != null)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: (badgeColor ?? const Color(0xFF4F46E5)).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badgeLabel,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: badgeColor ?? const Color(0xFF4F46E5),
                  ),
                ),
              ),
            ),
          Align(
            alignment: alignment,
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveFabRow({
    required String title,
    required Widget brandChild,
    required Widget surfaceChild,
    required bool isDark,
    required bool isCompact,
    required Color primary,
    double height = 100,
    Alignment alignment = Alignment.center,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : const Color(0xFF334155),
          ),
        ),
        const SizedBox(height: 10),
        if (isCompact) ...[
          // Mobile single-column stacked layout
          _buildPreviewBox(
            child: brandChild,
            isDark: isDark,
            height: height,
            alignment: alignment,
            badgeLabel: 'Brand Theme',
            badgeColor: primary,
          ),
          const SizedBox(height: 10),
          _buildPreviewBox(
            child: surfaceChild,
            isDark: isDark,
            height: height,
            alignment: alignment,
            badgeLabel: 'Surface Theme',
            badgeColor: isDark ? Colors.white70 : const Color(0xFF475569),
          ),
        ] else ...[
          // Desktop / Tablet 2-column side-by-side layout
          Row(
            children: [
              Expanded(
                child: _buildPreviewBox(
                  child: brandChild,
                  isDark: isDark,
                  height: height,
                  alignment: alignment,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _buildPreviewBox(
                  child: surfaceChild,
                  isDark: isDark,
                  height: height,
                  alignment: alignment,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = const Color(0xFF4F46E5);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 620;

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
                  // Action feedback log banner
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
                            _lastActionLog,
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
                  const SizedBox(height: 20),

                  // Theme Column Headers (shown on tablets & desktops)
                  if (!isCompact) ...[
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.circle, size: 10, color: primary),
                                const SizedBox(width: 6),
                                Text(
                                  'Brand Theme (Primary Filled)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: isDark ? Colors.white10 : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle_outlined,
                                  size: 10,
                                  color: isDark ? Colors.white70 : Colors.black87,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Surface Theme (White Elevated)',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: isDark ? Colors.white70 : const Color(0xFF0F172A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],

                  // 1. Standard Circular Icon FAB
                  _buildResponsiveFabRow(
                    title: '1. Standard Circular Icon FAB',
                    height: 100,
                    alignment: Alignment.center,
                    isDark: isDark,
                    isCompact: isCompact,
                    primary: primary,
                    brandChild: Ux4gFab(
                      variant: Ux4gFabVariant.icon,
                      colorTheme: Ux4gFabColorTheme.brand,
                      onPressed: () => setState(() => _lastActionLog = 'Brand Icon FAB pressed'),
                    ),
                    surfaceChild: Ux4gFab(
                      variant: Ux4gFabVariant.icon,
                      colorTheme: Ux4gFabColorTheme.surface,
                      onPressed: () => setState(() => _lastActionLog = 'Surface Icon FAB pressed'),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 2. Extended Labelled Pill FAB (With Icon)
                  _buildResponsiveFabRow(
                    title: '2. Extended Labelled Pill FAB (Icon + Text)',
                    height: 100,
                    alignment: Alignment.center,
                    isDark: isDark,
                    isCompact: isCompact,
                    primary: primary,
                    brandChild: Ux4gFab(
                      variant: Ux4gFabVariant.labelled,
                      colorTheme: Ux4gFabColorTheme.brand,
                      label: 'Add application',
                      icon: Icons.add,
                      onPressed: () => setState(() => _lastActionLog = 'Brand Extended FAB pressed'),
                    ),
                    surfaceChild: Ux4gFab(
                      variant: Ux4gFabVariant.labelled,
                      colorTheme: Ux4gFabColorTheme.surface,
                      label: 'Add application',
                      icon: Icons.add,
                      onPressed: () => setState(() => _lastActionLog = 'Surface Extended FAB pressed'),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 3. Extended Labelled Pill FAB (Text Only)
                  _buildResponsiveFabRow(
                    title: '3. Extended Labelled Pill FAB (Text Only)',
                    height: 100,
                    alignment: Alignment.center,
                    isDark: isDark,
                    isCompact: isCompact,
                    primary: primary,
                    brandChild: Ux4gFab(
                      variant: Ux4gFabVariant.labelled,
                      colorTheme: Ux4gFabColorTheme.brand,
                      label: 'Quick Action',
                      showIcon: false,
                      onPressed: () => setState(() => _lastActionLog = 'Brand Text-Only FAB pressed'),
                    ),
                    surfaceChild: Ux4gFab(
                      variant: Ux4gFabVariant.labelled,
                      colorTheme: Ux4gFabColorTheme.surface,
                      label: 'Quick Action',
                      showIcon: false,
                      onPressed: () => setState(() => _lastActionLog = 'Surface Text-Only FAB pressed'),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 4. Speed-dial: Joined Capsule
                  _buildResponsiveFabRow(
                    title: '4. Speed-Dial: Joined Capsule Menu',
                    height: 280,
                    alignment: Alignment.bottomRight,
                    isDark: isDark,
                    isCompact: isCompact,
                    primary: primary,
                    brandChild: Ux4gFab(
                      variant: Ux4gFabVariant.menuJoined,
                      colorTheme: Ux4gFabColorTheme.brand,
                      actions: _buildSampleActions((msg) => setState(() => _lastActionLog = msg)),
                    ),
                    surfaceChild: Ux4gFab(
                      variant: Ux4gFabVariant.menuJoined,
                      colorTheme: Ux4gFabColorTheme.surface,
                      actions: _buildSampleActions((msg) => setState(() => _lastActionLog = msg)),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 5. Speed-dial: Spaced Circles
                  _buildResponsiveFabRow(
                    title: '5. Speed-Dial: Spaced Floating Circles',
                    height: 280,
                    alignment: Alignment.bottomRight,
                    isDark: isDark,
                    isCompact: isCompact,
                    primary: primary,
                    brandChild: Ux4gFab(
                      variant: Ux4gFabVariant.menuSpaced,
                      colorTheme: Ux4gFabColorTheme.brand,
                      actions: _buildSampleActions((msg) => setState(() => _lastActionLog = msg)),
                    ),
                    surfaceChild: Ux4gFab(
                      variant: Ux4gFabVariant.menuSpaced,
                      colorTheme: Ux4gFabColorTheme.surface,
                      actions: _buildSampleActions((msg) => setState(() => _lastActionLog = msg)),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 6. Speed-dial: Labelled Pills
                  _buildResponsiveFabRow(
                    title: '6. Speed-Dial: Labelled Action Pills',
                    height: 280,
                    alignment: Alignment.bottomRight,
                    isDark: isDark,
                    isCompact: isCompact,
                    primary: primary,
                    brandChild: Ux4gFab(
                      variant: Ux4gFabVariant.menuLabelled,
                      colorTheme: Ux4gFabColorTheme.brand,
                      actions: _buildSampleActions((msg) => setState(() => _lastActionLog = msg)),
                    ),
                    surfaceChild: Ux4gFab(
                      variant: Ux4gFabVariant.menuLabelled,
                      colorTheme: Ux4gFabColorTheme.surface,
                      actions: _buildSampleActions((msg) => setState(() => _lastActionLog = msg)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─── 1. Introduction Component ────────────────────────────────────────────────

final fabIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Overview & Matrix',
      builder: (context) => const ComponentDocs(
        name: 'Floating Action Button',
        description:
            'Ux4gFab provides a prominent Floating Action Button with Brand & Surface color themes, circular icon, extended labelled pill, and 3 speed-dial menu styles.',
        showPreview: false,
        child: _FabShowcaseWidget(),
      ),
    ),
  ],
);

// ─── 2. Circular Icon Component ───────────────────────────────────────────────

final fabCircularIconComponent = WidgetbookComponent(
  name: 'Circular Icon',
  useCases: [
    WidgetbookUseCase(
      name: 'Standard Icon (Brand)',
      builder: (context) {
        String status = 'Tap the FAB to interact';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Circular Icon FAB — Brand Theme',
              description:
                  'Standard circular action button with primary brand purple styling and icon.',
              code: '''Ux4gFab(
  variant: Ux4gFabVariant.icon,
  colorTheme: Ux4gFabColorTheme.brand,
  icon: Icons.add,
  onPressed: () {
    print('FAB pressed');
  },
);''',
              props: _fabProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(status, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 16),
                  Ux4gFab(
                    variant: Ux4gFabVariant.icon,
                    colorTheme: Ux4gFabColorTheme.brand,
                    icon: Icons.add,
                    onPressed: () => setState(() => status = 'Brand Icon FAB tapped!'),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Standard Icon (Surface)',
      builder: (context) {
        String status = 'Tap the FAB to interact';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Circular Icon FAB — Surface Theme',
              description:
                  'Elevated white circular action button with subtle border and shadow.',
              code: '''Ux4gFab(
  variant: Ux4gFabVariant.icon,
  colorTheme: Ux4gFabColorTheme.surface,
  icon: Icons.edit_outlined,
  onPressed: () {},
);''',
              props: _fabProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(status, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 16),
                  Ux4gFab(
                    variant: Ux4gFabVariant.icon,
                    colorTheme: Ux4gFabColorTheme.surface,
                    icon: Icons.edit_outlined,
                    onPressed: () => setState(() => status = 'Surface Icon FAB tapped!'),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Sizes (Small / Medium / Large)',
      builder: (context) {
        return ComponentDocs(
          name: 'Circular Icon FAB — Sizes',
          description:
              'Supports Small (44dp), Medium (56dp, standard), and Large (64dp) sizing presets.',
          code: '''// Small (44dp)
Ux4gFab(size: Ux4gFabSize.small, icon: Icons.add);

// Medium (56dp)
Ux4gFab(size: Ux4gFabSize.medium, icon: Icons.add);

// Large (64dp)
Ux4gFab(size: Ux4gFabSize.large, icon: Icons.add);''',
          props: _fabProps,
          child: Wrap(
            spacing: 20,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Ux4gFab(
                size: Ux4gFabSize.small,
                variant: Ux4gFabVariant.icon,
                colorTheme: Ux4gFabColorTheme.brand,
                icon: Icons.add,
              ),
              Ux4gFab(
                size: Ux4gFabSize.medium,
                variant: Ux4gFabVariant.icon,
                colorTheme: Ux4gFabColorTheme.brand,
                icon: Icons.add,
              ),
              Ux4gFab(
                size: Ux4gFabSize.large,
                variant: Ux4gFabVariant.icon,
                colorTheme: Ux4gFabColorTheme.brand,
                icon: Icons.add,
              ),
            ],
          ),
        );
      },
    ),
  ],
);

// ─── 3. Extended Labelled Component ───────────────────────────────────────────

final fabExtendedLabelledComponent = WidgetbookComponent(
  name: 'Extended Labelled',
  useCases: [
    WidgetbookUseCase(
      name: 'Icon + Label (Brand)',
      builder: (context) {
        String status = 'Tap the Extended FAB';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Extended Labelled FAB — Brand',
              description:
                  'Capsule pill action button with leading icon and descriptive text label.',
              code: '''Ux4gFab(
  variant: Ux4gFabVariant.labelled,
  colorTheme: Ux4gFabColorTheme.brand,
  label: 'Add application',
  icon: Icons.add,
  onPressed: () {},
);''',
              props: _fabProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(status, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 16),
                  Ux4gFab(
                    variant: Ux4gFabVariant.labelled,
                    colorTheme: Ux4gFabColorTheme.brand,
                    label: 'Add application',
                    icon: Icons.add,
                    onPressed: () => setState(() => status = 'Extended FAB tapped!'),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Icon + Label (Surface)',
      builder: (context) {
        String status = 'Tap the Surface Extended FAB';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Extended Labelled FAB — Surface',
              description: 'White elevated capsule button with icon and label.',
              code: '''Ux4gFab(
  variant: Ux4gFabVariant.labelled,
  colorTheme: Ux4gFabColorTheme.surface,
  label: 'New Grievance',
  icon: Icons.assignment_add,
  onPressed: () {},
);''',
              props: _fabProps,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(status, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 16),
                  Ux4gFab(
                    variant: Ux4gFabVariant.labelled,
                    colorTheme: Ux4gFabColorTheme.surface,
                    label: 'New Grievance',
                    icon: Icons.assignment_add,
                    onPressed: () => setState(() => status = 'Surface Extended FAB tapped!'),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Text Only (No Icon)',
      builder: (context) {
        return ComponentDocs(
          name: 'Extended Labelled FAB — Text Only',
          description:
              'Pill action button without icon (`showIcon: false`) for direct text CTAs.',
          code: '''Ux4gFab(
  variant: Ux4gFabVariant.labelled,
  colorTheme: Ux4gFabColorTheme.brand,
  label: 'Quick Action',
  showIcon: false,
  onPressed: () {},
);''',
          props: _fabProps,
          child: Ux4gFab(
            variant: Ux4gFabVariant.labelled,
            colorTheme: Ux4gFabColorTheme.brand,
            label: 'Quick Action',
            showIcon: false,
            onPressed: () {},
          ),
        );
      },
    ),
  ],
);

// ─── 4. Speed-Dial: Joined Capsule Component ──────────────────────────────────

final fabMenuJoinedComponent = WidgetbookComponent(
  name: 'Speed-Dial Joined',
  useCases: [
    WidgetbookUseCase(
      name: 'Joined Capsule Menu',
      builder: (context) {
        String log = 'Tap the FAB to open the joined capsule menu';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Speed-Dial — Joined Capsule',
              description:
                  'Multi-action speed-dial menu where sub-actions expand vertically inside a single connected capsule.',
              code: '''Ux4gFab(
  variant: Ux4gFabVariant.menuJoined,
  colorTheme: Ux4gFabColorTheme.brand,
  actions: [
    Ux4gFabActionItem(id: 'add', label: 'Add', icon: Icons.add, onPressed: () {}),
    Ux4gFabActionItem(id: 'msg', label: 'Message', icon: Icons.chat, onPressed: () {}),
    Ux4gFabActionItem(id: 'share', label: 'Share', icon: Icons.share, onPressed: () {}),
  ],
);''',
              props: _fabProps,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(log, style: const TextStyle(fontSize: 12)),
                      ),
                      const Spacer(),
                      Ux4gFab(
                        variant: Ux4gFabVariant.menuJoined,
                        colorTheme: Ux4gFabColorTheme.brand,
                        actions: _buildSampleActions((msg) => setState(() => log = msg)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 5. Speed-Dial: Spaced Circles Component ──────────────────────────────────

final fabMenuSpacedComponent = WidgetbookComponent(
  name: 'Speed-Dial Spaced',
  useCases: [
    WidgetbookUseCase(
      name: 'Spaced Floating Circles',
      builder: (context) {
        String log = 'Tap the FAB to reveal spaced floating circles';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Speed-Dial — Spaced Circles',
              description:
                  'Multi-action speed-dial menu with distinct circular action buttons floating above the primary FAB.',
              code: '''Ux4gFab(
  variant: Ux4gFabVariant.menuSpaced,
  colorTheme: Ux4gFabColorTheme.brand,
  actions: [
    Ux4gFabActionItem(id: 'add', icon: Icons.add, tooltip: 'Add', onPressed: () {}),
    Ux4gFabActionItem(id: 'msg', icon: Icons.chat, tooltip: 'Chat', onPressed: () {}),
    Ux4gFabActionItem(id: 'share', icon: Icons.share, tooltip: 'Share', onPressed: () {}),
  ],
);''',
              props: _fabProps,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(log, style: const TextStyle(fontSize: 12)),
                      ),
                      const Spacer(),
                      Ux4gFab(
                        variant: Ux4gFabVariant.menuSpaced,
                        colorTheme: Ux4gFabColorTheme.brand,
                        actions: _buildSampleActions((msg) => setState(() => log = msg)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 6. Speed-Dial: Labelled Pills Component ──────────────────────────────────

final fabMenuLabelledComponent = WidgetbookComponent(
  name: 'Speed-Dial Labelled',
  useCases: [
    WidgetbookUseCase(
      name: 'Labelled Action Pills',
      builder: (context) {
        String log = 'Tap the FAB to expand labelled action pills';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Speed-Dial — Labelled Pills',
              description:
                  'Speed-dial menu with full capsule action pills displaying both icons and explanatory labels.',
              code: '''Ux4gFab(
  variant: Ux4gFabVariant.menuLabelled,
  colorTheme: Ux4gFabColorTheme.brand,
  actions: [
    Ux4gFabActionItem(id: 'new_form', label: 'New application', icon: Icons.add, onPressed: () {}),
    Ux4gFabActionItem(id: 'chat', label: 'Chat support', icon: Icons.chat, onPressed: () {}),
    Ux4gFabActionItem(id: 'share', label: 'Share link', icon: Icons.share, onPressed: () {}),
  ],
);''',
              props: _fabProps,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(log, style: const TextStyle(fontSize: 12)),
                      ),
                      const Spacer(),
                      Ux4gFab(
                        variant: Ux4gFabVariant.menuLabelled,
                        colorTheme: Ux4gFabColorTheme.brand,
                        actions: _buildSampleActions((msg) => setState(() => log = msg)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 7. Themes Comparison Component ───────────────────────────────────────────

final fabThemesComponent = WidgetbookComponent(
  name: 'Themes Comparison',
  useCases: [
    WidgetbookUseCase(
      name: 'Brand vs Surface Themes',
      builder: (context) {
        return ComponentDocs(
          name: 'FAB Color Themes',
          description:
              'Comparison between Brand (filled purple primary) and Surface (white elevated with subtle border) themes.',
          code: '''// Brand Theme
Ux4gFab(colorTheme: Ux4gFabColorTheme.brand, icon: Icons.add);

// Surface Theme
Ux4gFab(colorTheme: Ux4gFabColorTheme.surface, icon: Icons.add);''',
          props: _fabProps,
          child: Wrap(
            spacing: 32,
            runSpacing: 24,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Brand Theme', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Ux4gFab(
                    variant: Ux4gFabVariant.icon,
                    colorTheme: Ux4gFabColorTheme.brand,
                    icon: Icons.add,
                  ),
                  const SizedBox(height: 12),
                  Ux4gFab(
                    variant: Ux4gFabVariant.labelled,
                    colorTheme: Ux4gFabColorTheme.brand,
                    label: 'Brand Pill',
                    icon: Icons.add,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Surface Theme', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Ux4gFab(
                    variant: Ux4gFabVariant.icon,
                    colorTheme: Ux4gFabColorTheme.surface,
                    icon: Icons.add,
                  ),
                  const SizedBox(height: 12),
                  Ux4gFab(
                    variant: Ux4gFabVariant.labelled,
                    colorTheme: Ux4gFabColorTheme.surface,
                    label: 'Surface Pill',
                    icon: Icons.add,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  ],
);
