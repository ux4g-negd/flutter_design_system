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

Color _getHeaderBg(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral900 : Ux4gPalette.neutral0;
const Color _primaryColor = Ux4gPalette.primary600;
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

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900;
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700;
Color _getBorderColor(BuildContext context) =>
    _isDark(context) ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200;
Color _getScaffoldBg(BuildContext context) =>
    _isDark(context) ? const Color(0xFF111827) : const Color(0xFFF9FAFB);

class SearchApplicationsScreen extends StatefulWidget {
  const SearchApplicationsScreen({super.key});

  @override
  State<SearchApplicationsScreen> createState() => _SearchApplicationsScreenState();
}

class _SearchApplicationsScreenState extends State<SearchApplicationsScreen> {
  String _searchValue = 'income';

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).extension<Ux4gTypography>()!;
    return Scaffold(
      backgroundColor: _getScaffoldBg(context),
      body: SafeArea(
        child: Column(
          children: [
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good morning, Ramesh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: _getTitleColor(context))),
                    SizedBox(height: 4),
                    Text('Find an application by reference or service name', style: typography.bS_default.copyWith(color: _getSubtleText(context))),
                    SizedBox(height: 16),
                    // Search bar
                    Ux4gSearchField(
                      value: _searchValue,
                      onValueChange: (v) => setState(() => _searchValue = v),
                      variant: Ux4gSearchFieldVariant.searchWithSubmit,
                      size: Ux4gSearchFieldSize.large,
                      placeholder: 'Search...',
                      showVoiceIcon: false,
                      showClearIcon: true,
                      onSubmitClick: (_) {},
                      buttonStyle: Ux4gSearchFieldButtonStyle.filled,
                    ),
                    SizedBox(height: 16),
                    Text('2 results for "income"', style: TextStyle(fontSize: 13, color: _getSubtleText(context))),
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

  Widget _buildExpandedResultCard() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
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
                      borderColor: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300,
                      contentColor: isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_up, size: 20, color: _getSubtleText(context)),
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
                      color: isDark ? Ux4gPalette.secondary300 : Ux4gPalette.secondary600,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(
                  text: 'Under review',
                  textColor: isDark ? Ux4gPalette.orange300 : Ux4gPalette.orange600,
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
              style: TextStyle(fontSize: 11, color: isDark ? Ux4gPalette.secondary600 : Ux4gPalette.secondary300),
            ),
            SizedBox(height: 4),
            Ux4gButton(
              text: 'Upload document',
              onPressed: () {},
              variant: Ux4gButtonVariant.ghost,
              size: Ux4gButtonSize.small,
              padding: EdgeInsets.zero,
              contentColor: Ux4gPalette.primary600,
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
                      borderColor: isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300,
                      contentColor: isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_down, size: 20, color: _getSubtleText(context)),
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
                      color: isDark ? Ux4gPalette.secondary300 : Ux4gPalette.secondary600,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(
                  text: 'Under review',
                  textColor: isDark ? Ux4gPalette.orange300 : Ux4gPalette.orange600,
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
              Text(label1, style: TextStyle(fontSize: 11, color: _getSubtleText(context))),
              SizedBox(height: 2),
              Text(value1, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _getTitleColor(context))),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label2, style: TextStyle(fontSize: 11, color: _getSubtleText(context))),
              SizedBox(height: 2),
              Text(value2, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: _getTitleColor(context))),
            ],
          ),
        ),
      ],
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
  String _searchValue = 'income';

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
                    SizedBox(height: 16),

                    // Search bar
                    Ux4gSearchField(
                      value: _searchValue,
                      onValueChange: (v) => setState(() => _searchValue = v),
                      variant: Ux4gSearchFieldVariant.searchWithSubmit,
                      size: Ux4gSearchFieldSize.large,
                      placeholder: 'Search...',
                      showVoiceIcon: false,
                      showClearIcon: true,
                      onSubmitClick: (_) {},
                      buttonStyle: Ux4gSearchFieldButtonStyle.filled,
                    ),
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

  Widget _buildExpandedResultCard() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Ux4gCard(
      cornerRadius: 12,
      borderColor: _getBorderColor(context),
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
                          ? Ux4gPalette.neutral600
                          : Ux4gPalette.neutral300,
                      contentColor: isDark
                          ? Ux4gPalette.neutral50
                          : Ux4gPalette.neutral900,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.keyboard_arrow_up,
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
                  textColor: const Color(0xFF1F2937),
                  leading: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Ux4gPalette.secondary300
                          : Ux4gPalette.secondary600,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(
                  text: 'Under review',
                  textColor: isDark
                      ? Ux4gPalette.orange300
                      : Ux4gPalette.orange600,
                ),
              ],
              borderColor: const Color(0xFFD1D5DB),
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
                    ? Ux4gPalette.secondary600
                    : Ux4gPalette.secondary300,
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
                          ? Ux4gPalette.neutral600
                          : Ux4gPalette.neutral300,
                      contentColor: isDark
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
                  text: '8 days left',
                  textColor: const Color(0xFF1F2937),
                  leading: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Ux4gPalette.secondary300
                          : Ux4gPalette.secondary600,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Ux4gPillSegment(
                  text: 'Under review',
                  textColor: isDark
                      ? Ux4gPalette.orange300
                      : Ux4gPalette.orange600,
                ),
              ],
              borderColor: const Color(0xFFD1D5DB),
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
