import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../widgets/component_docs.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;
// ignore: unused_element
Color _getTitleColor(BuildContext context) =>
    _isDark(context) ? Colors.white : const Color(0xFF111827);
// ignore: unused_element
Color _getSubtleText(BuildContext context) =>
    _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563);
// ignore: unused_element
Color _getBorderColor(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral700 : const Color(0xFFE5E7EB);
// ignore: unused_element
Color _getScaffoldBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral950 : Colors.white;
// ignore: unused_element
Color _getCardBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral950 : Ux4gColors.neutral0;
// ignore: unused_element
Color _getHeaderBg(BuildContext context) =>
    _isDark(context) ? const Color(0xFF161925) : Colors.white;
// ignore: unused_element
const Color _primaryColor = Ux4gColors.primary600;
// ignore: unused_element
const Color _errorColor = Color(0xFFDC2626);
// ignore: unused_element
const Color _orangeColor = Color(0xFFF59E0B);
// ignore: unused_element
const Color _greenColor = Color(0xFF16A34A);
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
                    Text('Good morning, Ramesh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                    SizedBox(height: 4),
                    Text('Select applications to download or track together', style: TextStyle(fontSize: 13, color: Color(0xFF4B5563))),
                    SizedBox(height: 20),
                    // Bulk action bar
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _isDark(context) ? const Color(0xFF1E2130) : const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${_selected.length} selected', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                              TextButton(onPressed: () => setState(() => _selected.clear()), child: Text('Clear filters')),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Ux4gButton(text: 'Download all', onPressed: () {}, variant: Ux4gButtonVariant.outline, contentColor: Color(0xFF432CBB)),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Ux4gButton(text: 'Track together', onPressed: () {}, variant: Ux4gButtonVariant.primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Application cards with checkboxes
                    // ... cards here
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

class _BulkActionsMockup extends StatefulWidget {
  const _BulkActionsMockup();

  @override
  State<_BulkActionsMockup> createState() => _BulkActionsMockupState();
}

class _BulkActionsMockupState extends State<_BulkActionsMockup> {
  final Set<int> _selected = {0, 1, 2};

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 360;

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
                            errorBuilder: (c, e, s) => Icon(
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
                        avatar: Ux4gStatusAvatar(
                          size: Ux4gAvatarSize.s,
                          imageUrl:
                              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
                          initials: 'R',
                          variant: Ux4gStatusVariant.online,
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      isCompact ? 12 : 18,
                      isCompact ? 18 : 22,
                      isCompact ? 8 : 12,
                      24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Greeting
                        Text(
                          'Good morning, Ramesh',
                          style: TextStyle(
                            fontSize: isCompact ? 21 : 24,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: _getTitleColor(context),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Select applications to download or track together',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.35,
                            color: _getSubtleText(context),
                          ),
                        ),
                        SizedBox(height: 23),

                        // Bulk action bar
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: _isDark(context)
                                ? const Color(0xFF1E2130)
                                : Ux4gColors.primary50,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${_selected.length} selected',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: _getTitleColor(context),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () =>
                                        setState(() => _selected.clear()),
                                    child: Text(
                                      'Clear filters',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: _primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final stackButtons =
                                      constraints.maxWidth < 280;
                                  final download = _buildBulkActionButton(
                                    text: 'Download all',
                                    outlined: true,
                                  );
                                  final track = _buildBulkActionButton(
                                    text: 'Track together',
                                  );

                                  if (stackButtons) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: download,
                                        ),
                                        SizedBox(height: 8),
                                        SizedBox(
                                          width: double.infinity,
                                          child: track,
                                        ),
                                      ],
                                    );
                                  }

                                  return Row(
                                    children: [
                                      Expanded(child: download),
                                      SizedBox(width: 8),
                                      Expanded(child: track),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),

                        // Application cards
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
                              : Ux4gColors.red800,
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
                              : Ux4gColors.red800,
                          actionText: 'Track',
                        ),
                        _buildSelectableCard(
                          index: 2,
                          title: 'Income Certificate',
                          statusText: '8 days left',
                          statusColor: _isDark(context)
                              ? Ux4gColors.secondary300
                              : Ux4gColors.secondary600,
                          badgeText: 'Under review',
                          badgeColor: _isDark(context)
                              ? Ux4gColors.orange300
                              : Ux4gColors.orange800,
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
      },
    );
  }

  Widget _buildBulkActionButton({required String text, bool outlined = false}) {
    return Ux4gButton(
      text: text,
      onPressed: () {},
      variant: outlined ? Ux4gButtonVariant.outline : Ux4gButtonVariant.primary,
      height: 46,
      borderRadius: 8,
      borderColor: outlined ? Ux4gColors.primary400 : null,
      backgroundColor: outlined ? null : _primaryColor,
      contentColor: outlined ? _primaryColor : null,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 90),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                color: isSelected ? _primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: isSelected ? _primaryColor : const Color(0xFFE5E7EB),
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 7),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(minHeight: 90),
                padding: const EdgeInsets.fromLTRB(12, 10, 17, 10),
                decoration: BoxDecoration(
                  color: _getCardBg(context),
                  border: Border(
                    bottom: BorderSide(color: _getBorderColor(context)),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _getTitleColor(context),
                            ),
                          ),
                        ),
                        Ux4gButton(
                          text: actionText,
                          onPressed: () {},
                          variant: Ux4gButtonVariant.outline,
                          size: Ux4gButtonSize.small,
                          height: 32,
                          borderRadius: 8,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          borderColor: const Color(0xFFD1D5DB),
                          contentColor: _getTitleColor(context),
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: _getTitleColor(context),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: _buildStatusPill(
                          statusText: statusText,
                          statusColor: statusColor,
                          badgeText: badgeText,
                          badgeColor: badgeColor,
                        ),
                      ),
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
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                SizedBox(width: 5),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 12,
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 75),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                color: isSelected ? _primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: isSelected ? _primaryColor : const Color(0xFFE5E7EB),
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 7),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(minHeight: 75),
                padding: const EdgeInsets.fromLTRB(12, 10, 17, 10),
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
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.1,
                                fontWeight: FontWeight.w600,
                                color: _getTitleColor(context),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          const Icon(
                            Icons.check_circle,
                            size: 14,
                            color: _greenColor,
                          ),
                        ],
                      ),
                    ),
                    Ux4gButton(
                      text: 'Download',
                      onPressed: () {},
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.small,
                      height: 32,
                      borderRadius: 8,
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      borderColor: const Color(0xFFD1D5DB),
                      contentColor: _getTitleColor(context),
                      leadingIcon: Icons.file_download_outlined,
                      iconSize: 16,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: _getTitleColor(context),
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
