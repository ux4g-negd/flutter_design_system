import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────
bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral400 : const Color(0xFF4B5563);
Color _getMutedText(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral500 : const Color(0xFF6B7280);
Color _getPrimaryColor(BuildContext context) => _isDark(context) ? Ux4gPalette.primary300 : const Color(0xFF432CBB);

// ── Component ────────────────────────────────────────────────────────────

final inlineLanguageToggleComponent = WidgetbookComponent(
  name: 'Inline Language Toggle',
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
          name: 'Inline Language Toggle ($variant)',
          description: isCard
              ? 'Inline language toggle with choice chips inside a '
                    'card container with light purple background.'
              : 'Inline language toggle with choice chips on white background.',
          code: isCard
              ? _inlineLanguageToggleCardCode
              : _inlineLanguageToggleDefaultCode,
          center: true,
          child: _InlineLanguageToggleMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _inlineLanguageToggleDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

class InlineLanguageToggleScreen extends StatefulWidget {
  const InlineLanguageToggleScreen({super.key});

  @override
  State<InlineLanguageToggleScreen> createState() => _InlineLanguageToggleScreenState();
}

class _InlineLanguageToggleScreenState extends State<InlineLanguageToggleScreen> {
  int _selectedIndex = 0;

  final _languages = ['English', 'हिन्दी', 'தமிழ்', 'తెలుగు'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
                elevation: 4,
              title: '',
              leadingSpacing: 8,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFD1D5DB),
                  ),
                ),
                SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn)),
              ],
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Apply for Income Certificate',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text('Switch the inline toggle to change form labels — your entered data is preserved.',
                        style: TextStyle(fontSize: 14, color: _getSubtleText(context))),
                    const SizedBox(height: 20),
                    // Language chips
                    Wrap(
                      spacing: 8,
                      children: List.generate(_languages.length, (i) {
                        return Ux4gChoiceChip(
                          text: _languages[i],
                          selected: _selectedIndex == i,
                          onClick: () => setState(() => _selectedIndex = i),
                        );
                      }),
                    ),
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
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: _getMutedText(context))),
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

const _inlineLanguageToggleCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

/// Card Style variant — inline language toggle inside a white card on purple background.
class InlineLanguageToggleCardScreen extends StatefulWidget {
  const InlineLanguageToggleCardScreen({super.key});

  @override
  State<InlineLanguageToggleCardScreen> createState() => _InlineLanguageToggleCardScreenState();
}

class _InlineLanguageToggleCardScreenState extends State<InlineLanguageToggleCardScreen> {
  int _selectedIndex = 0;

  final _languages = ['English', 'हिन्दी', 'தமிழ்', 'తెలుగు'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EFFF),
      body: SafeArea(
        child: Column(
          children: [
            // App Header
            Ux4gAppHeader(
              variant: Ux4gAppHeaderVariant.light,
                elevation: 4,
              title: '',
              leadingSpacing: 8,
              leadingWidgets: [
                SvgPicture.asset(Ux4gIcons.nationalEmblem,  height: 40),
                SizedBox(
                  height: 32,
                  child: Ux4gDivider(
                    orientation: Ux4gDividerOrientation.vertical,
                    color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFD1D5DB),
                  ),
                ),
                SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn)),
              ],
            ),
            // White card content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Ux4gCard(
                  backgroundColor: _isDark(context) ? Ux4gPalette.gray900 : Colors.white,
                  cornerRadius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Apply for Income Certificate',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Text('Switch the inline toggle to change form labels — your entered data is preserved.',
                            style: TextStyle(fontSize: 14, color: _getSubtleText(context))),
                        const SizedBox(height: 20),
                        // Language chips
                        Wrap(
                          spacing: 8,
                          children: List.generate(_languages.length, (i) {
                            return Ux4gChoiceChip(
                              text: _languages[i],
                              selected: _selectedIndex == i,
                              onClick: () => setState(() => _selectedIndex = i),
                            );
                          }),
                        ),
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
                  Text('Powered by -', style: TextStyle(fontSize: 11, color: _getMutedText(context))),
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

class _InlineLanguageToggleMockup extends StatefulWidget {
  final bool isCard;

  const _InlineLanguageToggleMockup({this.isCard = false});

  @override
  State<_InlineLanguageToggleMockup> createState() =>
      _InlineLanguageToggleMockupState();
}

class _InlineLanguageToggleMockupState
    extends State<_InlineLanguageToggleMockup> {
  int _selectedIndex = 0;

  final _languages = const ['English', 'हिन्दी', 'தமிழ்', 'తెలుగు'];

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return Scaffold(
        backgroundColor: widget.isCard
            ? (isDark ? Ux4gPalette.primary800 : Color(0xFFF2EFFF))
            : (isDark ? Ux4gPalette.neutral950 : Colors.white),
        body: SafeArea(
          child: Column(
            children: [
              // App Header
              Ux4gAppHeader(
                variant: Ux4gAppHeaderVariant.light,
                elevation: 4,
                title: '',
                leadingSpacing: 8,
                leadingWidgets: [
                  SvgPicture.asset(
                    Ux4gIcons.nationalEmblem, 
                    height: 40, colorFilter: _isDark(context) ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : null),
                  SizedBox(
                    height: 32,
                    child: Ux4gDivider(
                      orientation: Ux4gDividerOrientation.vertical,
                      color: _isDark(context) ? Ux4gPalette.neutral700 : Color(0xFFD1D5DB),
                    ),
                  ),
                  SvgPicture.asset(Ux4gIcons.union, height: 32, colorFilter: ColorFilter.mode(_isDark(context) ? Ux4gPalette.primary300 : Ux4gPalette.primary600, BlendMode.srcIn)),
                ],
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: widget.isCard
                      ? Ux4gCard(
                          backgroundColor: _isDark(context) ? Ux4gPalette.gray900 : Colors.white,
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
                      style: TextStyle(fontSize: 11, color: _getMutedText(context)),
                    ),
                    const SizedBox(width: 4),
                    Image.asset(
                      Ux4gIcons.digitalIndiaLogoPng, 
                      height: 20,
                      errorBuilder: (_, __, ___) => Text(
                        'Digital India',
                        style: TextStyle(
                          fontSize: 10,
                          color: _getPrimaryColor(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Apply for Income Certificate',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Switch the inline toggle to change form labels — your entered data is preserved.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        const SizedBox(height: 20),

        // Language chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_languages.length, (i) {
            return Ux4gChoiceChip(
              text: _languages[i],
              selected: _selectedIndex == i,
              onClick: () => setState(() => _selectedIndex = i),
            );
          }),
        ),
      ],
    );
  }
}
