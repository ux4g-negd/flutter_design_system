import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral50 : Ux4gColors.neutral900;
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral200 : Ux4gColors.neutral700;
Color _getBorderColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral700 : Ux4gColors.neutral200;
Color _getScaffoldBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral950 : Ux4gColors.neutral50;
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral900 : Ux4gColors.neutral0;
Color _getHeaderBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral900 : Ux4gColors.neutral0;
const Color _primaryColor = Ux4gColors.primary600;
const Color _errorColor = Ux4gColors.red600;
const Color _greenColor = Ux4gColors.green600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;

final pendingTasksComponent = WidgetbookComponent(
  name: 'Pending Tasks',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Pending Tasks',
          description:
              'A task-oriented pattern showing pending actions the user needs to complete. '
              'Includes tab filters, expandable task cards with deadlines, and completed tasks section.',
          code: _pendingTasksCode,
          center: true,
          child: const _PendingTasksMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _pendingTasksCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PendingTasksScreen extends StatefulWidget {
  const PendingTasksScreen({super.key});

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  int _selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getScaffoldBg(context),
      body: SafeArea(
        child: Column(
          children: [
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
                SizedBox(width: 8),
                SvgPicture.asset(Ux4gIcons.union,  height: 32),
                SizedBox(width: 8),
                Text('Government of India', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
              ],
              actions: [
                Ux4gAppHeaderAction(icon: Icons.notifications_outlined, onPressed: () {}),
              ],
              showAvatar: true,
              avatarInitials: 'R',
            ),
            Divider(height: 1, color: Color(0xFFE5E7EB)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pending Tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                    SizedBox(height: 4),
                    Text('3 tasks need your attention', style: TextStyle(fontSize: 13, color: Color(0xFF4B5563))),
                    SizedBox(height: 16),
                    // Tab filters
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Ux4gChoiceChip(text: 'All', selected: _selectedTab == 0, onClick: () => setState(() => _selectedTab = 0), borderRadius: 4),
                        Ux4gChoiceChip(text: 'Pending', selected: _selectedTab == 1, onClick: () => setState(() => _selectedTab = 1), borderRadius: 4),
                        Ux4gChoiceChip(text: 'Under Review', selected: _selectedTab == 2, onClick: () => setState(() => _selectedTab = 2), borderRadius: 4),
                        Ux4gChoiceChip(text: 'Approved', selected: _selectedTab == 3, onClick: () => setState(() => _selectedTab = 3), borderRadius: 4),
                        Ux4gChoiceChip(text: 'Rejected', selected: _selectedTab == 4, onClick: () => setState(() => _selectedTab = 4), borderRadius: 4),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Task cards...
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
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _PendingTasksMockup extends StatefulWidget {
  const _PendingTasksMockup();

  @override
  State<_PendingTasksMockup> createState() => _PendingTasksMockupState();
}

class _PendingTasksMockupState extends State<_PendingTasksMockup> {
  int? _selectedTab;
  int get selectedTab => _selectedTab ?? 2;

  @override
  Widget build(BuildContext context) {
    final typography = Ux4gTheme.typography(context);
    return Scaffold(
      backgroundColor: _getScaffoldBg(context),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: _getHeaderBg(context),
              child: Column(
                children: [
                  Ux4gAppHeader(
                    variant: Ux4gAppHeaderVariant.light,
                    title: '',
                    horizontalPadding: 8,
                    leadingSpacing: 6,
                    actionSpacing: 0,
                    elevation: 2,
                    leadingWidgets: [
                      SvgPicture.asset(
                        _nationalEmblemLogoPath,
                        height: 28,
                        colorFilter: _isDark(context)
                            ? const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              )
                            : null,
                        errorBuilder: (c, e, s) => Icon(
                          Icons.account_balance,
                          size: 28,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                        child: Ux4gDivider(
                          orientation: Ux4gDividerOrientation.vertical,
                          color: _getBorderColor(context),
                        ),
                      ),
                      SvgPicture.asset(
                        _unionLogoPath,
                        height: 24,
                        errorBuilder: (c, e, s) =>
                            Icon(Icons.blur_on, size: 28, color: Colors.blue),
                      ),
                      Text(
                        'Government of India',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _getTitleColor(context),
                        ),
                      ),
                    ],
                    actions: [
                      Ux4gAppHeaderAction(
                        icon: Icons.notifications_outlined,
                        onPressed: () {},
                      ),
                    ],
                    showAvatar: true,
                    avatar: const Ux4gStatusAvatar(
                      size: Ux4gAvatarSize.s,
                      initials: 'R',
                      variant: Ux4gStatusVariant.online,
                    ),
                  ),
                  Divider(height: 1, color: _getBorderColor(context)),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      'Pending Tasks',
                      style: typography.hM_strong.copyWith(
                        color: _getTitleColor(context),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '3 tasks need your attention',
                      style: typography.bS_default.copyWith(
                        color: _getSubtleText(context),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Tab filters
                    _buildTabFilters(),
                    SizedBox(height: 20),

                    // Task Card 1 - Expanded
                    _buildExpandedTaskCard(
                      icon: Icons.upload_file_outlined,
                      title: 'Upload income proof',
                      subtitle: 'Income Certificate · INC-2026-MH-04127',
                      urgencyText: 'Overdue by 2 days',
                      urgencyColor: _errorColor,
                      deadline: '10 Apr 2026',
                      reference: 'INC-2026-MH-04127',
                      department: 'Revenue Department',
                      supportText: 'Contact support',
                      actionText: 'Upload now',
                    ),
                    SizedBox(height: 16),

                    // Task Card 2 - Collapsed
                    _buildCollapsedTaskCard(
                      icon: Icons.payment_outlined,
                      title: 'Pay application fee',
                      subtitle: 'Birth Certificate · ₹50 application fee',
                      urgencyText: 'Due in 5 days',
                      urgencyColor: const Color(0xFFAD4E00),
                      urgencyBgColor: Ux4gColors.orange100,
                      actionText: 'Pay now',
                      actionFilled: true,
                    ),
                    SizedBox(height: 16),

                    // Task Card 3 - Collapsed
                    _buildCollapsedTaskCard(
                      icon: Icons.calendar_today_outlined,
                      title: 'Schedule field inspection',
                      subtitle: 'Land Records Update · LRU-2026-MH-00231',
                      urgencyText: 'Due in 9 days',
                      urgencyColor: const Color(0xFF006D75),
                      urgencyBgColor: const Color(0xFFC9F7F2),
                      actionText: 'Schedule slot',
                      actionFilled: false,
                    ),
                    SizedBox(height: 16),

                    // Completed section
                    Text(
                      'Completed today',
                      style: typography.bM_strong.copyWith(
                        color: _getTitleColor(context),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Completed card
                    _buildCompletedTaskCard(
                      icon: Icons.verified_user_outlined,
                      title: 'Aadhaar e-KYC verification',
                      subtitle: 'Ration Card Renewal · RCR-2026-MH-00917',
                      actionText: 'View receipt',
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

  Widget _buildTabFilters() {
    final typography = Ux4gTheme.typography(context);
    final tabs = [
      {'label': 'All', 'count': '62'},
      {'label': 'Pending', 'count': '3'},
      {'label': 'Under Review', 'count': '12'},
      {'label': 'Approved', 'count': '41'},
      {'label': 'Rejected', 'count': '6'},
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(tabs.length, (index) {
        final isSelected = index == selectedTab;
        return InkWell(
          onTap: () => setState(() => _selectedTab = index),
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? Ux4gColors.primary600 : _getCardBg(context),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isSelected
                    ? Ux4gColors.primary600
                    : _getBorderColor(context),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tabs[index]['label']!,
                  style: typography.lM_default.copyWith(
                    color: isSelected
                        ? Ux4gColors.neutral0
                        : _getTitleColor(context),
                  ),
                ),
                SizedBox(width: 6),
                if (isSelected)
                  Text(
                    tabs[index]['count']!,
                    style: typography.lS_default.copyWith(
                      color: Ux4gColors.neutral0,
                      height: 1,
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: Ux4gColors.primary600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      tabs[index]['count']!,
                      style: typography.lS_default.copyWith(
                        color: Ux4gColors.neutral0,
                        height: 1,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildExpandedTaskCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String urgencyText,
    required Color urgencyColor,
    required String deadline,
    required String reference,
    required String department,
    required String supportText,
    required String actionText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _getCardBg(context),
        border: Border.all(color: _getBorderColor(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _isDark(context)
                        ? Ux4gColors.neutral800
                        : Ux4gColors.neutral100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(icon, size: 16, color: _getSubtleText(context)),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _getTitleColor(context),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: _getSubtleText(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_up,
                  size: 16,
                  color: _getSubtleText(context),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Urgency tag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: _isDark(context)
                    ? Ux4gColors.red950
                    : Ux4gColors.red100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                urgencyText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: urgencyColor,
                ),
              ),
            ),
            SizedBox(height: 8),
            Divider(color: _getBorderColor(context), height: 1),
            SizedBox(height: 12),

            // Details
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deadline',
                        style: TextStyle(
                          fontSize: 11,
                          color: _getSubtleText(context),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        deadline,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: _getTitleColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reference',
                        style: TextStyle(
                          fontSize: 11,
                          color: _getSubtleText(context),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        reference,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: _getTitleColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Department',
                        style: TextStyle(
                          fontSize: 11,
                          color: _getSubtleText(context),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        department,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: _getTitleColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Have issues?',
                        style: TextStyle(
                          fontSize: 11,
                          color: _getSubtleText(context),
                        ),
                      ),
                      SizedBox(height: 2),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              supportText,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: _primaryColor,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: _primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Action button
            SizedBox(
              width: double.infinity,
              child: Ux4gButton(
                text: actionText,
                onPressed: () {},
                variant: Ux4gButtonVariant.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsedTaskCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String urgencyText,
    required Color urgencyColor,
    Color? urgencyBgColor,
    required String actionText,
    required bool actionFilled,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _getCardBg(context),
        border: Border.all(color: _getBorderColor(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _isDark(context)
                        ? Ux4gColors.neutral800
                        : Ux4gColors.neutral100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(icon, size: 16, color: _getSubtleText(context)),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _getTitleColor(context),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: _getSubtleText(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: _getSubtleText(context),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: urgencyBgColor ?? urgencyColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                urgencyText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: urgencyColor,
                ),
              ),
            ),
            SizedBox(height: 12),

            // Action button
            SizedBox(
              width: double.infinity,
              child: Ux4gButton(
                text: actionText,
                onPressed: () {},
                variant: actionFilled
                    ? Ux4gButtonVariant.primary
                    : Ux4gButtonVariant.outline,
                contentColor: actionFilled ? null : _primaryColor,
                borderColor: actionFilled
                    ? null
                    : (_isDark(context)
                          ? Ux4gColors.primary400
                          : Ux4gColors.primary300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedTaskCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String actionText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _getCardBg(context),
        border: Border.all(color: _getBorderColor(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: _isDark(context)
                        ? Ux4gColors.neutral800
                        : Ux4gColors.neutral100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(icon, size: 16, color: _getSubtleText(context)),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: _getTitleColor(context),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: _getSubtleText(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: _getSubtleText(context),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Completed tag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: _isDark(context)
                    ? Ux4gColors.green950
                    : Ux4gColors.green100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Completed',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: _greenColor,
                ),
              ),
            ),
            SizedBox(height: 12),

            // View receipt link
            Center(
              child: Text(
                actionText,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: _primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
