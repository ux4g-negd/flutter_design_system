import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
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

Color _getScaffoldBg(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50;

// ignore: unused_element

Color _getCardBg(BuildContext context) => _isDark(context) ? const Color(0xFF1A1A1A) : Colors.white;

// ignore: unused_element

Color _getBreadcrumbColor(BuildContext context) => _isDark(context) ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);

// ignore: unused_element

const _primaryColor = Color(0xFF432CBB);



// ── Component ────────────────────────────────────────────────────────────

final findServiceCentreComponent = WidgetbookComponent(
  name: 'Find Service Centre',
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
          name: 'Find Service Centre ($variant)',
          description: isCard
              ? 'Find nearest service centre with search and result card inside a '
                    'card container with light purple background.'
              : 'Find nearest service centre with search and result card on white background.',
          code: isCard
              ? _findServiceCentreCardCode
              : _findServiceCentreDefaultCode,
          center: true,
          child: _FindServiceCentreMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _findServiceCentreDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class FindServiceCentreScreen extends StatelessWidget {
  const FindServiceCentreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.primary800 : Ux4gPalette.primary100,
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingSpacing: 8,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
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
                    Text(
                      'Find your nearest Service Centre',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.hM_default ?? const TextStyle()).copyWith(
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Locate a Common Service Centre (CSC) near you for in-person help.',
                      style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle()).copyWith(
                        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Search bar
                    Ux4gSearchField(
                      value: '',
                      onValueChange: (_) {},
                      variant: Ux4gSearchFieldVariant.searchWithSubmit,
                      size: Ux4gSearchFieldSize.medium,
                      placeholder: 'Enter PIN code or city',
                      placeholderStyle: Theme.of(context).extension<Ux4gTypography>()?.bS_default,
                      showVoiceIcon: true,
                      onSubmitClick: (_) {},
                    ),
                    const SizedBox(height: 20),
                    // Result card
                    Ux4gCard(
                      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral0,
                      cornerRadius: 12,
                      borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200,
                      borderWidth: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CSC Sector 12 — Pune City',
                              style: (Theme.of(context).extension<Ux4gTypography>()?.hS_default ?? const TextStyle()).copyWith(
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '45 Patel Nagar, Sector 12, Pune 411001',
                              style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle()).copyWith(
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '1.2 km away · Open Mon-Sat 9 AM – 6 PM',
                              style: (Theme.of(context).extension<Ux4gTypography>()?.bS_default ?? const TextStyle()).copyWith(
                                color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      onPressed: () {},
                      text: 'Get directions',
                      variant: Ux4gButtonVariant.primary,
                      size: Ux4gButtonSize.large,
                      height: 48,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      onPressed: () {},
                      text: 'View all centres',
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      height: 48,
                      borderColor: const Color(0xFF432CBB),
                      contentColor: const Color(0xFF432CBB),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
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

const _findServiceCentreCardCode = r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — find service centre inside a white card on purple background.
class FindServiceCentreCardScreen extends StatelessWidget {
  const FindServiceCentreCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral900 : Ux4gPalette.neutral50,
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              elevation: 2,
              variant: Ux4gAppHeaderVariant.light,
              title: '',
              leadingSpacing: 8,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
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
                  backgroundColor: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1A1A1A) : Colors.white,
                  cornerRadius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find your nearest Service Centre',
                          style: (Theme.of(context).extension<Ux4gTypography>()?.hM_default ?? const TextStyle()).copyWith(
                            color: Theme.of(context).brightness == Brightness.dark ? Colors.white : const Color(0xFF111827),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Locate a Common Service Centre (CSC) near you for in-person help.',
                          style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle()).copyWith(
                            color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF9CA3AF) : const Color(0xFF4B5563),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Search bar
                        Ux4gSearchField(
                          value: '',
                          onValueChange: (_) {},
                          variant: Ux4gSearchFieldVariant.searchWithSubmit,
                          size: Ux4gSearchFieldSize.medium,
                          placeholder: 'Enter PIN code or city',
                          placeholderStyle: Theme.of(context).extension<Ux4gTypography>()?.bS_default,
                          showVoiceIcon: true,
                          onSubmitClick: (_) {},
                        ),
                        const SizedBox(height: 20),
                        // Result card
                        Ux4gCard(
                          backgroundColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral800 : Ux4gPalette.neutral0,
                          cornerRadius: 12,
                          borderColor: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200,
                          borderWidth: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CSC Sector 12 — Pune City',
                                  style: (Theme.of(context).extension<Ux4gTypography>()?.hS_default ?? const TextStyle()).copyWith(
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '45 Patel Nagar, Sector 12, Pune 411001',
                                  style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle()).copyWith(
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '1.2 km away · Open Mon-Sat 9 AM – 6 PM',
                                  style: (Theme.of(context).extension<Ux4gTypography>()?.bS_default ?? const TextStyle()).copyWith(
                                    color: Theme.of(context).brightness == Brightness.dark ? Ux4gPalette.neutral300 : Ux4gPalette.neutral500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      onPressed: () {},
                      text: 'Get directions',
                      variant: Ux4gButtonVariant.primary,
                      size: Ux4gButtonSize.large,
                      height: 48,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: Ux4gButton(
                      onPressed: () {},
                      text: 'View all centres',
                      variant: Ux4gButtonVariant.outline,
                      size: Ux4gButtonSize.large,
                      height: 48,
                      borderColor: const Color(0xFF432CBB),
                      contentColor: const Color(0xFF432CBB),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
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

class _FindServiceCentreMockup extends StatelessWidget {
  final bool isCard;

  const _FindServiceCentreMockup({this.isCard = false});

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
                variant: Ux4gAppHeaderVariant.light,
                title: '',
                leadingSpacing: 8,
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

              // Buttons at bottom
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'Get directions',
                        variant: Ux4gButtonVariant.primary,
                        size: Ux4gButtonSize.large,
                        height: 48,
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'View all centres',
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        height: 48,
                        borderColor: _primaryColor,
                        contentColor: _primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),

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
          'Find your nearest Service Centre',
          style: (Theme.of(context).extension<Ux4gTypography>()?.hM_default ?? const TextStyle()).copyWith(
            color: _getTitleColor(context),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Locate a Common Service Centre (CSC) near you for in-person help.',
          style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle()).copyWith(
            color: _getSubtleText(context),
          ),
        ),
        SizedBox(height: 24),

        // Search bar
        Ux4gSearchField(
          value: '',
          onValueChange: (_) {},
          variant: Ux4gSearchFieldVariant.searchWithSubmit,
          size: Ux4gSearchFieldSize.medium,
          placeholder: 'Enter PIN code or city',
          placeholderStyle: Theme.of(context).extension<Ux4gTypography>()?.bS_default,
          showVoiceIcon: true,
          onSubmitClick: (_) {},
        ),
        SizedBox(height: 20),

        // Result card
        Ux4gCard(
          backgroundColor: _isDark(context) ? Ux4gPalette.neutral800 : Ux4gPalette.neutral0,
          cornerRadius: 12,
          borderColor: _isDark(context) ? Ux4gPalette.neutral700 : Ux4gPalette.neutral200,
          borderWidth: 1,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CSC Sector 12 — Pune City',
                  style: (Theme.of(context).extension<Ux4gTypography>()?.hS_default ?? const TextStyle()).copyWith(
                    color: _isDark(context) ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '45 Patel Nagar, Sector 12, Pune 411001',
                  style: (Theme.of(context).extension<Ux4gTypography>()?.bM_default ?? const TextStyle()).copyWith(
                    color: _isDark(context) ? Ux4gPalette.neutral200 : Ux4gPalette.neutral700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '1.2 km away · Open Mon-Sat 9 AM – 6 PM',
                  style: (Theme.of(context).extension<Ux4gTypography>()?.bS_default ?? const TextStyle()).copyWith(
                    color: _isDark(context) ? Ux4gPalette.neutral300 : Ux4gPalette.neutral500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
