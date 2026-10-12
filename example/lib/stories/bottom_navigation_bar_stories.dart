import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ─── Shared Navigation Items Helper ───────────────────────────────────────────

List<Ux4gBottomNavItem> _buildStandardItems({int? alertsBadge = 3}) {
  return [
    const Ux4gBottomNavItem(
      key: 'home',
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    const Ux4gBottomNavItem(
      key: 'services',
      label: 'Services',
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view,
    ),
    const Ux4gBottomNavItem(
      key: 'status',
      label: 'Status',
      icon: Icons.assignment_outlined,
      activeIcon: Icons.assignment,
    ),
    Ux4gBottomNavItem(
      key: 'alerts',
      label: 'Alerts',
      icon: Icons.notifications_none_outlined,
      activeIcon: Icons.notifications,
      badge: alertsBadge,
    ),
    const Ux4gBottomNavItem(
      key: 'profile',
      label: 'Profile',
      icon: Icons.person_outline,
      activeIcon: Icons.person,
    ),
  ];
}

List<Ux4gBottomNavItem> _buildCentreActionItems() {
  return const [
    Ux4gBottomNavItem(
      key: 'home',
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    Ux4gBottomNavItem(
      key: 'services',
      label: 'Services',
      icon: Icons.grid_view_outlined,
      activeIcon: Icons.grid_view,
    ),
    Ux4gBottomNavItem(
      key: 'status',
      label: 'Status',
      icon: Icons.assignment_outlined,
      activeIcon: Icons.assignment,
    ),
    Ux4gBottomNavItem(
      key: 'alerts',
      label: 'Alerts',
      icon: Icons.notifications_none_outlined,
      activeIcon: Icons.notifications,
      badge: '!',
    ),
  ];
}

// ─── 4-Variant Introduction Showcase Widget ───────────────────────────────────

class _BottomNavIntroductionShowcase extends StatefulWidget {
  const _BottomNavIntroductionShowcase();

  @override
  State<_BottomNavIntroductionShowcase> createState() =>
      _BottomNavIntroductionShowcaseState();
}

class _BottomNavIntroductionShowcaseState
    extends State<_BottomNavIntroductionShowcase> {
  String _lastActionMessage = 'Tap any tab in the 4 variants below to interact';

  final List<int> _selectedIndices = [0, 0, 0, 0];

  void _onTabSelected(
    int variantIndex,
    int tabIndex,
    String label,
    String variantName,
  ) {
    setState(() {
      _selectedIndices[variantIndex] = tabIndex;
      _lastActionMessage =
          '[$variantName] selected tab "$label" (index $tabIndex)';
    });
  }

  Widget _buildVariantCard({
    required BuildContext context,
    required int variantIndex,
    required String number,
    required String title,
    required String badgeText,
    required String description,
    required Widget navBar,
    required bool isDark,
    required Color primary,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Card Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    number,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? Colors.white
                                  : const Color(0xFF0F172A),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.white10
                                  : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isDark
                                    ? Colors.white24
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Text(
                              badgeText,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? Colors.white70
                                    : Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white60 : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Mini device screen placeholder area
          Container(
            height: 36,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF161925) : const Color(0xFFF1F5F9),
              border: Border(
                top: BorderSide(
                  color: isDark
                      ? const Color(0xFF2D3348)
                      : Colors.grey.shade200,
                ),
                bottom: BorderSide(
                  color: isDark
                      ? const Color(0xFF2D3348)
                      : Colors.grey.shade200,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white24 : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white24 : Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white24 : Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom Navigation Component
          navBar,
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
            constraints: const BoxConstraints(maxWidth: 560),
            child: Container(
              padding: EdgeInsets.all(isCompact ? 14.0 : 24.0),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF161925)
                    : const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Badge & Title
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '4 CORE VARIANTS',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: primary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Text(
                        'Bottom Navigation Bar',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? Colors.white
                                  : const Color(0xFF0F172A),
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore the 4 primary UX4G bottom navigation styles featuring responsive layout shapes, active indicator animations, notification badges, and center actions.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDark ? Colors.white60 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Action feedback bar
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primary.withValues(alpha: 0.2)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.touch_app_outlined,
                          size: 16,
                          color: primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _lastActionMessage,
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

                  // ── Variant 1: Standard Labelled (Pill Indicator) ──
                  _buildVariantCard(
                    context: context,
                    variantIndex: 0,
                    number: '1',
                    title: 'Standard Labelled',
                    badgeText: 'Pill Indicator',
                    description:
                        'Full width bar with icons, text labels, and purple capsule pill highlight.',
                    isDark: isDark,
                    primary: primary,
                    navBar: Ux4gBottomNavigationBar(
                      items: _buildStandardItems(alertsBadge: 3),
                      variant: Ux4gBottomNavVariant.labelled,
                      indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
                      showLabels: true,
                      selectedIndex: _selectedIndices[0],
                      onTabChange: (idx, item) {
                        _onTabSelected(0, idx, item.label, 'Standard Labelled');
                      },
                      useSafeArea: false,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Variant 2: Top-Rounded with Badges (Bar Indicator) ──
                  _buildVariantCard(
                    context: context,
                    variantIndex: 1,
                    number: '2',
                    title: 'Top Rounded Shape',
                    badgeText: 'Bar Indicator + Badge',
                    description:
                        'Curved top corners, top line indicator bar, and high-contrast unread count badge.',
                    isDark: isDark,
                    primary: primary,
                    navBar: Ux4gBottomNavigationBar(
                      items: _buildStandardItems(alertsBadge: 99),
                      variant: Ux4gBottomNavVariant.topRounded,
                      indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
                      showLabels: true,
                      selectedIndex: _selectedIndices[1],
                      onTabChange: (idx, item) {
                        _onTabSelected(1, idx, item.label, 'Top Rounded');
                      },
                      useSafeArea: false,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Variant 3: Centre Action with FAB (Plain Indicator) ──
                  _buildVariantCard(
                    context: context,
                    variantIndex: 2,
                    number: '3',
                    title: 'Centre Action (FAB)',
                    badgeText: 'Central Action Button',
                    description:
                        '4 navigation destinations with an elevated prominent central circular action button.',
                    isDark: isDark,
                    primary: primary,
                    navBar: Ux4gBottomNavigationBar(
                      items: _buildCentreActionItems(),
                      variant: Ux4gBottomNavVariant.centreAction,
                      indicatorVariant: Ux4gBottomNavIndicatorVariant.plain,
                      showLabels: true,
                      selectedIndex: _selectedIndices[2],
                      onTabChange: (idx, item) {
                        _onTabSelected(2, idx, item.label, 'Centre Action');
                      },
                      centerAction: Ux4gBottomNavCenterAction(
                        onPressed: () {
                          setState(() {
                            _lastActionMessage =
                                '[Centre Action] Prominent (+) action button tapped!';
                          });
                        },
                        tooltip: 'Create New Application',
                      ),
                      useSafeArea: false,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ── Variant 4: Floating Pill ──
                  _buildVariantCard(
                    context: context,
                    variantIndex: 3,
                    number: '4',
                    title: 'Floating Pill Bar',
                    badgeText: 'Detached Capsule',
                    description:
                        'Modern detached pill navigation bar with rounded borders and ambient shadow.',
                    isDark: isDark,
                    primary: primary,
                    navBar: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Ux4gBottomNavigationBar(
                        items: _buildStandardItems(alertsBadge: null),
                        variant: Ux4gBottomNavVariant.floatingPill,
                        indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
                        showLabels: true,
                        selectedIndex: _selectedIndices[3],
                        onTabChange: (idx, item) {
                          _onTabSelected(3, idx, item.label, 'Floating Pill');
                        },
                        useSafeArea: false,
                      ),
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

// ─── Shared Component Props Documentation ─────────────────────────────────────

const _bottomNavProps = [
  PropRow(
    name: 'variant',
    type: 'Ux4gBottomNavVariant',
    defaultValue: 'labelled',
    description:
        'Layout & shape variant (labelled, topRounded, iconOnly, centreAction, floatingPill).',
  ),
  PropRow(
    name: 'indicatorVariant',
    type: 'Ux4gBottomNavIndicatorVariant',
    defaultValue: 'pill',
    description:
        'Active tab indicator style (pill capsule, bar top line, plain tinted).',
  ),
  PropRow(
    name: 'items',
    type: 'List<Ux4gBottomNavItem>',
    defaultValue: '[]',
    description:
        'List of navigation items with icons, active icons, labels, and badges.',
    required: true,
  ),
  PropRow(
    name: 'selectedIndex',
    type: 'int',
    defaultValue: '0',
    description: 'Index of the currently active tab item.',
  ),
  PropRow(
    name: 'onTabChange',
    type: 'void Function(int index, Ux4gBottomNavItem item)?',
    defaultValue: 'null',
    description: 'Callback triggered whenever a tab item is tapped.',
  ),
  PropRow(
    name: 'centerAction',
    type: 'Ux4gBottomNavCenterAction?',
    defaultValue: 'null',
    description: 'Configuration for prominent center floating action button.',
  ),
  PropRow(
    name: 'showLabels',
    type: 'bool',
    defaultValue: 'true',
    description: 'Whether to display text labels under tab icons.',
  ),
  PropRow(
    name: 'useSafeArea',
    type: 'bool',
    defaultValue: 'true',
    description: 'Whether to wrap the bottom navigation in a SafeArea.',
  ),
];

// ─── Responsive Container Helper ──────────────────────────────────────────────

Widget _buildResponsiveContainer(Widget child) {
  return ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 420),
    child: SizedBox(width: double.infinity, child: child),
  );
}

// ─── 1. Introduction Component ────────────────────────────────────────────────

final bottomNavigationIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: '4 Core Variants Showcase',
      builder: (context) => const ComponentDocs(
        name: 'Bottom Navigation Bar',
        description:
            'Ux4gBottomNavigationBar provides accessible, mobile-first bottom navigation supporting 4 shape styles, 3 active indicators, badges, and prominent center action buttons.',
        showPreview: false,
        child: _BottomNavIntroductionShowcase(),
      ),
    ),
  ],
);

// ─── 2. Standard / Labelled Component ─────────────────────────────────────────

final bottomNavLabelledComponent = WidgetbookComponent(
  name: 'Labelled',
  useCases: [
    WidgetbookUseCase(
      name: 'Pill Indicator (Default)',
      builder: (context) {
        int selectedIndex = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Labelled — Pill Indicator',
              description:
                  'Standard full-width bottom navigation with text labels and purple capsule indicator.',
              code: '''Ux4gBottomNavigationBar(
  selectedIndex: selectedIndex,
  onTabChange: (index, item) {
    setState(() => selectedIndex = index);
  },
  variant: Ux4gBottomNavVariant.labelled,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
  items: const [
    Ux4gBottomNavItem(key: 'home', label: 'Home', icon: Icons.home_outlined, activeIcon: Icons.home),
    Ux4gBottomNavItem(key: 'services', label: 'Services', icon: Icons.grid_view_outlined, activeIcon: Icons.grid_view),
    Ux4gBottomNavItem(key: 'status', label: 'Status', icon: Icons.assignment_outlined, activeIcon: Icons.assignment),
    Ux4gBottomNavItem(key: 'alerts', label: 'Alerts', icon: Icons.notifications_none_outlined, badge: 3),
    Ux4gBottomNavItem(key: 'profile', label: 'Profile', icon: Icons.person_outline, activeIcon: Icons.person),
  ],
)''',
              props: _bottomNavProps,
              child: _buildResponsiveContainer(
                Ux4gBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onTabChange: (idx, item) =>
                      setState(() => selectedIndex = idx),
                  variant: Ux4gBottomNavVariant.labelled,
                  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
                  items: _buildStandardItems(alertsBadge: 3),
                  useSafeArea: false,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Bar Indicator',
      builder: (context) {
        int selectedIndex = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Labelled — Bar Indicator',
              description:
                  'Full-width bottom navigation with top purple line indicator above the active item.',
              code: '''Ux4gBottomNavigationBar(
  selectedIndex: selectedIndex,
  onTabChange: (index, item) => setState(() => selectedIndex = index),
  variant: Ux4gBottomNavVariant.labelled,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
  items: items,
)''',
              props: _bottomNavProps,
              child: _buildResponsiveContainer(
                Ux4gBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onTabChange: (idx, item) =>
                      setState(() => selectedIndex = idx),
                  variant: Ux4gBottomNavVariant.labelled,
                  indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
                  items: _buildStandardItems(alertsBadge: 3),
                  useSafeArea: false,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Plain Indicator',
      builder: (context) {
        int selectedIndex = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Labelled — Plain Indicator',
              description:
                  'Clean active state with icon and label color tinting without capsule or bar overlays.',
              code: '''Ux4gBottomNavigationBar(
  selectedIndex: selectedIndex,
  onTabChange: (index, item) => setState(() => selectedIndex = index),
  variant: Ux4gBottomNavVariant.labelled,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.plain,
  items: items,
)''',
              props: _bottomNavProps,
              child: _buildResponsiveContainer(
                Ux4gBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onTabChange: (idx, item) =>
                      setState(() => selectedIndex = idx),
                  variant: Ux4gBottomNavVariant.labelled,
                  indicatorVariant: Ux4gBottomNavIndicatorVariant.plain,
                  items: _buildStandardItems(alertsBadge: 3),
                  useSafeArea: false,
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 3. Top Rounded Component ─────────────────────────────────────────────────

final bottomNavTopRoundedComponent = WidgetbookComponent(
  name: 'Top Rounded',
  useCases: [
    WidgetbookUseCase(
      name: 'Top Rounded with Badges',
      builder: (context) {
        int selectedIndex = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Top Rounded Variant',
              description:
                  'Bottom navigation featuring smooth top-left and top-right corner radii with badge support.',
              code: '''Ux4gBottomNavigationBar(
  selectedIndex: selectedIndex,
  onTabChange: (index, item) => setState(() => selectedIndex = index),
  variant: Ux4gBottomNavVariant.topRounded,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
  items: items,
)''',
              props: _bottomNavProps,
              child: _buildResponsiveContainer(
                Ux4gBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onTabChange: (idx, item) =>
                      setState(() => selectedIndex = idx),
                  variant: Ux4gBottomNavVariant.topRounded,
                  indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
                  items: _buildStandardItems(alertsBadge: 99),
                  useSafeArea: false,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Top Rounded with Pill Indicator',
      builder: (context) {
        int selectedIndex = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Top Rounded — Pill Indicator',
              description:
                  'Top-rounded shape combined with active pill capsule indicator.',
              child: _buildResponsiveContainer(
                Ux4gBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onTabChange: (idx, item) =>
                      setState(() => selectedIndex = idx),
                  variant: Ux4gBottomNavVariant.topRounded,
                  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
                  items: _buildStandardItems(alertsBadge: 5),
                  useSafeArea: false,
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 4. Icon Only Component ───────────────────────────────────────────────────

final bottomNavIconOnlyComponent = WidgetbookComponent(
  name: 'Icon Only',
  useCases: [
    WidgetbookUseCase(
      name: 'Icon Only (Pill Indicator)',
      builder: (context) {
        int selectedIndex = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Icon Only Variant',
              description:
                  'Compact bottom navigation showing only icons without text labels for minimalist layouts.',
              code: '''Ux4gBottomNavigationBar(
  selectedIndex: selectedIndex,
  onTabChange: (index, item) => setState(() => selectedIndex = index),
  variant: Ux4gBottomNavVariant.iconOnly,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
  showLabels: false,
  items: items,
)''',
              props: _bottomNavProps,
              child: _buildResponsiveContainer(
                Ux4gBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onTabChange: (idx, item) =>
                      setState(() => selectedIndex = idx),
                  variant: Ux4gBottomNavVariant.iconOnly,
                  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
                  showLabels: false,
                  items: _buildStandardItems(alertsBadge: 2),
                  useSafeArea: false,
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Icon Only (Bar Indicator)',
      builder: (context) {
        int selectedIndex = 2;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Icon Only — Bar Indicator',
              description:
                  'Minimalist icon-only navigation with top bar indicator line.',
              child: _buildResponsiveContainer(
                Ux4gBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onTabChange: (idx, item) =>
                      setState(() => selectedIndex = idx),
                  variant: Ux4gBottomNavVariant.iconOnly,
                  indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
                  showLabels: false,
                  items: _buildStandardItems(alertsBadge: null),
                  useSafeArea: false,
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 5. Centre Action Component ───────────────────────────────────────────────

final bottomNavCentreActionComponent = WidgetbookComponent(
  name: 'Centre Action',
  useCases: [
    WidgetbookUseCase(
      name: 'Centre Action with FAB',
      builder: (context) {
        int selectedIndex = 0;
        String fabMessage = 'Tap the central (+) action button';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Centre Action Variant',
              description:
                  'Bottom navigation featuring an elevated prominent central circular action button (FAB) for primary actions.',
              code: '''Ux4gBottomNavigationBar(
  selectedIndex: selectedIndex,
  onTabChange: (index, item) => setState(() => selectedIndex = index),
  variant: Ux4gBottomNavVariant.centreAction,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.plain,
  items: const [
    Ux4gBottomNavItem(key: 'home', label: 'Home', icon: Icons.home_outlined),
    Ux4gBottomNavItem(key: 'services', label: 'Services', icon: Icons.grid_view_outlined),
    Ux4gBottomNavItem(key: 'status', label: 'Status', icon: Icons.assignment_outlined),
    Ux4gBottomNavItem(key: 'alerts', label: 'Alerts', icon: Icons.notifications_none_outlined, badge: '!'),
  ],
  centerAction: Ux4gBottomNavCenterAction(
    icon: Icons.add,
    onPressed: () {
      print('Center Action tapped!');
    },
    tooltip: 'Create New Application',
  ),
)''',
              props: _bottomNavProps,
              child: _buildResponsiveContainer(
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4F46E5).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        fabMessage,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4F46E5),
                        ),
                      ),
                    ),
                    Ux4gBottomNavigationBar(
                      selectedIndex: selectedIndex,
                      onTabChange: (idx, item) {
                        setState(() {
                          selectedIndex = idx;
                          fabMessage = 'Tab tapped: "${item.label}"';
                        });
                      },
                      variant: Ux4gBottomNavVariant.centreAction,
                      indicatorVariant: Ux4gBottomNavIndicatorVariant.plain,
                      items: _buildCentreActionItems(),
                      centerAction: Ux4gBottomNavCenterAction(
                        onPressed: () {
                          setState(() {
                            fabMessage =
                                'FAB pressed! Quick create modal triggered.';
                          });
                        },
                        tooltip: 'Create New Item',
                      ),
                      useSafeArea: false,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 6. Floating Pill Component ───────────────────────────────────────────────

final bottomNavFloatingPillComponent = WidgetbookComponent(
  name: 'Floating Pill',
  useCases: [
    WidgetbookUseCase(
      name: 'Floating Pill (Pill Indicator)',
      builder: (context) {
        int selectedIndex = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Floating Pill Variant',
              description:
                  'Detached floating capsule navigation bar with rounded borders and elevated elevation shadow.',
              code: '''Ux4gBottomNavigationBar(
  selectedIndex: selectedIndex,
  onTabChange: (index, item) => setState(() => selectedIndex = index),
  variant: Ux4gBottomNavVariant.floatingPill,
  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
  items: items,
)''',
              props: _bottomNavProps,
              child: _buildResponsiveContainer(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ux4gBottomNavigationBar(
                    selectedIndex: selectedIndex,
                    onTabChange: (idx, item) =>
                        setState(() => selectedIndex = idx),
                    variant: Ux4gBottomNavVariant.floatingPill,
                    indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
                    items: _buildStandardItems(alertsBadge: null),
                    useSafeArea: false,
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Floating Pill (Bar Indicator)',
      builder: (context) {
        int selectedIndex = 1;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Floating Pill — Bar Indicator',
              description: 'Floating pill shape with top bar indicator line.',
              child: _buildResponsiveContainer(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ux4gBottomNavigationBar(
                    selectedIndex: selectedIndex,
                    onTabChange: (idx, item) =>
                        setState(() => selectedIndex = idx),
                    variant: Ux4gBottomNavVariant.floatingPill,
                    indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
                    items: _buildStandardItems(alertsBadge: null),
                    useSafeArea: false,
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

// ─── 7. Indicators Comparison Component ───────────────────────────────────────

final bottomNavIndicatorsComponent = WidgetbookComponent(
  name: 'Indicators',
  useCases: [
    WidgetbookUseCase(
      name: 'Indicator Styles Comparison',
      builder: (context) {
        int pillIdx = 0;
        int barIdx = 1;
        int plainIdx = 2;

        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Active Indicator Styles',
              description:
                  'Ux4gBottomNavigationBar supports 3 indicator styles: Pill (capsule fill), Bar (top accent line), and Plain (color tint).',
              code: '''// 1. Pill Capsule Indicator
Ux4gBottomNavigationBar(
  indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
  items: items,
);

// 2. Bar Top Line Indicator
Ux4gBottomNavigationBar(
  indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
  items: items,
);

// 3. Plain Tint Indicator
Ux4gBottomNavigationBar(
  indicatorVariant: Ux4gBottomNavIndicatorVariant.plain,
  items: items,
);''',
              props: _bottomNavProps,
              child: _buildResponsiveContainer(
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pill Capsule Indicator',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gBottomNavigationBar(
                      selectedIndex: pillIdx,
                      onTabChange: (idx, item) => setState(() => pillIdx = idx),
                      variant: Ux4gBottomNavVariant.labelled,
                      indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
                      items: _buildStandardItems(alertsBadge: 3),
                      useSafeArea: false,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Bar Top Line Indicator',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gBottomNavigationBar(
                      selectedIndex: barIdx,
                      onTabChange: (idx, item) => setState(() => barIdx = idx),
                      variant: Ux4gBottomNavVariant.labelled,
                      indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
                      items: _buildStandardItems(alertsBadge: 3),
                      useSafeArea: false,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Plain Active Tint Indicator',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Ux4gBottomNavigationBar(
                      selectedIndex: plainIdx,
                      onTabChange: (idx, item) =>
                          setState(() => plainIdx = idx),
                      variant: Ux4gBottomNavVariant.labelled,
                      indicatorVariant: Ux4gBottomNavIndicatorVariant.plain,
                      items: _buildStandardItems(alertsBadge: 3),
                      useSafeArea: false,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);
