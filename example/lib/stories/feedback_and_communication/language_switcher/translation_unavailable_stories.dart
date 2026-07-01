import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';
import '../../../widgets/component_docs.dart';

// ── Design tokens ────────────────────────────────────────────────────────
bool _isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
Color _getTitleColor(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral50 : const Color(0xFF111827);
Color _getSubtleText(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral400 : const Color(0xFF4B5563);
Color _getMutedText(BuildContext context) => _isDark(context) ? Ux4gPalette.neutral500 : const Color(0xFF6B7280);
Color _getPrimaryColor(BuildContext context) => _isDark(context) ? Ux4gPalette.primary300 : const Color(0xFF432CBB);

// ── Component ────────────────────────────────────────────────────────────

final translationUnavailableComponent = WidgetbookComponent(
  name: 'Translation Unavailable',
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
          name: 'Translation Unavailable ($variant)',
          description: isCard
              ? 'Translation unavailable notice with progress status inside a '
                    'card container with light purple background.'
              : 'Translation unavailable notice with progress status on white background.',
          code: isCard
              ? _translationUnavailableCardCode
              : _translationUnavailableDefaultCode,
          center: true,
          child: _TranslationUnavailableMockup(isCard: isCard),
        );
      },
    ),
  ],
);

// ───────────────────────────────────────────────────────────────────────
// Source Code String — Default
// ───────────────────────────────────────────────────────────────────────

const _translationUnavailableDefaultCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

class TranslationUnavailableScreen extends StatelessWidget {
  const TranslationUnavailableScreen({super.key});

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
                    color: const Color(0xFFD1D5DB),
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
                    Text('This page is not yet available in Tamil',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Text('We are translating Income Certificate pages — the Tamil version is coming in May 2026.',
                        style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
                    const SizedBox(height: 24),
                    // Warning card
                    Ux4gCard(
                      backgroundColor: const Color(0xFFFFF7E6),
                      cornerRadius: 12,
                      borderColor: const Color(0xFFFFC973),
                      borderWidth: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info, color: Color(0xFFFA8C16), size: 20),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Translation in progress',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFFAD4E00))),
                                  const SizedBox(height: 4),
                                  Text('You can read this page in English meanwhile, or use your browser to auto-translate.',
                                      style: TextStyle(fontSize: 13, color: Color(0xFFAD4E00))),
                                ],
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
                      text: 'Switch to English',
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
                      text: 'Translate with Browser',
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

const _translationUnavailableCardCode =
    r"""import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_design_system/ux4g_flutter_design_system.dart';

/// Card Style variant — translation unavailable inside a white card on purple background.
class TranslationUnavailableCardScreen extends StatelessWidget {
  const TranslationUnavailableCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2EFFF),
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
                    color: const Color(0xFFD1D5DB),
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
                  backgroundColor: Colors.white,
                  cornerRadius: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('This page is not yet available in Tamil',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Text('We are translating Income Certificate pages — the Tamil version is coming in May 2026.',
                            style: TextStyle(fontSize: 14, color: Color(0xFF4B5563))),
                        const SizedBox(height: 24),
                        // Warning card
                        Ux4gCard(
                          backgroundColor: const Color(0xFFFFF7E6),
                          cornerRadius: 12,
                          borderColor: const Color(0xFFFFC973),
                          borderWidth: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.info, color: Color(0xFFFA8C16), size: 20),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Translation in progress',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFFAD4E00))),
                                      const SizedBox(height: 4),
                                      Text('You can read this page in English meanwhile, or use your browser to auto-translate.',
                                          style: TextStyle(fontSize: 13, color: Color(0xFFAD4E00))),
                                    ],
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
                      text: 'Switch to English',
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
                      text: 'Translate with Browser',
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

class _TranslationUnavailableMockup extends StatelessWidget {
  final bool isCard;

  const _TranslationUnavailableMockup({this.isCard = false});

  @override
  Widget build(BuildContext context) {
    final isDark = _isDark(context);
    return Scaffold(
        backgroundColor: isCard
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
                  child: isCard
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

              // Buttons at bottom
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Ux4gButton(
                        onPressed: () {},
                        text: 'Switch to English',
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
                        text: 'Translate with Browser',
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.large,
                        height: 48,
                        borderColor: _getPrimaryColor(context),
                        contentColor: _getPrimaryColor(context),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

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
          'This page is not yet available in Tamil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: _getTitleColor(context),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'We are translating Income Certificate pages — the Tamil version is coming in May 2026.',
          style: TextStyle(fontSize: 14, color: _getSubtleText(context)),
        ),
        const SizedBox(height: 24),

        // Warning card
        Ux4gCard(
          backgroundColor: Color(0xFFFFF7E6),
          cornerRadius: 12,
          borderColor: Color(0xFFFFC973),
          borderWidth: 1,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info, color: Color(0xFFFA8C16), size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Translation in progress',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFAD4E00),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'You can read this page in English meanwhile, or use your browser to auto-translate.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFAD4E00),
                        ),
                      ),
                    ],
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
