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

Color _getHeaderBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral900 : Ux4gColors.neutral0;
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral900 : Ux4gColors.neutral0;
const Color _primaryColor = Ux4gColors.primary600;
const Color _errorColor = Ux4gColors.red600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;

final searchApplicationsComponent = WidgetbookComponent(
  name: 'Search Applications',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Search Applications',
          description:
              'A search pattern for finding applications by reference number or service name. '
              'Shows search input, result count, and application cards with expanded details.',
          code: _searchApplicationsCode,
          center: true,
          child: const _SearchApplicationsMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _searchApplicationsCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchApplicationsScreen extends StatefulWidget {
  const SearchApplicationsScreen({super.key});

  @override
  State<SearchApplicationsScreen> createState() => _SearchApplicationsScreenState();
}

class _SearchApplicationsScreenState extends State<SearchApplicationsScreen> {
  int _selectedTab = 2;
  final TextEditingController _searchController = TextEditingController(text: 'income');

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 40),
                SizedBox(width: 8),
                SvgPicture.asset(Ux4gIcons.union, height: 32),
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
                      style: Ux4gTypography.headingMd.copyWith(color: Ux4gColors.neutral900),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Find an application by reference or service name',
                      style: Ux4gTypography.bodySmall.copyWith(color: Ux4gColors.neutral600),
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
                          child: _StatCard(value: '1', label: 'Needs attention', showDot: true, dotColor: Ux4gColors.error500),
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
                      style: Ux4gTypography.headingSm.copyWith(color: Ux4gColors.neutral900),
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

                    // Search field
                    _buildSearchField(),
                    SizedBox(height: 16),

                    // Result count
                    Text(
                      '2 results for "income"',
                      style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                    ),
                    SizedBox(height: 16),

                    // Result Card 1 - Expanded
                    _buildExpandedResultCard(),
                    SizedBox(height: 16),

                    // Result Card 2 - Collapsed
                    _buildCollapsedResultCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _countBadge(String count, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: isSelected ? Colors.transparent : Ux4gColors.primary600,
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

  Widget _buildSearchField() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              border: Border.all(
                color: Color(0xFFE5E7EB),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF111827),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search for...',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9CA3AF),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _searchController.clear();
                  },
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: Color(0xFF374151),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ),
        Container(
          width: 44,
          height: 42,
          decoration: const BoxDecoration(
            color: Ux4gColors.primary600,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedResultCard() {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: Color(0xFFE5E7EB),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Income Certificate',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ux4gButton(
                      text: 'Track',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      borderColor: Color(0xFFD1D5DB),
                      contentColor: Color(0xFF111827),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF6B7280)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Ux4gUnifiedPillTag(
              segments: [
                Ux4gPillSegment(
                  text: '8 days left',
                  textColor: const Color(0xFF1F2937),
                  leading: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFFD97706),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(
                  text: 'Under review',
                  textColor: Color(0xFFD97706),
                ),
              ],
              borderColor: const Color(0xFFD1D5DB),
            ),
            SizedBox(height: 16),
            _detailRow('Reference Number', 'INC-2026-MH-04127', 'Last Updated Date', '10 Apr 2026'),
            SizedBox(height: 12),
            _detailRow('Submitted Date', '1 Apr 2026', 'Assigned Officer', 'Rahul Sharma'),
            SizedBox(height: 12),
            _detailRow('Department', 'Revenue Department', 'Documents', 'ID Proof, Address\nProof'),
            SizedBox(height: 16),
            Text(
              'Action needed',
              style: TextStyle(fontSize: 11, color: Color(0xFFD97706)),
            ),
            SizedBox(height: 4),
            Ux4gButton(
              text: 'Upload document',
              onPressed: () {},
              variant: Ux4gButtonVariant.ghost,
              size: Ux4gButtonSize.small,
              padding: EdgeInsets.zero,
              contentColor: Ux4gColors.primary600,
              trailingIcon: Icons.file_upload_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsedResultCard() {
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: Color(0xFFE5E7EB),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Income Certificate',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ux4gButton(
                      text: 'Track',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      borderColor: Color(0xFFD1D5DB),
                      contentColor: Color(0xFF111827),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF6B7280)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Ux4gUnifiedPillTag(
              segments: [
                Ux4gPillSegment(
                  text: '8 days left',
                  textColor: const Color(0xFF1F2937),
                  leading: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFFD97706),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(
                  text: 'Under review',
                  textColor: Color(0xFFD97706),
                ),
              ],
              borderColor: const Color(0xFFD1D5DB),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label1, String value1, String label2, String value2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1, style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
              SizedBox(height: 2),
              Text(value1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF111827))),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label2, style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
              SizedBox(height: 2),
              Text(value2, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF111827))),
            ],
          ),
        ),
      ],
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
        border: Border.all(color: Ux4gColors.neutral200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(value, style: Ux4gTypography.headingMd.copyWith(color: Ux4gColors.neutral900)),
              if (showDot) ...[
                SizedBox(width: 6),
                Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: dotColor)),
              ],
            ],
          ),
          SizedBox(height: 4),
          Text(label, style: Ux4gTypography.bodyXs.copyWith(color: Ux4gColors.neutral500)),
        ],
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _SearchApplicationsMockup extends StatefulWidget {
  const _SearchApplicationsMockup();

  @override
  State<_SearchApplicationsMockup> createState() =>
      _SearchApplicationsMockupState();
}

class _SearchApplicationsMockupState extends State<_SearchApplicationsMockup> {
  int? _selectedTab;
  int get selectedTab => _selectedTab ?? 2;
  TextEditingController? _searchController;
  TextEditingController get searchController =>
      _searchController ??= TextEditingController(text: 'income');

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }

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
                      'Find an application by reference or service name',
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

                    // Search field
                    _buildSearchField(),
                    SizedBox(height: 16),

                    // Result count
                    Text(
                      '2 results for "income"',
                      style: TextStyle(
                        fontSize: 13,
                        color: _getSubtleText(context),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Result Card 1 - Expanded
                    _buildExpandedResultCard(),
                    SizedBox(height: 16),

                    // Result Card 2 - Collapsed
                    _buildCollapsedResultCard(),
                  ],
                ),
              ),
            ),
          ],
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

  Widget _buildSearchField() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              color: _getCardBg(context),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              border: Border.all(
                color: _getBorderColor(context),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(
                      fontSize: 14,
                      color: _getTitleColor(context),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search for...',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: _getSubtleText(context),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    searchController.clear();
                  },
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: _getTitleColor(context),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
        ),
        Container(
          width: 44,
          height: 42,
          decoration: const BoxDecoration(
            color: _primaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
              onTap: () {},
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedResultCard() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Income Certificate',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _getTitleColor(context),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ux4gButton(
                      text: 'Track',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      borderColor: isDark
                          ? Ux4gColors.neutral600
                          : Ux4gColors.neutral300,
                      contentColor: isDark
                          ? Ux4gColors.neutral50
                          : Ux4gColors.neutral900,
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

            // Status pill
            Ux4gUnifiedPillTag(
              segments: [
                Ux4gPillSegment(
                  text: '8 days left',
                  textColor: _getTitleColor(context),
                  leading: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Ux4gColors.orange300
                          : Ux4gColors.orange500,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(
                  text: 'Under review',
                  textColor: isDark
                      ? Ux4gColors.orange300
                      : Ux4gColors.orange600,
                ),
              ],
              borderColor: _getBorderColor(context),
            ),
            SizedBox(height: 16),

            // Details grid
            _detailRow(
              'Reference Number',
              'INC-2026-MH-04127',
              'Last Updated Date',
              '10 Apr 2026',
            ),
            SizedBox(height: 12),
            _detailRow(
              'Submitted Date',
              '1 Apr 2026',
              'Assigned Officer',
              'Rahul Sharma',
            ),
            SizedBox(height: 12),
            _detailRow(
              'Department',
              'Revenue Department',
              'Documents',
              'ID Proof, Address\nProof',
            ),

            SizedBox(height: 16),
            Text(
              'Action needed',
              style: TextStyle(
                fontSize: 11,
                color: isDark
                    ? Ux4gColors.orange300
                    : Ux4gColors.orange600,
              ),
            ),
            SizedBox(height: 4),
            Ux4gButton(
              text: 'Upload document',
              onPressed: () {},
              variant: Ux4gButtonVariant.ghost,
              size: Ux4gButtonSize.small,
              padding: EdgeInsets.zero,
              contentColor: _primaryColor,
              trailingIcon: Icons.file_upload_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsedResultCard() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
      backgroundColor: _getCardBg(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Income Certificate',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: _getTitleColor(context),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ux4gButton(
                      text: 'Track',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      borderColor: isDark
                          ? Ux4gColors.neutral600
                          : Ux4gColors.neutral300,
                      contentColor: isDark
                          ? Ux4gColors.neutral50
                          : Ux4gColors.neutral900,
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
                  text: '8 days left',
                  textColor: _getTitleColor(context),
                  leading: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Ux4gColors.orange300
                          : Ux4gColors.orange500,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(
                  text: 'Under review',
                  textColor: isDark
                      ? Ux4gColors.orange300
                      : Ux4gColors.orange600,
                ),
              ],
              borderColor: _getBorderColor(context),
            ),
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
