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
const Color _orangeColor = Ux4gColors.secondary600;
const Color _greenColor = Ux4gColors.green600;

const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;

final bulkActionsComponent = WidgetbookComponent(
  name: 'Bulk Actions',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'Bulk Actions',
          description:
              'A multi-select pattern allowing users to select multiple applications '
              'for bulk actions like downloading or tracking together.',
          code: _bulkActionsCode,
          center: true,
          child: const _BulkActionsMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _bulkActionsCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BulkActionsScreen extends StatefulWidget {
  const BulkActionsScreen({super.key});

  @override
  State<BulkActionsScreen> createState() => _BulkActionsScreenState();
}

class _BulkActionsScreenState extends State<BulkActionsScreen> {
  final Set<int> _selected = {0, 1, 2};

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
                Text(
                  'Government of India',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF111827),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Select applications to download or track together',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Stats grid
                    _buildStatsGrid(),
                    SizedBox(height: 24),

                    // Your applications heading
                    Text(
                      'Your applications',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Bulk action bar
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F0FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${_selected.length} selected',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => setState(() => _selected.clear()),
                                child: Text(
                                  'Clear filters',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF432CBB),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Ux4gButton(
                                  text: 'Download all',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.outline,
                                  height: 42,
                                  borderRadius: 8,
                                  borderColor: Color(0xFFB4A5F5),
                                  contentColor: Color(0xFF432CBB),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Ux4gButton(
                                  text: 'Track together',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.primary,
                                  height: 42,
                                  borderRadius: 8,
                                  backgroundColor: Color(0xFF432CBB),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Application list items
                    _buildSelectableCard(
                      index: 0,
                      title: 'Income Certificate',
                      statusText: '2 days overdue',
                      statusColor: Color(0xFFDC2626),
                      badgeText: 'Escalation available',
                      badgeColor: Color(0xFF991B1B),
                      actionText: 'Track',
                    ),
                    _buildSelectableCard(
                      index: 1,
                      title: 'Income Certificate',
                      statusText: '4 days left',
                      statusColor: Color(0xFFDC2626),
                      badgeText: 'Action needed',
                      badgeColor: Color(0xFF991B1B),
                      actionText: 'Track',
                    ),
                    _buildSelectableCard(
                      index: 2,
                      title: 'Income Certificate',
                      statusText: '8 days left',
                      statusColor: Color(0xFFD97706),
                      badgeText: 'Under review',
                      badgeColor: Color(0xFFB45309),
                      actionText: 'Track',
                    ),
                    _buildCompletedCard(
                      index: 3,
                      title: 'Birth\nCertificate',
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

  Widget _buildStatsGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _StatCard(value: '2', label: 'Active')),
            SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                value: '1',
                label: 'Needs attention',
                dot: true,
                dotColor: Color(0xFFDC2626),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _StatCard(value: '5', label: 'Completed')),
            SizedBox(width: 12),
            Expanded(child: _StatCard(value: '8', label: 'Total')),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectableCard({
    required int index,
    required String title,
    required String statusText,
    required Color statusColor,
    required String badgeText,
    required Color badgeColor,
    required String actionText,
  }) {
    final isSelected = _selected.contains(index);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selected.remove(index);
          } else {
            _selected.add(index);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF432CBB) : Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected ? Color(0xFF432CBB) : Color(0xFFD1D5DB),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Ux4gButton(
                          text: actionText,
                          onPressed: () {},
                          variant: Ux4gButtonVariant.outline,
                          height: 32,
                          borderRadius: 6,
                          borderColor: Color(0xFFD1D5DB),
                          contentColor: Color(0xFF111827),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF4B5563)),
                      ],
                    ),
                    SizedBox(height: 6),
                    _buildStatusPill(
                      statusText: statusText,
                      statusColor: statusColor,
                      badgeText: badgeText,
                      badgeColor: badgeColor,
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

  Widget _buildStatusPill({
    required String statusText,
    required Color statusColor,
    required String badgeText,
    required Color badgeColor,
  }) {
    return Container(
      height: 22,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  statusText,
                  style: TextStyle(fontSize: 11, color: Color(0xFF374151)),
                ),
              ],
            ),
          ),
          VerticalDivider(width: 1, thickness: 1, color: Color(0xFFE5E7EB)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              badgeText,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: badgeColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedCard({required int index, required String title}) {
    final isSelected = _selected.contains(index);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selected.remove(index);
          } else {
            _selected.add(index);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF432CBB) : Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected ? Color(0xFF432CBB) : Color(0xFFD1D5DB),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.check_circle, size: 16, color: Color(0xFF16A34A)),
                        ],
                      ),
                    ),
                    Ux4gButton(
                      text: 'Download',
                      leadingIcon: Icons.file_download_outlined,
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      height: 32,
                      borderRadius: 6,
                      borderColor: Color(0xFFD1D5DB),
                      contentColor: Color(0xFF111827),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0xFF4B5563)),
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
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF111827)),
              ),
              if (dot) ...[
                SizedBox(width: 6),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dotColor ?? Color(0xFFDC2626),
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
          ),
        ],
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Live Interactive Mockup
// ───────────────────────────────────────────────────────────────────────

class _BulkActionsMockup extends StatefulWidget {
  const _BulkActionsMockup();

  @override
  State<_BulkActionsMockup> createState() => _BulkActionsMockupState();
}

class _BulkActionsMockupState extends State<_BulkActionsMockup> {
  Set<int>? _selected;
  Set<int> get selected => _selected ??= {0, 1, 2};

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
                        errorBuilder: (c, e, s) => const Icon(
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
                        errorBuilder: (c, e, s) => const Icon(
                          Icons.blur_on,
                          size: 28,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        'Government of India',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                      imageUrl:
                          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
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
                      'Select applications to download or track together',
                      style: typography.bS_default.copyWith(
                        color: _getSubtleText(context),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Stats grid
                    _buildStatsGrid(),
                    SizedBox(height: 24),

                    // Your applications heading
                    Text(
                      'Your applications',
                      style: typography.hXS_strong.copyWith(
                        color: _getTitleColor(context),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Bulk action bar
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _isDark(context)
                            ? const Color(0xFF1E2130)
                            : Ux4gColors.primary50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${selected.length} selected',
                                style: typography.lM_strong.copyWith(
                                  color: _getTitleColor(context),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => setState(() => selected.clear()),
                                child: Text(
                                  'Clear filters',
                                  style: typography.lM_default.copyWith(
                                    color: _isDark(context)
                                        ? Ux4gColors.primary300
                                        : _primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),
                          Row(
                            children: [
                              Expanded(
                                child: Ux4gButton(
                                  text: 'Download all',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.outline,
                                  height: 42,
                                  borderRadius: 8,
                                  borderColor: _isDark(context)
                                      ? Ux4gColors.primary400
                                      : Ux4gColors.primary400,
                                  contentColor: _isDark(context)
                                      ? Ux4gColors.primary300
                                      : _primaryColor,
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Ux4gButton(
                                  text: 'Track together',
                                  onPressed: () {},
                                  variant: Ux4gButtonVariant.primary,
                                  height: 42,
                                  borderRadius: 8,
                                  backgroundColor: _primaryColor,
                                  contentColor: Ux4gColors.neutral0,
                                  textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                    // Application cards with checkboxes
                    _buildSelectableCard(
                      index: 0,
                      title: 'Income Certificate',
                      statusText: '2 days overdue',
                      statusColor: _isDark(context)
                          ? Ux4gColors.red300
                          : Ux4gColors.red600,
                      badgeText: 'Escalation available',
                      badgeColor: _isDark(context)
                          ? Ux4gColors.red300
                          : const Color(0xFF991B1B),
                      actionText: 'Track',
                    ),
                    _buildSelectableCard(
                      index: 1,
                      title: 'Income Certificate',
                      statusText: '4 days left',
                      statusColor: _isDark(context)
                          ? Ux4gColors.red300
                          : Ux4gColors.red600,
                      badgeText: 'Action needed',
                      badgeColor: _isDark(context)
                          ? Ux4gColors.red300
                          : const Color(0xFF991B1B),
                      actionText: 'Track',
                    ),
                    _buildSelectableCard(
                      index: 2,
                      title: 'Income Certificate',
                      statusText: '8 days left',
                      statusColor: _isDark(context)
                          ? Ux4gColors.secondary300
                          : _orangeColor,
                      badgeText: 'Under review',
                      badgeColor: _isDark(context)
                          ? Ux4gColors.secondary300
                          : const Color(0xFFB45309),
                      actionText: 'Track',
                    ),
                    _buildCompletedCard(
                      index: 3,
                      title: 'Birth\nCertificate',
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

  Widget _buildSelectableCard({
    required int index,
    required String title,
    required String statusText,
    required Color statusColor,
    required String badgeText,
    required Color badgeColor,
    required String actionText,
  }) {
    final typography = Ux4gTheme.typography(context);
    final isSelected = selected.contains(index);

    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selected.remove(index);
          } else {
            selected.add(index);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Checkbox
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? _primaryColor : _getCardBg(context),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected ? _primaryColor : _getBorderColor(context),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 10),

            // Card content
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                  color: _getCardBg(context),
                  border: Border(
                    bottom: BorderSide(color: _getBorderColor(context)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: typography.lM_strong.copyWith(
                              color: _getTitleColor(context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Ux4gButton(
                          text: actionText,
                          onPressed: () {},
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.small,
                          height: 32,
                          borderRadius: 6,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          borderColor: _getBorderColor(context),
                          contentColor: _getTitleColor(context),
                          textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 6),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: _getSubtleText(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    _buildStatusPill(
                      statusText: statusText,
                      statusColor: statusColor,
                      badgeText: badgeText,
                      badgeColor: badgeColor,
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

  Widget _buildStatusPill({
    required String statusText,
    required Color statusColor,
    required String badgeText,
    required Color badgeColor,
  }) {
    return Container(
      height: 22,
      decoration: BoxDecoration(
        color: _getCardBg(context),
        border: Border.all(color: _getBorderColor(context)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 11,
                    height: 1,
                    color: _getTitleColor(context),
                  ),
                ),
              ],
            ),
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: _getBorderColor(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              badgeText,
              style: TextStyle(
                fontSize: 11,
                height: 1,
                fontWeight: FontWeight.w500,
                color: badgeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedCard({required int index, required String title}) {
    final typography = Ux4gTheme.typography(context);
    final isSelected = selected.contains(index);

    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selected.remove(index);
          } else {
            selected.add(index);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Checkbox
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? _primaryColor : _getCardBg(context),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected ? _primaryColor : _getBorderColor(context),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 10),

            // Card content
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                  color: _getCardBg(context),
                  border: Border(
                    bottom: BorderSide(color: _getBorderColor(context)),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: typography.lM_strong.copyWith(
                                color: _getTitleColor(context),
                                fontWeight: FontWeight.w600,
                                height: 1.15,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          const Icon(
                            Icons.check_circle,
                            size: 16,
                            color: _greenColor,
                          ),
                        ],
                      ),
                    ),
                    Ux4gButton(
                      text: 'Download',
                      leadingIcon: Icons.file_download_outlined,
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      height: 32,
                      borderRadius: 6,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      borderColor: _getBorderColor(context),
                      contentColor: _getTitleColor(context),
                      iconSize: 16,
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: _getSubtleText(context),
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

// ───────────────────────────────────────────────────────────────────────
// Stat Card Helper
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
