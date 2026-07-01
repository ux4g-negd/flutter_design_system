import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────

// ignore: unused_element

bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

// ignore: unused_element

Color _getTitleColor(BuildContext context) => _isDark(context) ? Colors.white : const Color(0xFF111827);

// ignore: unused_element

Color _getSubtleText(BuildContext context) => _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563);

// ignore: unused_element

Color _getBorderColor(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral700 : const Color(0xFFE5E7EB);

// ignore: unused_element

Color _getScaffoldBg(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral950 : Colors.white;

// ignore: unused_element

Color _getCardBg(BuildContext context) => _isDark(context) ? const Color(0xFF1A1A1A) : Colors.white;

// ignore: unused_element

Color _getBreadcrumbColor(BuildContext context) => _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);

// ignore: unused_element

const _primaryColor = Color(0xFF432CBB);



// ── Component ────────────────────────────────────────────────────────────

final helpCentreComponent = WidgetbookComponent(
  name: 'Help Centre',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final variant = context.knobs.list(
          label: 'Variant',
          options: const ['Default', 'Card Style'],
          initialOption: 'Default',
          description:
              'Switch between the standard layout and the card-style layout '
              'with a light purple background.',
        );

        final isCard = variant == 'Card Style';

        return ComponentDocs(
          mobileMockup: true,
          name: 'Help Centre ($variant)',
          description: isCard
              ? 'Help centre with search and category browsing inside a card '
                    'container with light purple background.'
              : 'Help centre with search and category browsing on a white background.',
          code: isCard ? _helpCentreCardCode : _helpCentreDefaultCode,
          center: true,
          child: _HelpCentreMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _helpCentreDefaultCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class HelpCentreScreen extends StatelessWidget {
  const HelpCentreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
                const SizedBox(width: 8),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                    Ux4gIcons.union,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
              ],
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Help Centre',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text('Find answers to common questions or contact our support team.',
                        style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
                    const SizedBox(height: 20),
                    // Search field
                    Ux4gSearchField(
                      value: '',
                      onValueChange: (v) {},
                      placeholder: 'Search for...',
                    ),
                    const SizedBox(height: 20),
                    Text('Browse by category',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    // Category list
                    ...[
                      'Application Issues',
                      'Documents and Uploads',
                      'Payments and Fees',
                      'Account and Profile',
                      'Technical Issues',
                    ].map((category) => Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(category,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                          trailing: Icon(Icons.chevron_right, color: Color(0xFF9CA3AF)),
                          onTap: () {},
                        ),
                        Ux4gDivider(color: Color(0xFFE5E7EB)),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            // Powered by Digital India
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 20),
                ],
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
// Source Code String — Card Style
// ───────────────────────────────────────────────────────────────────────

const _helpCentreCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

/// Card Style variant — help centre inside a white card on purple background.
class HelpCentreCardScreen extends StatelessWidget {
  const HelpCentreCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFFF),
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              leadingSpacing: 8,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
                const SizedBox(width: 8),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: const Color(0xFFD1D5DB),
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                    Ux4gIcons.union,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
              ],
            ),
            // White card content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Ux4gCard(
                  backgroundColor: Colors.white,
                  cornerRadius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Help Centre',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Text('Find answers to common questions or contact our support team.',
                            style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
                        const SizedBox(height: 20),
                        // Search field
                        Ux4gSearchField(
                          value: '',
                          onValueChange: (v) {},
                          placeholder: 'Search for...',
                        ),
                        const SizedBox(height: 20),
                        Text('Browse by category',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 12),
                        // Category list
                        ...[
                          'Application Issues',
                          'Documents and Uploads',
                          'Payments and Fees',
                          'Account and Profile',
                          'Technical Issues',
                        ].map((category) => Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(category,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                              trailing: Icon(Icons.chevron_right, color: Color(0xFF9CA3AF)),
                              onTap: () {},
                            ),
                            Ux4gDivider(color: Color(0xFFE5E7EB)),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Powered by Digital India
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
                  const SizedBox(width: 4),
                  Image.asset(Ux4gIcons.digitalIndiaLogoPng,  height: 20),
                ],
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
// Mockup Widget
// ───────────────────────────────────────────────────────────────────────

class _HelpCentreMockup extends StatelessWidget {
  final bool isCard;

  const _HelpCentreMockup({this.isCard = false});

  static const _categories = [
    'Application Issues',
    'Documents and Uploads',
    'Payments and Fees',
    'Account and Profile',
    'Technical Issues',
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Ux4gTheme.themeData(isDark: _isDark(context)),
      child: Scaffold(
        backgroundColor: isCard ? (_isDark(context) ? Ux4gPalette.primary800 : Ux4gPalette.primary100) : _getScaffoldBg(context),
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Ux4gAppHeader(
                elevation: 2,
                leadingSpacing: 8,
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingWidgets: [
                  SvgPicture.asset(
                    Ux4gIcons.nationalEmblem,
                    height: 40,
                    colorFilter: _isDark(context) ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : null,
                  ),
                  SizedBox(
                    height: 32,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: const Color(0xFFD1D5DB),
                    ),
                  ),
                  SvgPicture.asset(
                    Ux4gIcons.union,
                    height: 32,
                    colorFilter: ColorFilter.mode(
                      _isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: isCard
                      ? Ux4gCard(
                          backgroundColor: _getCardBg(context),
                          cornerRadius: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: _buildContent(context),
                          ),
                        )
                      : _buildContent(context),
                ),
              ),

              // Powered by
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by -',
                      style: TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
                    ),
                    SizedBox(width: 4),
                    Image.asset(
                      Ux4gIcons.digitalIndiaLogoPng, 
                      height: 20,
                      errorBuilder: (_, __, ___) => Text(
                        'Digital India',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF432CBB),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Help Centre',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Find answers to common questions or contact our support team.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        SizedBox(height: 20),

        // Search field
        Ux4gSearchField(
          value: '',
          onValueChange: (v) {},
          placeholder: 'Search for...',
          variant: Ux4gSearchFieldVariant.searchWithSubmit,
          showVoiceIcon: true,
          buttonStyle: Ux4gSearchFieldButtonStyle.filled,
          onSubmitClick: (v) {},
        ),
        SizedBox(height: 20),

        Text(
          'Browse by category',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 12),

        // Category list
        ..._categories.map(
          (category) => Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  category,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: _getTitleColor(context),
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Color(0xFF9CA3AF),
                ),
                onTap: () {},
              ),
              Ux4gDivider(color: _getBorderColor(context)),
            ],
          ),
        ),
      ],
    );
  }
}
