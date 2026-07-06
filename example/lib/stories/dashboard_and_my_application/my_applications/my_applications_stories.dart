import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700;
Color _getBorderColor(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200;
Color _getScaffoldBg(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral950 : Ux4gPalette.neutral50;
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0;
Color _getHeaderBg(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0;
const Color _primaryColor = Ux4gPalette.primary600;
const Color _errorColor = Ux4gPalette.red600;
const Color _greenColor = Ux4gPalette.green600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;

final myApplicationsComponent = WidgetbookComponent(
  name: 'My Applications',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'My Applications',
          description:
              'A dashboard pattern showing an overview of user applications with '
              'summary stats, tab filters, and detailed application cards with tracking.',
          code: _myApplicationsCode,
          center: true,
          child: const _MyApplicationsMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _myApplicationsCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyApplicationsScreen extends StatefulWidget {
  const MyApplicationsScreen({super.key});

  @override
  State<MyApplicationsScreen> createState() => _MyApplicationsScreenState();
}

class _MyApplicationsScreenState extends State<MyApplicationsScreen> {
  int _selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getScaffoldBg(context),
      body: SafeArea(
        child: Column(
          children: [
            // Header
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

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting
                    Text(
                      'Good morning, Ramesh',
                      style: Ux4gTypography.headingMd.copyWith(color: Ux4gPalette.neutral900),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'An overview of your applications',
                      style: Ux4gTypography.bodySmall.copyWith(color: Ux4gPalette.neutral600),
                    ),
                    SizedBox(height: 20),

                    // Stats grid
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(value: '2', label: 'Active'),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(value: '1', label: 'Needs attention', showDot: true, dotColor: Ux4gPalette.error500),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(value: '5', label: 'Completed'),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(value: '8', label: 'Total'),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Your applications title
                    Text(
                      'Your applications',
                      style: Ux4gTypography.headingSm.copyWith(color: Ux4gPalette.neutral900),
                    ),
                    SizedBox(height: 16),

                    // Tab filters using Ux4gChoiceChip with trailingContent
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Ux4gChoiceChip(text: 'All', selected: _selectedTab == 0, onClick: () => setState(() => _selectedTab = 0), borderRadius: 4, trailingContent: _countBadge('62', _selectedTab == 0)),
                        Ux4gChoiceChip(text: 'Pending', selected: _selectedTab == 1, onClick: () => setState(() => _selectedTab = 1), borderRadius: 4, trailingContent: _countBadge('3', _selectedTab == 1)),
                        Ux4gChoiceChip(text: 'Under Review', selected: _selectedTab == 2, onClick: () => setState(() => _selectedTab = 2), borderRadius: 4, trailingContent: _countBadge('12', _selectedTab == 2)),
                        Ux4gChoiceChip(text: 'Approved', selected: _selectedTab == 3, onClick: () => setState(() => _selectedTab = 3), borderRadius: 4, trailingContent: _countBadge('41', _selectedTab == 3)),
                        Ux4gChoiceChip(text: 'Rejected', selected: _selectedTab == 4, onClick: () => setState(() => _selectedTab = 4), borderRadius: 4, trailingContent: _countBadge('6', _selectedTab == 4)),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Application Card 1 - Escalation available
                    Ux4gResultRow(
                      title: 'Income Certificate',
                      actionButtonText: 'Track',
                      initialExpanded: true,
                      detailsColumns: 2,
                      details: const [
                        Ux4gResultDetail(label: 'Reference Number', value: 'PMS-2026-MH-02231'),
                        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
                        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
                        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
                        Ux4gResultDetail(label: 'Department', value: 'Social Welfare Department'),
                        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
                      ],
                      metadataSegments: [
                        Ux4gPillSegment(
                          text: '2 days overdue',
                          textColor: Color(0xFF1F2937),
                          leading: Container(width: 8, height: 8, decoration: BoxDecoration(color: Color(0xFFDC2626), shape: BoxShape.circle)),
                        ),
                        Ux4gPillSegment(
                          text: 'Escalation available',
                          textColor: Color(0xFFDC2626),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Application Card 2 - Action needed
                    Ux4gResultRow(
                      title: 'Income Certificate',
                      actionButtonText: 'Track',
                      initialExpanded: true,
                      detailsColumns: 2,
                      details: const [
                        Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04127'),
                        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
                        Ux4gResultDetail(label: 'Submitted Date', value: '1 Apr 2026'),
                        Ux4gResultDetail(label: 'Assigned Officer', value: 'Rahul Sharma'),
                        Ux4gResultDetail(label: 'Department', value: 'Revenue Department'),
                        Ux4gResultDetail(label: 'Documents', value: 'ID Proof, Address Proof'),
                      ],
                      metadataSegments: [
                        Ux4gPillSegment(
                          text: '4 days left',
                          textColor: Color(0xFFF59E0B),
                          leading: Container(width: 8, height: 8, decoration: BoxDecoration(color: Color(0xFFF59E0B), shape: BoxShape.circle)),
                        ),
                        Ux4gPillSegment(
                          text: 'Action needed',
                          textColor: Color(0xFFF59E0B),
                          bold: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Application Card 3 - Under review (compact)
                    Ux4gResultRow(
                      title: 'Income Certificate',
                      actionButtonText: 'Track',
                      initialExpanded: false,
                      details: const [
                        Ux4gResultDetail(label: 'Reference Number', value: 'INC-2026-MH-04128'),
                        Ux4gResultDetail(label: 'Last Updated Date', value: '10 Apr 2026'),
                      ],
                      metadataSegments: [
                        Ux4gPillSegment(
                          text: '8 days left',
                          textColor: Color(0xFF1F2937),
                          leading: Container(width: 8, height: 8, decoration: BoxDecoration(color: Color(0xFFF59E0B), shape: BoxShape.circle)),
                        ),
                        Ux4gPillSegment(
                          text: 'Under review',
                          textColor: Color(0xFF1F2937),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Application Card 4 - Birth Certificate (completed)
                    Ux4gResultRow(
                      title: 'Birth Certificate',
                      statusTag: 'Completed',
                      tagColorScheme: Ux4gTagColor.success,
                      actionButtonText: 'Download',
                      actionButtonIcon: Icons.file_download_outlined,
                      initialExpanded: false,
                      details: const [
                        Ux4gResultDetail(label: 'Issued', value: '05 Apr 2026'),
                        Ux4gResultDetail(label: 'Valid till', value: '05 Apr 2027'),
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

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final bool showDot;
  final Color? dotColor;
  const _StatCard({required this.value, required this.label, this.showDot = false, this.dotColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Ux4gPalette.neutral200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(value, style: Ux4gTypography.headingMd.copyWith(color: Ux4gPalette.neutral900)),
              if (showDot) ...[
                SizedBox(width: 6),
                Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor)),
              ],
            ],
          ),
          SizedBox(height: 4),
          Text(label, style: Ux4gTypography.bodyXs.copyWith(color: Ux4gPalette.neutral500)),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final String count;
  final bool isSelected;
  final VoidCallback onTap;
  const _FilterChip({required this.label, required this.count, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Ux4gPalette.primary600 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? Ux4gPalette.primary600 : Ux4gPalette.neutral200),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: isSelected ? Colors.white : Ux4gPalette.neutral900)),
            SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withValues(alpha: 0.2) : Ux4gPalette.neutral100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(count, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isSelected ? Colors.white : Ux4gPalette.neutral600)),
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

class _MyApplicationsMockup extends StatefulWidget {
  const _MyApplicationsMockup();

  @override
  State<_MyApplicationsMockup> createState() => _MyApplicationsMockupState();
}

class _MyApplicationsMockupState extends State<_MyApplicationsMockup> {
  int _selectedTab = 2; // Under Review selected by default

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
                    // Greeting
                    Text(
                      'Good morning, Ramesh',
                      style: typography.hM_strong.copyWith(
                        color: _getTitleColor(context),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'An overview of your applications',
                      style: typography.bS_default.copyWith(
                        color: _getSubtleText(context),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Stats grid
                    _buildStatsGrid(),
                    SizedBox(height: 24),

                    // Your applications
                    Text(
                      'Your applications',
                      style: typography.hXS_strong.copyWith(
                        color: _getTitleColor(context),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Tab filters
                    _buildTabFilters(),
                    SizedBox(height: 20),

                    // Application cards
                    _buildApplicationCard(
                      title: 'Income Certificate',
                      statusText: '2 days overdue',
                      statusColor: _isDark(context)
                          ? Ux4gPalette.red300
                          : Ux4gPalette.red600,
                      badgeText: 'Escalation available',
                      badgeColor: _isDark(context)
                          ? Ux4gPalette.red300
                          : Ux4gPalette.red800,
                      referenceNumber: 'PMS-2026-MH-02231',
                      lastUpdated: '10 Apr 2026',
                      submittedDate: '1 Apr 2026',
                      assignedOfficer: 'Rahul Sharma',
                      department: 'Social Welfare\nDepartment',
                      documents: 'ID Proof, Address\nProof',
                      escalation: 'Register grievance',
                    ),
                    SizedBox(height: 16),

                    _buildApplicationCard(
                      title: 'Income Certificate',
                      statusText: '4 days left',
                      statusColor: _isDark(context)
                          ? Ux4gPalette.red300
                          : Ux4gPalette.red600,
                      badgeText: 'Action needed',
                      badgeColor: _isDark(context)
                          ? Ux4gPalette.red300
                          : Ux4gPalette.red800,
                      referenceNumber: 'INC-2026-MH-04127',
                      lastUpdated: '10 Apr 2026',
                      submittedDate: '1 Apr 2026',
                      assignedOfficer: 'Rahul Sharma',
                      department: 'Revenue Department',
                      documents: 'ID Proof, Address\nProof',
                      actionText: 'Upload document',
                      actionIcon: Icons.file_upload_outlined,
                    ),
                    SizedBox(height: 16),

                    _buildApplicationCardCompact(
                      title: 'Income Certificate',
                      statusText: '8 days left',
                      statusColor: _isDark(context)
                          ? Ux4gPalette.secondary300
                          : Ux4gPalette.secondary600,
                      badgeText: 'Under review',
                      badgeColor: _isDark(context)
                          ? Ux4gPalette.orange300
                          : Ux4gPalette.orange800,
                    ),
                    SizedBox(height: 16),

                    _buildApplicationCardMinimal(
                      title: 'Birth Certificate',
                      hasDownload: true,
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

  // ignore: unused_element
  Widget _countBadge(String count, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.white.withValues(alpha: 0.25)
            : _primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        count,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(value: '2', label: 'Active'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                value: '1',
                label: 'Needs attention',
                dot: true,
                dotColor: _errorColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatCard(value: '5', label: 'Completed'),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _StatCard(value: '8', label: 'Total'),
            ),
          ],
        ),
      ],
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
        final isSelected = index == _selectedTab;
        return InkWell(
          onTap: () => setState(() => _selectedTab = index),
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? Ux4gPalette.primary600 : _getCardBg(context),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isSelected
                    ? Ux4gPalette.primary600
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
                        ? Ux4gPalette.neutral0
                        : _getTitleColor(context),
                  ),
                ),
                SizedBox(width: 6),
                if (isSelected)
                  Text(
                    tabs[index]['count']!,
                    style: typography.lS_default.copyWith(
                      color: Ux4gPalette.neutral0,
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
                      color: Ux4gPalette.primary600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      tabs[index]['count']!,
                      style: typography.lS_default.copyWith(
                        color: Ux4gPalette.neutral0,
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

  Widget _buildApplicationCard({
    required String title,
    required String statusText,
    required Color statusColor,
    required String badgeText,
    required Color badgeColor,
    required String referenceNumber,
    required String lastUpdated,
    required String submittedDate,
    required String assignedOfficer,
    required String department,
    required String documents,
    String? escalation,
    String? actionText,
    IconData? actionIcon,
  }) {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row with Track button
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _getTitleColor(context),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  children: [
                    Ux4gButton(
                      text: 'Track',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      borderColor: _isDark(context)
                          ? Ux4gPalette.neutral600
                          : Ux4gPalette.neutral300,
                      contentColor: _isDark(context)
                          ? Ux4gPalette.neutral50
                          : Ux4gPalette.neutral900,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: _getSubtleText(context),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),

            // Status row
            Ux4gUnifiedPillTag(
              segments: [
                Ux4gPillSegment(
                  text: statusText,
                  textColor: _getTitleColor(context),
                  leading: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(text: badgeText, textColor: badgeColor),
              ],
              borderColor: _getBorderColor(context),
            ),
            SizedBox(height: 16),

            // Details grid
            _detailRow(
              'Reference Number',
              referenceNumber,
              'Last Updated Date',
              lastUpdated,
            ),
            SizedBox(height: 12),
            _detailRow(
              'Submitted Date',
              submittedDate,
              'Assigned Officer',
              assignedOfficer,
            ),
            SizedBox(height: 12),
            _detailRow('Department', department, 'Documents', documents),

            // Escalation or Action
            if (escalation != null) ...[
              SizedBox(height: 16),
              Text(
                'Escalation',
                style: TextStyle(fontSize: 11, color: _errorColor),
              ),
              SizedBox(height: 4),
              Ux4gButton(
                text: 'Register grievance',
                onPressed: () {},
                padding: EdgeInsets.zero,
                variant: Ux4gButtonVariant.ghost,
                size: Ux4gButtonSize.small,
                contentColor: _primaryColor,
                trailingIcon: Icons.arrow_forward,
              ),
            ],

            if (actionText != null) ...[
              SizedBox(height: 16),
              Text(
                'Action needed',
                style: TextStyle(fontSize: 11, color: _errorColor),
              ),
              SizedBox(height: 4),
              Ux4gButton(
                text: actionText,
                onPressed: () {},
                variant: Ux4gButtonVariant.ghost,
                size: Ux4gButtonSize.small,
                padding: EdgeInsets.zero,
                contentColor: _primaryColor,
                trailingIcon: actionIcon ?? Icons.arrow_forward,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _detailRow(
    String label1,
    String value1,
    String label2,
    String value2,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label1,
                style: TextStyle(fontSize: 11, color: _getSubtleText(context)),
              ),
              SizedBox(height: 2),
              Text(
                value1,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: _getTitleColor(context),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label2,
                style: TextStyle(fontSize: 11, color: _getSubtleText(context)),
              ),
              SizedBox(height: 2),
              Text(
                value2,
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
    );
  }

  Widget _buildApplicationCardCompact({
    required String title,
    required String statusText,
    required Color statusColor,
    required String badgeText,
    required Color badgeColor,
  }) {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _getTitleColor(context),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  children: [
                    Ux4gButton(
                      text: 'Track',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      borderColor: _isDark(context)
                          ? Ux4gPalette.neutral600
                          : Ux4gPalette.neutral300,
                      contentColor: _isDark(context)
                          ? Ux4gPalette.neutral50
                          : Ux4gPalette.neutral900,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: _getSubtleText(context),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Ux4gUnifiedPillTag(
              segments: [
                Ux4gPillSegment(
                  text: statusText,
                  textColor: _getTitleColor(context),
                  leading: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(text: badgeText, textColor: badgeColor),
              ],
              borderColor: _getBorderColor(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationCardMinimal({
    required String title,
    bool hasDownload = false,
  }) {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      borderWidth: 1,
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _getTitleColor(context),
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.check_circle, size: 12, color: _greenColor),
                ],
              ),
              SizedBox(width: 12),
              Ux4gButton(
                text: 'Download',
                onPressed: () {},
                variant: Ux4gButtonVariant.outline,
                size: Ux4gButtonSize.small,
                borderColor: _isDark(context)
                    ? Ux4gPalette.neutral600
                    : Ux4gPalette.neutral300,
                contentColor: _isDark(context)
                    ? Ux4gPalette.neutral50
                    : Ux4gPalette.neutral900,
                leadingIcon: Icons.file_download_outlined,
              ),
              SizedBox(width: 8),
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: _getSubtleText(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ───────────────────────────────────────────────────────────────────────
// Stat Card
// ───────────────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final bool dot;
  final Color? dotColor;

  const _StatCard({
    required this.value,
    required this.label,
    this.dot = false,
    this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    final typography = Ux4gTheme.typography(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _getCardBg(context),
        border: Border.all(color: _getBorderColor(context)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                value,
                style: typography.hS_strong.copyWith(
                  color: _getTitleColor(context),
                ),
              ),
              if (dot) ...[
                SizedBox(width: 6),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dotColor ?? _errorColor,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: typography.bS_default.copyWith(
              color: _getSubtleText(context),
            ),
          ),
        ],
      ),
    );
  }
}
