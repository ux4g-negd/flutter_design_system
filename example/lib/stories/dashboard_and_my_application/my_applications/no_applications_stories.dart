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
    _isDark(context) ? const Color(0xFF1A1A1A) : Colors.white;
// ignore: unused_element
Color _getHeaderBg(BuildContext context) =>
    _isDark(context) ? const Color(0xFF161925) : Colors.white;
// ignore: unused_element
const Color _primaryColor = Color(0xFF432CBB);
const String _nationalEmblemLogoPath = Ux4gIcons.nationalEmblem;
const String _unionLogoPath = Ux4gIcons.union;

final noApplicationsComponent = WidgetbookComponent(
  name: 'No Applications',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        return ComponentDocs(
          mobileMockup: true,
          name: 'No Applications',
          description:
              'An empty state pattern shown when the user has no active applications. '
              'Includes a greeting, empty state illustration, CTA button, and popular services list.',
          code: _noApplicationsCode,
          center: true,
          child: const _NoApplicationsMockup(),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String
// ───────────────────────────────────────────────────────────────────────

const _noApplicationsCode = r"""import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoApplicationsScreen extends StatelessWidget {
  const NoApplicationsScreen({super.key});

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
              leadingSpacing: 4,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem, height: 36),
                SizedBox(height: 24, child: Ux4gDivider(orientation: Ux4gDividerOrientation.vertical, color: Color(0xFFD1D5DB))),
                SvgPicture.asset(Ux4gIcons.union, height: 28),
              ],
              titleWidget: Text(
                'Government of India',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF111827)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              actions: [
                Ux4gAppHeaderAction(icon: Icons.notifications_outlined, onPressed: () {}),
              ],
              showAvatar: true,
              avatar: const Ux4gStatusAvatar(
                size: Ux4gAvatarSize.s,
                imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
                initials: 'R',
                variant: Ux4gStatusVariant.online,
              ),
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
                    Text('Good morning, Ramesh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
                    SizedBox(height: 4),
                    Text("You haven't started any applications yet", style: TextStyle(fontSize: 13, color: Color(0xFF4B5563))),
                    SizedBox(height: 40),

                    // Empty state
                    Center(
                      child: Column(
                        children: [
                          // Illustration icon
                          SvgPicture.asset(
                            Ux4gIcons.inbox,
                            width: 64,
                            height: 64,
                            colorFilter: ColorFilter.mode(
                              _isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600,
                              BlendMode.srcIn,
                            ),
                            errorBuilder: (c, e, s) => Icon(
                              Icons.inbox_outlined,
                              size: 64,
                              color: _isDark(context) ? Ux4gColors.primary300 : Ux4gColors.primary600,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text('No active applications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                          SizedBox(height: 8),
                          Text(
                            'Start your application easily by clicking on the\nbutton below',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                          ),
                          SizedBox(height: 24),
                          Ux4gButton(
                            text: 'Start application',
                            onPressed: () {},
                            variant: Ux4gButtonVariant.primary,
                            backgroundColor: Color(0xFFEDE9FE),
                            contentColor: Color(0xFF432CBB),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),

                    // Popular services
                    Text('Popular services to get started', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
                    SizedBox(height: 16),

                    _ServiceCard(title: 'Caste Certificate', subtitle: 'SC / ST / OBC category proof'),
                    SizedBox(height: 12),
                    _ServiceCard(title: 'Domicile Certificate', subtitle: 'Proof of residence in the state'),
                    SizedBox(height: 12),
                    _ServiceCard(title: 'Income Certificate', subtitle: 'Proof of annual family income'),
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

class _ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const _ServiceCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
          SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 12, color: Color(0xFF4B5563))),
          SizedBox(height: 8),
          Row(
            children: [
              Text('Start now', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF432CBB))),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, size: 14, color: Color(0xFF432CBB)),
            ],
          ),
        ],
      ),
    );
  }
}
""";

// ───────────────────────────────────────────────────────────────────────
// Mockup
// ───────────────────────────────────────────────────────────────────────

class _NoApplicationsMockup extends StatelessWidget {
  const _NoApplicationsMockup();

  @override
  Widget build(BuildContext context) {
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
                    leadingSpacing: 4,
                    leadingWidgets: [
                      SvgPicture.asset(
                        _nationalEmblemLogoPath,
                        height: 36,
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
                        height: 26,
                        errorBuilder: (c, e, s) =>
                            Icon(Icons.blur_on, size: 28, color: Colors.blue),
                      ),
                    ],
                    titleWidget: Text(
                      'Government of India',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _getTitleColor(context),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: _getTitleColor(context),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "You haven't started any applications yet",
                      style: TextStyle(
                        fontSize: 13,
                        color: _getSubtleText(context),
                      ),
                    ),
                    SizedBox(height: 40),

                    // Empty state
                    Center(
                      child: Column(
                        children: [
                          // Illustration icon
                          SvgPicture.asset(
                            Ux4gIcons.inbox,
                            width: 64,
                            height: 64,
                            colorFilter: ColorFilter.mode(
                              _isDark(context)
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                              BlendMode.srcIn,
                            ),
                            errorBuilder: (c, e, s) => Icon(
                              Icons.inbox_outlined,
                              size: 64,
                              color: _isDark(context)
                                  ? Ux4gColors.primary300
                                  : Ux4gColors.primary600,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'No active applications',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: _getTitleColor(context),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Start your application easily by clicking on the\nbutton below',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: _getSubtleText(context),
                            ),
                          ),
                          SizedBox(height: 24),
                          Ux4gButton(
                            text: 'Start application',
                            onPressed: () {},
                            variant: Ux4gButtonVariant.primary,
                            backgroundColor: _isDark(context)
                                ? const Color(0xFF2E1C89)
                                : const Color(0xFFEDE9FE),
                            contentColor: _isDark(context)
                                ? const Color(0xFFE0E7FF)
                                : _primaryColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),

                    // Popular services
                    Text(
                      'Popular services to get started',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: _getTitleColor(context),
                      ),
                    ),
                    SizedBox(height: 16),

                    _buildServiceCard(
                      context,
                      'Caste Certificate',
                      'SC / ST / OBC category proof',
                    ),
                    SizedBox(height: 12),
                    _buildServiceCard(
                      context,
                      'Domicile Certificate',
                      'Proof of residence in the state',
                    ),
                    SizedBox(height: 12),
                    _buildServiceCard(
                      context,
                      'Income Certificate',
                      'Proof of annual family income',
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

  Widget _buildServiceCard(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: _getBorderColor(context)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _getTitleColor(context),
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: _getSubtleText(context)),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Start now',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: _primaryColor,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, size: 14, color: _primaryColor),
            ],
          ),
        ],
      ),
    );
  }
}
