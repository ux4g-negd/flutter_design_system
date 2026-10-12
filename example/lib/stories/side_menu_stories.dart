import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ─── Shared Props Documentation ───────────────────────────────────────────────

const _sideMenuProps = [
  PropRow(
    name: 'position',
    type: 'Ux4gSideMenuPosition',
    defaultValue: 'left',
    description: 'Positioning of the side menu drawer (left or right).',
  ),
  PropRow(
    name: 'headerType',
    type: 'Ux4gSideMenuHeaderType',
    defaultValue: 'standard',
    description: 'Header style type (standard, compactUser, prominentUser, plain, custom).',
  ),
  PropRow(
    name: 'title',
    type: 'String',
    defaultValue: "'Revenue Department'",
    description: 'Header department or user title.',
  ),
  PropRow(
    name: 'subtitle',
    type: 'String?',
    defaultValue: "'Government of India'",
    description: 'Header subtitle or division name.',
  ),
  PropRow(
    name: 'showSearch',
    type: 'bool',
    defaultValue: 'true',
    description: 'Whether to display real-time search input at the top.',
  ),
  PropRow(
    name: 'sections',
    type: 'List<Ux4gSideMenuSection>?',
    defaultValue: 'null',
    description: 'Grouped navigation sections and collapsible menu item hierarchies.',
  ),
  PropRow(
    name: 'actionCard',
    type: 'Ux4gSideMenuActionCard?',
    defaultValue: 'null',
    description: 'Optional prominent callout / action-required banner card.',
  ),
  PropRow(
    name: 'bottomBranding',
    type: 'Ux4gSideMenuBottomBranding?',
    defaultValue: 'null',
    description: 'Optional bottom branding block with emblem and division details.',
  ),
  PropRow(
    name: 'showSignOut',
    type: 'bool',
    defaultValue: 'true',
    description: 'Whether to render the Sign out button in the footer.',
  ),
];

// ─── Responsive Container Helper ──────────────────────────────────────────────

Widget _buildResponsiveSideMenuContainer(BuildContext context, Widget child, {double height = 600}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return Align(
    alignment: Alignment.centerLeft,
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340),
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? const Color(0xFF2D3348) : Colors.grey.shade300,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    ),
  );
}

// ─── Side Menu Showcase Matrix Widget (Introduction) ──────────────────────────

class _SideMenuShowcaseWidget extends StatefulWidget {
  const _SideMenuShowcaseWidget();

  @override
  State<_SideMenuShowcaseWidget> createState() => _SideMenuShowcaseWidgetState();
}

class _SideMenuShowcaseWidgetState extends State<_SideMenuShowcaseWidget> {
  int _selectedPreset = 0;
  String _actionLog = 'Tap any item in the side menu or launch modal drawer';

  final List<String> _presetNames = [
    '1. Standard Government Navigation',
    '2. Officer Inbox',
    '3. Citizen Profile Menu',
    '4. Action Required Banner',
    '5. Department Switcher',
    '6. Citizen Simple Navigation',
  ];

  Widget _buildPresetWidget(
    int index, {
    VoidCallback? onClose,
    bool isModal = false,
  }) {
    final prefix = isModal ? 'Modal Drawer: ' : '';
    switch (index) {
      case 1:
        return Ux4gSideMenuPresets.officerInbox(
          onClose: onClose,
          name: 'Ramesh Kumar',
          email: 'ramesh.kumar@gov.in',
          division: 'Kanpur division',
          onItemSelected: (item) {
            setState(() {
              _actionLog = '${prefix}Selected mailbox: "${item.label}" (${item.key})';
            });
          },
          onCustomizeInbox: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "Customize inbox"';
            });
          },
          onSignOut: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "Sign out"';
            });
          },
        );
      case 2:
        return Ux4gSideMenuPresets.citizenProfile(
          onClose: onClose,
          name: 'Ramesh Kumar',
          role: 'Citizen',
          metaText: '12 applications · 3 actions required',
          onViewProfile: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "View profile" button';
            });
          },
          onItemSelected: (item) {
            setState(() {
              _actionLog = '${prefix}Selected profile item: "${item.label}"';
            });
          },
          onSignOut: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "Sign out"';
            });
          },
        );
      case 3:
        return Ux4gSideMenuPresets.actionRequired(
          onClose: onClose,
          title: 'Revenue Department',
          subtitle: 'Kanpur division',
          onVerifyAadhaar: () {
            setState(() {
              _actionLog = '${prefix}Action card CTA tapped: "Verify now"';
            });
          },
          onItemSelected: (item) {
            setState(() {
              _actionLog = '${prefix}Selected menu item: "${item.label}"';
            });
          },
        );
      case 4:
        return Ux4gSideMenuPresets.departmentSwitcher(
          onClose: onClose,
          title: 'Departments',
          subtitle: 'Choose a department to work in.',
          selectedDepartmentKey: 'dept-revenue',
          onSelectDepartment: (dept) {
            setState(() {
              _actionLog = '${prefix}Switched to department: "${dept.label}"';
            });
          },
          onRequestAccess: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "+ Request department access"';
            });
          },
          onSettings: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "Settings"';
            });
          },
          onHelp: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "Help & support"';
            });
          },
        );
      case 5:
        return Ux4gSideMenuPresets.citizenSimple(
          onClose: onClose,
          name: 'Ramesh Kumar',
          role: 'Citizen',
          onItemSelected: (item) {
            setState(() {
              _actionLog = '${prefix}Selected item: "${item.label}"';
            });
          },
          onSignOut: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "Sign out"';
            });
          },
        );
      case 0:
      default:
        return Ux4gSideMenuPresets.standard(
          onClose: onClose,
          onItemSelected: (item) {
            setState(() {
              _actionLog = '${prefix}Selected navigation item: "${item.label}" (${item.key})';
            });
          },
          onSignOut: () {
            setState(() {
              _actionLog = '${prefix}Action tapped: "Sign out"';
            });
          },
        );
    }
  }

  void _launchModal(BuildContext context, Ux4gSideMenuPosition position) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss Side Menu',
      barrierColor: const Color(0x80000000),
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return Align(
          alignment: position == Ux4gSideMenuPosition.left
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: _buildPresetWidget(
              _selectedPreset,
              onClose: () => Navigator.of(dialogContext).pop(),
              isModal: true,
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curve = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );
        final offsetTween = position == Ux4gSideMenuPosition.left
            ? Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            : Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero);

        return SlideTransition(
          position: offsetTween.animate(curve),
          child: child,
        );
      },
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
                  // Action Log Banner
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
                            _actionLog,
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

                  // Preset Selector Buttons
                  Text(
                    'SELECT DESIGN SYSTEM STATE PRESET',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white54 : Colors.grey[600],
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(_presetNames.length, (idx) {
                      final isSelected = _selectedPreset == idx;
                      return ChoiceChip(
                        label: Text(_presetNames[idx]),
                        selected: isSelected,
                        onSelected: (val) {
                          if (val) setState(() => _selectedPreset = idx);
                        },
                        selectedColor: primary.withValues(alpha: 0.15),
                        labelStyle: TextStyle(
                          color: isSelected ? primary : (isDark ? Colors.white70 : Colors.black87),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),

                  // Modal Launchers in Wrap
                  Wrap(
                    spacing: 12,
                    runSpacing: 10,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () => _launchModal(context, Ux4gSideMenuPosition.left),
                        icon: const Icon(Icons.dock_outlined, size: 16),
                        label: const Text('Launch Left Drawer'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => _launchModal(context, Ux4gSideMenuPosition.right),
                        icon: const Icon(Icons.dock_outlined, size: 16),
                        label: const Text('Launch Right Drawer'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Side Menu Live Preview Box
                  _buildResponsiveSideMenuContainer(
                    context,
                    _buildPresetWidget(_selectedPreset),
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

final sideMenuIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Overview & Presets Showcase',
      builder: (context) => const ComponentDocs(
        name: 'Side Menu',
        description:
            'Side Menu (Ux4gSideMenu) provides a flexible, responsive navigation drawer and navigation rail designed for government portals, enterprise suites, and citizen dashboards.',
        showPreview: false,
        child: _SideMenuShowcaseWidget(),
      ),
    ),
  ],
);

// ─── 2. Standard Government Navigation Component ──────────────────────────────

final sideMenuStandardComponent = WidgetbookComponent(
  name: 'Standard Government',
  useCases: [
    WidgetbookUseCase(
      name: 'Standard Portal Navigation',
      builder: (context) {
        String log = 'Tap any navigation item';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Standard Government Navigation',
              description:
                  'Standard government navigation drawer featuring National Emblem, real-time search, hierarchical accordion with vertical connector lines, unread badges, and sign out footer.',
              code: '''Ux4gSideMenuPresets.standard(
  title: 'Revenue Department',
  subtitle: 'Government of India',
  onItemSelected: (item) {
    print('Selected: \${item.label}');
  },
  onSignOut: () {
    print('Signed out');
  },
);''',
              props: _sideMenuProps,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(log, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildResponsiveSideMenuContainer(
                    context,
                    Ux4gSideMenuPresets.standard(
                      onItemSelected: (item) => setState(() => log = 'Selected: "${item.label}" (${item.key})'),
                      onSignOut: () => setState(() => log = 'Signed out'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 3. Officer Inbox Component ───────────────────────────────────────────────

final sideMenuOfficerInboxComponent = WidgetbookComponent(
  name: 'Officer Inbox',
  useCases: [
    WidgetbookUseCase(
      name: 'Inbox & Folders Workflow',
      builder: (context) {
        String log = 'Officer Inbox: Tap any mailbox folder';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Officer Inbox Preset',
              description:
                  'Tailored for government officers and enterprise mail workflows with user header profile, Mailbox count badges, Folders, Customize inbox action link, and bottom department branding.',
              code: '''Ux4gSideMenuPresets.officerInbox(
  name: 'Ramesh Kumar',
  email: 'ramesh.kumar@gov.in',
  division: 'Kanpur division',
  onItemSelected: (item) {
    print('Mailbox: \${item.label}');
  },
  onCustomizeInbox: () {},
  onSignOut: () {},
);''',
              props: _sideMenuProps,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(log, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildResponsiveSideMenuContainer(
                    context,
                    Ux4gSideMenuPresets.officerInbox(
                      name: 'Ramesh Kumar',
                      email: 'ramesh.kumar@gov.in',
                      division: 'Kanpur division',
                      onItemSelected: (item) => setState(() => log = 'Selected mailbox: "${item.label}"'),
                      onCustomizeInbox: () => setState(() => log = 'Customize inbox action tapped'),
                      onSignOut: () => setState(() => log = 'Signed out'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 4. Citizen Profile Menu Component ────────────────────────────────────────

final sideMenuCitizenProfileComponent = WidgetbookComponent(
  name: 'Citizen Profile',
  useCases: [
    WidgetbookUseCase(
      name: 'Prominent User Profile Header',
      builder: (context) {
        String log = 'Citizen Profile: Tap items or View Profile';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Citizen Profile Preset',
              description:
                  'Prominent centered user profile header displaying circular avatar initials, user name, Citizen role, status metadata text ("12 applications · 3 actions required"), and "View profile" button.',
              code: '''Ux4gSideMenuPresets.citizenProfile(
  name: 'Ramesh Kumar',
  role: 'Citizen',
  metaText: '12 applications · 3 actions required',
  onViewProfile: () {},
  onItemSelected: (item) {},
  onSignOut: () {},
);''',
              props: _sideMenuProps,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(log, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildResponsiveSideMenuContainer(
                    context,
                    Ux4gSideMenuPresets.citizenProfile(
                      name: 'Ramesh Kumar',
                      role: 'Citizen',
                      metaText: '12 applications · 3 actions required',
                      onViewProfile: () => setState(() => log = 'View profile button clicked'),
                      onItemSelected: (item) => setState(() => log = 'Selected item: "${item.label}"'),
                      onSignOut: () => setState(() => log = 'Signed out'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 5. Action Required Banner Component ──────────────────────────────────────

final sideMenuActionRequiredComponent = WidgetbookComponent(
  name: 'Action Required',
  useCases: [
    WidgetbookUseCase(
      name: 'Action Banner Callout',
      builder: (context) {
        String log = 'Action Required: Click "Verify now" or menu items';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Action Required Banner Preset',
              description:
                  'Embedded high-contrast action callout card ("Verify your Aadhaar - Complete identity verification to continue") with primary CTA button to highlight urgent citizen tasks.',
              code: '''Ux4gSideMenuPresets.actionRequired(
  title: 'Revenue Department',
  subtitle: 'Kanpur division',
  onVerifyAadhaar: () {
    print('Aadhaar verification initiated');
  },
  onItemSelected: (item) {},
);''',
              props: _sideMenuProps,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(log, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildResponsiveSideMenuContainer(
                    context,
                    Ux4gSideMenuPresets.actionRequired(
                      title: 'Revenue Department',
                      subtitle: 'Kanpur division',
                      onVerifyAadhaar: () => setState(() => log = 'Action Card: "Verify now" clicked!'),
                      onItemSelected: (item) => setState(() => log = 'Selected: "${item.label}"'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 6. Department Switcher Component ─────────────────────────────────────────

final sideMenuDepartmentSwitcherComponent = WidgetbookComponent(
  name: 'Department Switcher',
  useCases: [
    WidgetbookUseCase(
      name: 'Card Tiles & Department Switcher',
      builder: (context) {
        String selectedKey = 'dept-revenue';
        String log = 'Current department: Revenue Department';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Department Switcher Preset',
              description:
                  'Multi-department switcher using card tiles (`isCard: true`) with avatar initials ("RD", "TD", "PD"), active checkmark indicator, pending count tags, and "+ Request department access" CTA.',
              code: '''Ux4gSideMenuPresets.departmentSwitcher(
  title: 'Departments',
  subtitle: 'Choose a department to work in.',
  selectedDepartmentKey: selectedDepartmentKey,
  onSelectDepartment: (dept) {
    setState(() => selectedDepartmentKey = dept.key);
  },
  onRequestAccess: () {},
);''',
              props: _sideMenuProps,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(log, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  _buildResponsiveSideMenuContainer(
                    context,
                    Ux4gSideMenuPresets.departmentSwitcher(
                      title: 'Departments',
                      subtitle: 'Choose a department to work in.',
                      selectedDepartmentKey: selectedKey,
                      onSelectDepartment: (dept) {
                        setState(() {
                          selectedKey = dept.key;
                          log = 'Switched to department: "${dept.label}"';
                        });
                      },
                      onRequestAccess: () => setState(() => log = 'Request department access clicked'),
                      onSettings: () => setState(() => log = 'Settings clicked'),
                      onHelp: () => setState(() => log = 'Help & support clicked'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 7. Citizen Simple Navigation Component ───────────────────────────────────

final sideMenuCitizenSimpleComponent = WidgetbookComponent(
  name: 'Citizen Simple',
  useCases: [
    WidgetbookUseCase(
      name: 'Minimal Citizen Navigation',
      builder: (context) {
        String log = 'Simple Citizen: Tap any service';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Citizen Simple Navigation Preset',
              description:
                  'Streamlined, minimal citizen dashboard navigation with compact profile header, quick access links to applications, payments, and certificates.',
              code: '''Ux4gSideMenuPresets.citizenSimple(
  name: 'Ramesh Kumar',
  role: 'Citizen',
  onItemSelected: (item) {},
  onSignOut: () {},
);''',
              props: _sideMenuProps,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(log, style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 12),
                  _buildResponsiveSideMenuContainer(
                    context,
                    Ux4gSideMenuPresets.citizenSimple(
                      name: 'Ramesh Kumar',
                      role: 'Citizen',
                      onItemSelected: (item) => setState(() => log = 'Selected service: "${item.label}"'),
                      onSignOut: () => setState(() => log = 'Signed out'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ],
);

// ─── 8. Positions & Modal Drawers Component ───────────────────────────────────

final sideMenuPositionsComponent = WidgetbookComponent(
  name: 'Positions & Modals',
  useCases: [
    WidgetbookUseCase(
      name: 'Left & Right Slide-in Drawers',
      builder: (context) {
        String modalLog = 'Click any button below to launch an animated slide-in modal drawer';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Modal Side Menu Drawers',
              description:
                  'Interactive modal drawer overlays anchored to Left or Right screen edges with backdrop blur, smooth slide transition, and accessibility barrier dismiss.',
              code: '''// Launch Left Modal Drawer
Ux4gSideMenu.show(
  context,
  position: Ux4gSideMenuPosition.left,
  title: 'Revenue Department',
  subtitle: 'Government of India',
  onItemSelected: (item) => print(item.label),
);

// Launch Right Modal Drawer
Ux4gSideMenu.show(
  context,
  position: Ux4gSideMenuPosition.right,
  title: 'Department Settings',
  onItemSelected: (item) => print(item.label),
);''',
              props: _sideMenuProps,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F46E5).withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      modalLog,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4F46E5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 10,
                    children: [
                      FilledButton.icon(
                        onPressed: () {
                          Ux4gSideMenu.show(
                            context,
                            position: Ux4gSideMenuPosition.left,
                            title: 'Revenue Department',
                            subtitle: 'Government of India',
                            showSearch: true,
                            onItemSelected: (item) {
                              setState(() => modalLog = 'Left Drawer: Selected "${item.label}"');
                            },
                          );
                        },
                        icon: const Icon(Icons.dock_outlined, size: 16),
                        label: const Text('Open Left Drawer'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Ux4gSideMenu.show(
                            context,
                            position: Ux4gSideMenuPosition.right,
                            title: 'Officer Tools',
                            subtitle: 'Kanpur division',
                            showSearch: true,
                            onItemSelected: (item) {
                              setState(() => modalLog = 'Right Drawer: Selected "${item.label}"');
                            },
                          );
                        },
                        icon: const Icon(Icons.dock_outlined, size: 16),
                        label: const Text('Open Right Drawer'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  ],
);
