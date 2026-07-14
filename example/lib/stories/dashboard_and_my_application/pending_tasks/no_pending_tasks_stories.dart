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
    _isDark(context) ? Ux4gColors.neutral950 : Ux4gColors.neutral0;
Color _getHeaderBg(BuildContext context) =>
    _isDark(context) ? Ux4gColors.neutral900 : Ux4gColors.neutral0;
const Color _primaryColor = Ux4gColors.primary600;
const Color _greenColor = Ux4gColors.green600;
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;

final noPendingTasksComponent = WidgetbookComponent(
  name: 'No Pending Tasks',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'No Pending Tasks',
          description:
              'An empty state pattern shown when the user has no pending tasks. '
              'Displays a success check icon and a message that all applications are progressing smoothly.',
          code: _noPendingTasksCode,
          center: true,
          child: const _NoPendingTasksMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _noPendingTasksCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoPendingTasksScreen extends StatelessWidget {
  const NoPendingTasksScreen({super.key});

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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pending Tasks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
                    SizedBox(height: 4),
                    Text("You're all caught up", style: TextStyle(fontSize: 13, color: Color(0xFF4B5563))),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.arrow_back, size: 14, color: Color(0xFF432CBB)),
                        SizedBox(width: 4),
                        Text('Back to home', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF432CBB))),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.check_circle, size: 64, color: Color(0xFF16A34A)),
                          SizedBox(height: 20),
                          Text('No pending tasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                          SizedBox(height: 8),
                          Text(
                            'You have no pending tasks right now. All\nyour applications are progressing\nsmoothly.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
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

class _NoPendingTasksMockup extends StatelessWidget {
  const _NoPendingTasksMockup();

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
              child: Padding(
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
                      "You're all caught up",
                      style: typography.bS_default.copyWith(
                        color: _getSubtleText(context),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Back to home link
                    Row(
                      children: [
                        Icon(Icons.arrow_back, size: 14, color: _primaryColor),
                        SizedBox(width: 4),
                        Text(
                          'Back to home',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: _primaryColor,
                          ),
                        ),
                      ],
                    ),

                    // Empty state centered
                    SizedBox(height: 52),
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 56,
                            color: _greenColor,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No pending tasks',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: _getTitleColor(context),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'You have no pending tasks right now. All\nyour applications are progressing\nsmoothly.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: _getSubtleText(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
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
