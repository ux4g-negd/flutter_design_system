import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';
import '../theme_notifier.dart';
import 'welcome_page.dart';

/// Returns true when the active theme (either right-side settings addon or outer frame) is dark.
bool _isOuterDark(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.dark) return true;
  final mode = widgetbookThemeNotifier.value;
  if (mode == ThemeMode.dark) return true;
  if (mode == ThemeMode.light) return false;
  return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
}

// ── Overview ──────────────────────────────────────────────────────────────────

final overviewComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Welcome',
      builder: (context) => const Ux4gWelcomePage(),
    ),
  ],
);

// ── Quick Guide ───────────────────────────────────────────────────────────────

final quickGuideComponent = WidgetbookComponent(
  name: 'Quick Start Guide',
  useCases: [
    WidgetbookUseCase(
      name: 'Installation',
      builder: (context) => _DocPage(
        title: 'Use this package as a library',
        sections: const [
          _DocSection(
            heading: 'Depend on it',
            body: 'Run this command:\nWith Flutter:',
          ),
        ],
        codeBlocks: const [
          _CodeBlock(
            label: 'Terminal',
            code: r'$ flutter pub add ux4g_flutter_components',
          ),
          _CodeBlock(
            label:
                "This will add a line like this to your package's pubspec.yaml\n"
                "(and run an implicit flutter pub get):",
            code: 'dependencies:\n  ux4g_flutter_components: ^1.4.0',
          ),
        ],
        trailingSections: const [
          _DocSection(
            heading: 'Import it',
            body: "Now in your Dart code, you can use:",
          ),
        ],
        trailingCodeBlocks: const [
          _CodeBlock(
            label: '',
            code:
                "import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';",
          ),
          _CodeBlock(
            label: 'Wrap your app with Ux4gTheme',
            code:
                "import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';\n\nvoid main() {\n  runApp(\n    Ux4gTheme(\n      child: MaterialApp(\n        home: MyHomePage(),\n      ),\n    ),\n  );\n}",
          ),
          _CodeBlock(
            label: 'Use any component',
            code: "Ux4gButton(\n  label: 'Submit',\n  onPressed: () {},\n)",
          ),
        ],
      ),
    ),
  ],
);

// ── Theme — Color Palette ─────────────────────────────────────────────────────

final themeColorComponent = WidgetbookComponent(
  name: 'Colors',
  isInitiallyExpanded: false,
  useCases: [
    WidgetbookUseCase(
      name: 'Primary',
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(
              'Ux4gColors Tokens',
              'Ux4gColors.* (Ux4gPalette is deprecated)',
            ),
            const SizedBox(height: 20),
            _PaletteView(
              label: 'Primary Solid Scale',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('primary', Ux4gColors.primary, 'primary ★', main: true),
                _Swatch('primary-50', Ux4gColors.primary50, '50'),
                _Swatch('primary-100', Ux4gColors.primary100, '100'),
                _Swatch('primary-200', Ux4gColors.primary200, '200'),
                _Swatch('primary-300', Ux4gColors.primary300, '300'),
                _Swatch('primary-400', Ux4gColors.primary400, '400'),
                _Swatch('primary-500', Ux4gColors.primary500, '500'),
                _Swatch('primary-600', Ux4gColors.primary600, '600'),
                _Swatch('primary-700', Ux4gColors.primary700, '700'),
                _Swatch('primary-800', Ux4gColors.primary800, '800'),
                _Swatch('primary-900', Ux4gColors.primary900, '900'),
                _Swatch('primary-950', Ux4gColors.primary950, '950'),
              ],
            ),
            const SizedBox(height: 24),
            _PaletteView(
              label: 'Primary Alpha Scale (25% Opacity)',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('primary-50A', Ux4gColors.primary50A, '50A'),
                _Swatch('primary-100A', Ux4gColors.primary100A, '100A'),
                _Swatch('primary-200A', Ux4gColors.primary200A, '200A'),
                _Swatch('primary-300A', Ux4gColors.primary300A, '300A'),
                _Swatch('primary-400A', Ux4gColors.primary400A, '400A'),
                _Swatch('primary-500A', Ux4gColors.primary500A, '500A'),
                _Swatch('primary-600A', Ux4gColors.primary600A, '600A'),
                _Swatch('primary-700A', Ux4gColors.primary700A, '700A'),
                _Swatch('primary-800A', Ux4gColors.primary800A, '800A'),
                _Swatch('primary-900A', Ux4gColors.primary900A, '900A'),
                _Swatch('primary-950A', Ux4gColors.primary950A, '950A'),
              ],
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Secondary',
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PaletteView(
              label: 'Secondary Solid Scale',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch(
                  'secondary',
                  Ux4gColors.secondary,
                  'secondary ★',
                  main: true,
                ),
                _Swatch('secondary-50', Ux4gColors.secondary50, '50'),
                _Swatch('secondary-100', Ux4gColors.secondary100, '100'),
                _Swatch('secondary-200', Ux4gColors.secondary200, '200'),
                _Swatch('secondary-300', Ux4gColors.secondary300, '300'),
                _Swatch('secondary-400', Ux4gColors.secondary400, '400'),
                _Swatch('secondary-500', Ux4gColors.secondary500, '500'),
                _Swatch('secondary-600', Ux4gColors.secondary600, '600'),
                _Swatch('secondary-700', Ux4gColors.secondary700, '700'),
                _Swatch('secondary-800', Ux4gColors.secondary800, '800'),
                _Swatch('secondary-900', Ux4gColors.secondary900, '900'),
                _Swatch('secondary-950', Ux4gColors.secondary950, '950'),
              ],
            ),
            const SizedBox(height: 24),
            _PaletteView(
              label: 'Secondary Alpha Scale (25% Opacity)',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('secondary-50A', Ux4gColors.secondary50A, '50A'),
                _Swatch('secondary-100A', Ux4gColors.secondary100A, '100A'),
                _Swatch('secondary-200A', Ux4gColors.secondary200A, '200A'),
                _Swatch('secondary-300A', Ux4gColors.secondary300A, '300A'),
                _Swatch('secondary-400A', Ux4gColors.secondary400A, '400A'),
                _Swatch('secondary-500A', Ux4gColors.secondary500A, '500A'),
                _Swatch('secondary-600A', Ux4gColors.secondary600A, '600A'),
                _Swatch('secondary-700A', Ux4gColors.secondary700A, '700A'),
                _Swatch('secondary-800A', Ux4gColors.secondary800A, '800A'),
                _Swatch('secondary-900A', Ux4gColors.secondary900A, '900A'),
                _Swatch('secondary-950A', Ux4gColors.secondary950A, '950A'),
              ],
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Tertiary',
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PaletteView(
              label: 'Tertiary Solid Scale',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch(
                  'tertiary',
                  Ux4gColors.tertiary,
                  'tertiary ★',
                  main: true,
                ),
                _Swatch('tertiary-50', Ux4gColors.tertiary50, '50'),
                _Swatch('tertiary-100', Ux4gColors.tertiary100, '100'),
                _Swatch('tertiary-200', Ux4gColors.tertiary200, '200'),
                _Swatch('tertiary-300', Ux4gColors.tertiary300, '300'),
                _Swatch('tertiary-400', Ux4gColors.tertiary400, '400'),
                _Swatch('tertiary-500', Ux4gColors.tertiary500, '500'),
                _Swatch('tertiary-600', Ux4gColors.tertiary600, '600'),
                _Swatch('tertiary-700', Ux4gColors.tertiary700, '700'),
                _Swatch('tertiary-800', Ux4gColors.tertiary800, '800'),
                _Swatch('tertiary-900', Ux4gColors.tertiary900, '900'),
                _Swatch('tertiary-950', Ux4gColors.tertiary950, '950'),
              ],
            ),
            const SizedBox(height: 24),
            _PaletteView(
              label: 'Tertiary Alpha Scale (25% Opacity)',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('tertiary-50A', Ux4gColors.tertiary50A, '50A'),
                _Swatch('tertiary-100A', Ux4gColors.tertiary100A, '100A'),
                _Swatch('tertiary-200A', Ux4gColors.tertiary200A, '200A'),
                _Swatch('tertiary-300A', Ux4gColors.tertiary300A, '300A'),
                _Swatch('tertiary-400A', Ux4gColors.tertiary400A, '400A'),
                _Swatch('tertiary-500A', Ux4gColors.tertiary500A, '500A'),
                _Swatch('tertiary-600A', Ux4gColors.tertiary600A, '600A'),
                _Swatch('tertiary-700A', Ux4gColors.tertiary700A, '700A'),
                _Swatch('tertiary-800A', Ux4gColors.tertiary800A, '800A'),
                _Swatch('tertiary-900A', Ux4gColors.tertiary900A, '900A'),
                _Swatch('tertiary-950A', Ux4gColors.tertiary950A, '950A'),
              ],
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Red (Error)',
      builder: (context) => _PaletteView(
        label: 'Red (Error)',
        swatches: const [
          _Swatch('red', Ux4gColors.red, 'red ★', main: true),
          _Swatch('red-50', Ux4gColors.red50, '50'),
          _Swatch('red-100', Ux4gColors.red100, '100'),
          _Swatch('red-200', Ux4gColors.red200, '200'),
          _Swatch('red-300', Ux4gColors.red300, '300'),
          _Swatch('red-400', Ux4gColors.red400, '400'),
          _Swatch('red-500', Ux4gColors.red500, '500'),
          _Swatch('red-600', Ux4gColors.red600, '600'),
          _Swatch('red-700', Ux4gColors.red700, '700'),
          _Swatch('red-800', Ux4gColors.red800, '800'),
          _Swatch('red-900', Ux4gColors.red900, '900'),
          _Swatch('red-950', Ux4gColors.red950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Orange (Warning)',
      builder: (context) => _PaletteView(
        label: 'Orange (Warning)',
        swatches: const [
          _Swatch('orange', Ux4gColors.orange, 'orange ★', main: true),
          _Swatch('orange-50', Ux4gColors.orange50, '50'),
          _Swatch('orange-100', Ux4gColors.orange100, '100'),
          _Swatch('orange-200', Ux4gColors.orange200, '200'),
          _Swatch('orange-300', Ux4gColors.orange300, '300'),
          _Swatch('orange-400', Ux4gColors.orange400, '400'),
          _Swatch('orange-500', Ux4gColors.orange500, '500'),
          _Swatch('orange-600', Ux4gColors.orange600, '600'),
          _Swatch('orange-700', Ux4gColors.orange700, '700'),
          _Swatch('orange-800', Ux4gColors.orange800, '800'),
          _Swatch('orange-900', Ux4gColors.orange900, '900'),
          _Swatch('orange-950', Ux4gColors.orange950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Yellow',
      builder: (context) => _PaletteView(
        label: 'Yellow',
        swatches: const [
          _Swatch('yellow', Ux4gColors.yellow, 'yellow ★', main: true),
          _Swatch('yellow-50', Ux4gColors.yellow50, '50'),
          _Swatch('yellow-100', Ux4gColors.yellow100, '100'),
          _Swatch('yellow-200', Ux4gColors.yellow200, '200'),
          _Swatch('yellow-300', Ux4gColors.yellow300, '300'),
          _Swatch('yellow-400', Ux4gColors.yellow400, '400'),
          _Swatch('yellow-500', Ux4gColors.yellow500, '500'),
          _Swatch('yellow-600', Ux4gColors.yellow600, '600'),
          _Swatch('yellow-700', Ux4gColors.yellow700, '700'),
          _Swatch('yellow-800', Ux4gColors.yellow800, '800'),
          _Swatch('yellow-900', Ux4gColors.yellow900, '900'),
          _Swatch('yellow-950', Ux4gColors.yellow950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Gold',
      builder: (context) => _PaletteView(
        label: 'Gold',
        swatches: const [
          _Swatch('gold', Ux4gColors.gold, 'gold ★', main: true),
          _Swatch('gold-50', Ux4gColors.gold50, '50'),
          _Swatch('gold-100', Ux4gColors.gold100, '100'),
          _Swatch('gold-200', Ux4gColors.gold200, '200'),
          _Swatch('gold-300', Ux4gColors.gold300, '300'),
          _Swatch('gold-400', Ux4gColors.gold400, '400'),
          _Swatch('gold-500', Ux4gColors.gold500, '500'),
          _Swatch('gold-600', Ux4gColors.gold600, '600'),
          _Swatch('gold-700', Ux4gColors.gold700, '700'),
          _Swatch('gold-800', Ux4gColors.gold800, '800'),
          _Swatch('gold-900', Ux4gColors.gold900, '900'),
          _Swatch('gold-950', Ux4gColors.gold950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Green (Success)',
      builder: (context) => _PaletteView(
        label: 'Green (Success)',
        swatches: const [
          _Swatch('green', Ux4gColors.green, 'green ★', main: true),
          _Swatch('green-50', Ux4gColors.green50, '50'),
          _Swatch('green-100', Ux4gColors.green100, '100'),
          _Swatch('green-200', Ux4gColors.green200, '200'),
          _Swatch('green-300', Ux4gColors.green300, '300'),
          _Swatch('green-400', Ux4gColors.green400, '400'),
          _Swatch('green-500', Ux4gColors.green500, '500'),
          _Swatch('green-600', Ux4gColors.green600, '600'),
          _Swatch('green-700', Ux4gColors.green700, '700'),
          _Swatch('green-800', Ux4gColors.green800, '800'),
          _Swatch('green-900', Ux4gColors.green900, '900'),
          _Swatch('green-950', Ux4gColors.green950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Lime',
      builder: (context) => _PaletteView(
        label: 'Lime',
        swatches: const [
          _Swatch('lime', Ux4gColors.lime, 'lime ★', main: true),
          _Swatch('lime-50', Ux4gColors.lime50, '50'),
          _Swatch('lime-100', Ux4gColors.lime100, '100'),
          _Swatch('lime-200', Ux4gColors.lime200, '200'),
          _Swatch('lime-300', Ux4gColors.lime300, '300'),
          _Swatch('lime-400', Ux4gColors.lime400, '400'),
          _Swatch('lime-500', Ux4gColors.lime500, '500'),
          _Swatch('lime-600', Ux4gColors.lime600, '600'),
          _Swatch('lime-700', Ux4gColors.lime700, '700'),
          _Swatch('lime-800', Ux4gColors.lime800, '800'),
          _Swatch('lime-900', Ux4gColors.lime900, '900'),
          _Swatch('lime-950', Ux4gColors.lime950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Blue (Info)',
      builder: (context) => _PaletteView(
        label: 'Blue (Info)',
        swatches: const [
          _Swatch('blue', Ux4gColors.blue, 'blue ★', main: true),
          _Swatch('blue-50', Ux4gColors.blue50, '50'),
          _Swatch('blue-100', Ux4gColors.blue100, '100'),
          _Swatch('blue-200', Ux4gColors.blue200, '200'),
          _Swatch('blue-300', Ux4gColors.blue300, '300'),
          _Swatch('blue-400', Ux4gColors.blue400, '400'),
          _Swatch('blue-500', Ux4gColors.blue500, '500'),
          _Swatch('blue-600', Ux4gColors.blue600, '600'),
          _Swatch('blue-700', Ux4gColors.blue700, '700'),
          _Swatch('blue-800', Ux4gColors.blue800, '800'),
          _Swatch('blue-900', Ux4gColors.blue900, '900'),
          _Swatch('blue-950', Ux4gColors.blue950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Sky Blue',
      builder: (context) => _PaletteView(
        label: 'Sky Blue',
        swatches: const [
          _Swatch('skyBlue', Ux4gColors.skyBlue, 'skyBlue ★', main: true),
          _Swatch('skyBlue-50', Ux4gColors.skyBlue50, '50'),
          _Swatch('skyBlue-100', Ux4gColors.skyBlue100, '100'),
          _Swatch('skyBlue-200', Ux4gColors.skyBlue200, '200'),
          _Swatch('skyBlue-300', Ux4gColors.skyBlue300, '300'),
          _Swatch('skyBlue-400', Ux4gColors.skyBlue400, '400'),
          _Swatch('skyBlue-500', Ux4gColors.skyBlue500, '500'),
          _Swatch('skyBlue-600', Ux4gColors.skyBlue600, '600'),
          _Swatch('skyBlue-700', Ux4gColors.skyBlue700, '700'),
          _Swatch('skyBlue-800', Ux4gColors.skyBlue800, '800'),
          _Swatch('skyBlue-900', Ux4gColors.skyBlue900, '900'),
          _Swatch('skyBlue-950', Ux4gColors.skyBlue950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Cyan',
      builder: (context) => _PaletteView(
        label: 'Cyan',
        swatches: const [
          _Swatch('cyan', Ux4gColors.cyan, 'cyan ★', main: true),
          _Swatch('cyan-50', Ux4gColors.cyan50, '50'),
          _Swatch('cyan-100', Ux4gColors.cyan100, '100'),
          _Swatch('cyan-200', Ux4gColors.cyan200, '200'),
          _Swatch('cyan-300', Ux4gColors.cyan300, '300'),
          _Swatch('cyan-400', Ux4gColors.cyan400, '400'),
          _Swatch('cyan-500', Ux4gColors.cyan500, '500'),
          _Swatch('cyan-600', Ux4gColors.cyan600, '600'),
          _Swatch('cyan-700', Ux4gColors.cyan700, '700'),
          _Swatch('cyan-800', Ux4gColors.cyan800, '800'),
          _Swatch('cyan-900', Ux4gColors.cyan900, '900'),
          _Swatch('cyan-950', Ux4gColors.cyan950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Purple',
      builder: (context) => _PaletteView(
        label: 'Purple',
        swatches: const [
          _Swatch('purple', Ux4gColors.purple, 'purple ★', main: true),
          _Swatch('purple-50', Ux4gColors.purple50, '50'),
          _Swatch('purple-100', Ux4gColors.purple100, '100'),
          _Swatch('purple-200', Ux4gColors.purple200, '200'),
          _Swatch('purple-300', Ux4gColors.purple300, '300'),
          _Swatch('purple-400', Ux4gColors.purple400, '400'),
          _Swatch('purple-500', Ux4gColors.purple500, '500'),
          _Swatch('purple-600', Ux4gColors.purple600, '600'),
          _Swatch('purple-700', Ux4gColors.purple700, '700'),
          _Swatch('purple-800', Ux4gColors.purple800, '800'),
          _Swatch('purple-900', Ux4gColors.purple900, '900'),
          _Swatch('purple-950', Ux4gColors.purple950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Pink',
      builder: (context) => _PaletteView(
        label: 'Pink',
        swatches: const [
          _Swatch('pink', Ux4gColors.pink, 'pink ★', main: true),
          _Swatch('pink-50', Ux4gColors.pink50, '50'),
          _Swatch('pink-100', Ux4gColors.pink100, '100'),
          _Swatch('pink-200', Ux4gColors.pink200, '200'),
          _Swatch('pink-300', Ux4gColors.pink300, '300'),
          _Swatch('pink-400', Ux4gColors.pink400, '400'),
          _Swatch('pink-500', Ux4gColors.pink500, '500'),
          _Swatch('pink-600', Ux4gColors.pink600, '600'),
          _Swatch('pink-700', Ux4gColors.pink700, '700'),
          _Swatch('pink-800', Ux4gColors.pink800, '800'),
          _Swatch('pink-900', Ux4gColors.pink900, '900'),
          _Swatch('pink-950', Ux4gColors.pink950, '950'),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Neutral',
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PaletteView(
              label: 'Neutral Solid Scale',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('neutral-0', Ux4gColors.neutral0, '0 (white)'),
                _Swatch('neutral-50', Ux4gColors.neutral50, '50'),
                _Swatch('neutral-100', Ux4gColors.neutral100, '100'),
                _Swatch('neutral-200', Ux4gColors.neutral200, '200'),
                _Swatch('neutral-300', Ux4gColors.neutral300, '300'),
                _Swatch('neutral-400', Ux4gColors.neutral400, '400'),
                _Swatch('neutral-500', Ux4gColors.neutral500, '500'),
                _Swatch('neutral-600', Ux4gColors.neutral600, '600'),
                _Swatch('neutral-700', Ux4gColors.neutral700, '700'),
                _Swatch('neutral-800', Ux4gColors.neutral800, '800'),
                _Swatch('neutral-900', Ux4gColors.neutral900, '900'),
                _Swatch('neutral-950', Ux4gColors.neutral950, '950'),
                _Swatch(
                  'neutral-1000black',
                  Ux4gColors.neutral1000black,
                  '1000 (black)',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _PaletteView(
              label: 'Neutral Alpha Scale (25% Opacity)',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('neutral-0A', Ux4gColors.neutral0A, '0A'),
                _Swatch('neutral-50A', Ux4gColors.neutral50A, '50A'),
                _Swatch('neutral-100A', Ux4gColors.neutral100A, '100A'),
                _Swatch('neutral-200A', Ux4gColors.neutral200A, '200A'),
                _Swatch('neutral-300A', Ux4gColors.neutral300A, '300A'),
                _Swatch('neutral-400A', Ux4gColors.neutral400A, '400A'),
                _Swatch('neutral-500A', Ux4gColors.neutral500A, '500A'),
                _Swatch('neutral-600A', Ux4gColors.neutral600A, '600A'),
                _Swatch('neutral-700A', Ux4gColors.neutral700A, '700A'),
                _Swatch('neutral-800A', Ux4gColors.neutral800A, '800A'),
                _Swatch('neutral-900A', Ux4gColors.neutral900A, '900A'),
                _Swatch('neutral-950A', Ux4gColors.neutral950A, '950A'),
                _Swatch('neutral-1000A', Ux4gColors.neutral1000A, '1000A'),
              ],
            ),
            const SizedBox(height: 24),
            _PaletteView(
              label: 'Neutral Beta Scale (70% Opacity)',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('neutral-0B', Ux4gColors.neutral0B, '0B'),
                _Swatch('neutral-950B', Ux4gColors.neutral950B, '950B'),
              ],
            ),
            const SizedBox(height: 24),
            _PaletteView(
              label: 'Legacy Gray Aliases',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('gray-100', Ux4gColors.gray100, 'gray-100'),
                _Swatch('gray-200', Ux4gColors.gray200, 'gray-200'),
                _Swatch('gray-800', Ux4gColors.gray800, 'gray-800'),
                _Swatch('gray-900', Ux4gColors.gray900, 'gray-900'),
              ],
            ),
            const SizedBox(height: 24),
            _PaletteView(
              label: 'Common Colors',
              padding: EdgeInsets.zero,
              swatches: const [
                _Swatch('white', Ux4gColors.white, 'white'),
                _Swatch('transparent', Ux4gColors.transparent, 'transparent'),
              ],
            ),
          ],
        ),
      ),
    ),
    // ── Semantic Tokens ────────────────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'Semantic Tokens',
      builder: (context) {
        final colors = Ux4gTheme.colors(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Semantic Color Tokens',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Theme-aware colors from Ux4gThemeColors — automatically adapt between '
                  'Light and Dark themes. Switch the theme in the addons panel '
                  '(right side) to see the change.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280),
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6A4EFF).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0xFF6A4EFF).withValues(alpha: 0.25),
                    ),
                  ),
                  child: const Text(
                    'final colors = Ux4gTheme.colors(context);\n'
                    '// Use: colors.primary  colors.onPrimary  colors.surface \u2026',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Color(0xFF6A4EFF),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _SemanticTokenRow(
                  pairs: [
                    _SemanticPair(
                      'primary',
                      colors.primary,
                      'onPrimary',
                      colors.onPrimary,
                    ),
                    _SemanticPair(
                      'secondary',
                      colors.secondary,
                      'onSecondary',
                      colors.onSecondary,
                    ),
                    _SemanticPair(
                      'background',
                      colors.background,
                      'onBackground',
                      colors.onBackground,
                    ),
                    _SemanticPair(
                      'surface',
                      colors.surface,
                      'onSurface',
                      colors.onSurface,
                    ),
                    _SemanticPair(
                      'error',
                      colors.error,
                      'onError',
                      colors.onError,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
    // ── How to use ─────────────────────────────────────────────────────
    WidgetbookUseCase(
      name: 'How to use',
      builder: (context) => _DocPage(
        title: 'Using UX4G Colors',
        sections: const [
          _DocSection(
            heading: '⚠️ Migration Notice: Ux4gPalette is Deprecated',
            body:
                'The static color token class Ux4gPalette has been renamed to Ux4gColors (e.g. Ux4gColors.primary600). '
                'Ux4gPalette is retained as a deprecated alias (typedef Ux4gPalette = Ux4gColors;) so existing code continues working, '
                'but please exclusively use Ux4gColors for all new development.',
          ),
          _DocSection(
            heading: '1. Palette Colors  (static, always fixed)',
            body:
                'Ux4gColors provides fixed color constants that never change with '
                'the theme. Use these when you need a very specific shade — for '
                'example, an illustration or a data-visualisation chart that must '
                'always use the same hue.',
          ),
        ],
        codeBlocks: const [
          _CodeBlock(
            label: 'Dart — Ux4gColors',
            code:
                '''import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

// Fixed palette shades
Container(color: Ux4gColors.primary500)       // #6A4EFF  — brand purple
Container(color: Ux4gColors.primary50)        // #F2EFFF  — lightest tint
Container(color: Ux4gColors.primary950)       // #1A0E3D  — darkest shade

Container(color: Ux4gColors.red500)           // #F55E57  — error
Container(color: Ux4gColors.green500)         // #1AA64A  — success
Container(color: Ux4gColors.secondary500)     // #C47D00  — amber
Container(color: Ux4gColors.gray900)          // #121212  — near-black
Container(color: Ux4gColors.white)            // #FFFFFF
Container(color: Ux4gColors.neutral1000black) // #000000''',
          ),
        ],
        trailingSections: const [
          _DocSection(
            heading: '2. Semantic Tokens  (theme-aware, recommended)',
            body:
                '''Ux4gThemeColors holds semantic tokens that automatically switch value when the user changes between Light and Dark themes. Always prefer these inside your own widgets to keep the UI consistent with the rest of the design system.

Available tokens:
  • primary / onPrimary
  • secondary / onSecondary
  • background / onBackground
  • surface / onSurface
  • error / onError''',
          ),
        ],
        trailingCodeBlocks: const [
          _CodeBlock(
            label: 'Dart — Ux4gTheme.colors(context)',
            code:
                '''// Inside any build() method, after Ux4gTheme is in the widget tree:
final colors = Ux4gTheme.colors(context);

// Pair usage — background + foreground
Container(
  color: colors.surface,
  child: Text(
    'Hello',
    style: TextStyle(color: colors.onSurface),
  ),
);

// Available semantic tokens
colors.primary        // Brand primary color
colors.onPrimary      // Text/icon color ON primary background
colors.secondary      // Secondary brand color
colors.onSecondary    // Text/icon color ON secondary background
colors.background     // Page-level background
colors.onBackground   // Text color on background
colors.error          // Error state color
colors.onError        // Text/icon color ON error background''',
          ),
          _CodeBlock(
            label: 'Component theming example',
            code: '''// Inside your widget build() method:
Widget build(BuildContext context) {
  // Step 1: get semantic colors (theme-aware)
  final colors = Ux4gTheme.colors(context);

  // Step 2: pass them to any UX4G component
  return Ux4gAccordion(
    title: 'My Section',
    expanded: _expanded,
    onExpandedChange: (v) => setState(() => _expanded = v),

    // theme-aware — change with Light/Dark toggle
    backgroundColor:      colors.surface,
    expandedBorderColor:  colors.primary,

    // fixed palette shades — always constant
    titleColor:           Ux4gColors.primary600,
    collapsedBorderColor: Ux4gColors.gray200,

    child: Text('Content', style: TextStyle(color: colors.onSurface)),
  );
}''',
          ),
          _CodeBlock(
            label: 'Light vs Dark values',
            code: '''// Light theme
primary    = #6A4EFF   onPrimary    = #FFFFFF
secondary  = #A46800   onSecondary  = #FFFFFF
background = #F5F5F5   onBackground = #121212
surface    = #FFFFFF   onSurface    = #121212
error      = #F55E57   onError      = #FFFFFF

// Dark theme
primary    = #6A4EFF   onPrimary    = #121212
secondary  = #FFBE6F   onSecondary  = #121212
background = #121212   onBackground = #FFFFFF
surface    = #333333   onSurface    = #FFFFFF
error      = #FF8983   onError      = #121212''',
          ),
        ],
      ),
    ),
  ],
);

// ── Theme — Typography ────────────────────────────────────────────────────────

final themeTypographyComponent = WidgetbookComponent(
  name: 'Typography',
  isInitiallyExpanded: false,
  useCases: [
    WidgetbookUseCase(
      name: 'Header',
      builder: (context) {
        final t = Ux4gTheme.typography(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                'Header Tokens',
                'Ux4gTheme.typography(context).h*',
              ),
              const SizedBox(height: 20),
              _TypographyRow(
                tokenName: 'hXXS_default',
                style: t.hXXS_default,
                label: 'Header XXS (Default)',
              ),
              _TypographyRow(
                tokenName: 'hXXS_strong',
                style: t.hXXS_strong,
                label: 'Header XXS (Strong)',
              ),
              _TypographyRow(
                tokenName: 'hXS_default',
                style: t.hXS_default,
                label: 'Header XS (Default)',
              ),
              _TypographyRow(
                tokenName: 'hXS_strong',
                style: t.hXS_strong,
                label: 'Header XS (Strong)',
              ),
              _TypographyRow(
                tokenName: 'hS_default',
                style: t.hS_default,
                label: 'Header S (Default)',
              ),
              _TypographyRow(
                tokenName: 'hS_strong',
                style: t.hS_strong,
                label: 'Header S (Strong)',
              ),
              _TypographyRow(
                tokenName: 'hM_default',
                style: t.hM_default,
                label: 'Header M (Default)',
              ),
              _TypographyRow(
                tokenName: 'hM_strong',
                style: t.hM_strong,
                label: 'Header M (Strong)',
              ),
              _TypographyRow(
                tokenName: 'hL_default',
                style: t.hL_default,
                label: 'Header L (Default)',
              ),
              _TypographyRow(
                tokenName: 'hL_strong',
                style: t.hL_strong,
                label: 'Header L (Strong)',
              ),
              _TypographyRow(
                tokenName: 'hXL_default',
                style: t.hXL_default,
                label: 'Header XL (Default)',
              ),
              _TypographyRow(
                tokenName: 'hXL_strong',
                style: t.hXL_strong,
                label: 'Header XL (Strong)',
              ),
              _TypographyRow(
                tokenName: 'hXXL_default',
                style: t.hXXL_default,
                label: 'Header XXL (Default)',
              ),
              _TypographyRow(
                tokenName: 'hXXL_strong',
                style: t.hXXL_strong,
                label: 'Header XXL (Strong)',
              ),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Display',
      builder: (context) {
        final t = Ux4gTheme.typography(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                'Display Tokens',
                'Ux4gTheme.typography(context).d*',
              ),
              const SizedBox(height: 20),
              _TypographyRow(
                tokenName: 'dXS_default',
                style: t.dXS_default,
                label: 'Display XS (Default)',
              ),
              _TypographyRow(
                tokenName: 'dXS_strong',
                style: t.dXS_strong,
                label: 'Display XS (Strong)',
              ),
              _TypographyRow(
                tokenName: 'dS_default',
                style: t.dS_default,
                label: 'Display S (Default)',
              ),
              _TypographyRow(
                tokenName: 'dS_strong',
                style: t.dS_strong,
                label: 'Display S (Strong)',
              ),
              _TypographyRow(
                tokenName: 'dM_default',
                style: t.dM_default,
                label: 'Display M (Default)',
              ),
              _TypographyRow(
                tokenName: 'dM_strong',
                style: t.dM_strong,
                label: 'Display M (Strong)',
              ),
              _TypographyRow(
                tokenName: 'dL_default',
                style: t.dL_default,
                label: 'Display L (Default)',
              ),
              _TypographyRow(
                tokenName: 'dL_strong',
                style: t.dL_strong,
                label: 'Display L (Strong)',
              ),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Body',
      builder: (context) {
        final t = Ux4gTheme.typography(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                'Body Tokens',
                'Ux4gTheme.typography(context).b*',
              ),
              const SizedBox(height: 20),
              _TypographyRow(
                tokenName: 'bXS_default',
                style: t.bXS_default,
                label: 'Body XS (Default)',
              ),
              _TypographyRow(
                tokenName: 'bXS_strong',
                style: t.bXS_strong,
                label: 'Body XS (Strong)',
              ),
              _TypographyRow(
                tokenName: 'bS_default',
                style: t.bS_default,
                label: 'Body S (Default)',
              ),
              _TypographyRow(
                tokenName: 'bS_strong',
                style: t.bS_strong,
                label: 'Body S (Strong)',
              ),
              _TypographyRow(
                tokenName: 'bM_default',
                style: t.bM_default,
                label: 'Body M (Default)',
              ),
              _TypographyRow(
                tokenName: 'bM_strong',
                style: t.bM_strong,
                label: 'Body M (Strong)',
              ),
              _TypographyRow(
                tokenName: 'bL_default',
                style: t.bL_default,
                label: 'Body L (Default)',
              ),
              _TypographyRow(
                tokenName: 'bL_strong',
                style: t.bL_strong,
                label: 'Body L (Strong)',
              ),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Label',
      builder: (context) {
        final t = Ux4gTheme.typography(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                'Label Tokens',
                'Ux4gTheme.typography(context).l*',
              ),
              const SizedBox(height: 20),
              _TypographyRow(
                tokenName: 'lS_default',
                style: t.lS_default,
                label: 'Label S (Default)',
              ),
              _TypographyRow(
                tokenName: 'lS_strong',
                style: t.lS_strong,
                label: 'Label S (Strong)',
              ),
              _TypographyRow(
                tokenName: 'lM_default',
                style: t.lM_default,
                label: 'Label M (Default)',
              ),
              _TypographyRow(
                tokenName: 'lM_strong',
                style: t.lM_strong,
                label: 'Label M (Strong)',
              ),
              _TypographyRow(
                tokenName: 'lL_default',
                style: t.lL_default,
                label: 'Label L (Default)',
              ),
              _TypographyRow(
                tokenName: 'lL_strong',
                style: t.lL_strong,
                label: 'Label L (Strong)',
              ),
              _TypographyRow(
                tokenName: 'lXL_default',
                style: t.lXL_default,
                label: 'Label XL (Default)',
              ),
              _TypographyRow(
                tokenName: 'lXL_strong',
                style: t.lXL_strong,
                label: 'Label XL (Strong)',
              ),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Title',
      builder: (context) {
        final t = Ux4gTheme.typography(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SectionHeader(
                'Title Tokens',
                'Ux4gTheme.typography(context).t*',
              ),
              const SizedBox(height: 20),
              _TypographyRow(
                tokenName: 'tS_default',
                style: t.tS_default,
                label: 'Title S (Default)',
              ),
              _TypographyRow(
                tokenName: 'tS_strong',
                style: t.tS_strong,
                label: 'Title S (Strong)',
              ),
              _TypographyRow(
                tokenName: 'tM_default',
                style: t.tM_default,
                label: 'Title M (Default)',
              ),
              _TypographyRow(
                tokenName: 'tM_strong',
                style: t.tM_strong,
                label: 'Title M (Strong)',
              ),
              _TypographyRow(
                tokenName: 'tL_default',
                style: t.tL_default,
                label: 'Title L (Default)',
              ),
              _TypographyRow(
                tokenName: 'tL_strong',
                style: t.tL_strong,
                label: 'Title L (Strong)',
              ),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'How to use',
      builder: (context) => const _DocPage(
        title: 'Using UX4G Typography',
        sections: [
          _DocSection(
            heading: '1. Accessing Typography Tokens',
            body:
                'All text styles in UX4G are structured under Ux4gTypography and '
                'are accessible through the theme context using Ux4gTheme.typography(context). '
                'Every scale has both default (standard weight) and strong (bold/semibold weight) variations.',
          ),
        ],
        codeBlocks: [
          _CodeBlock(
            label: 'Dart — Basic Usage',
            code: '''// Inside your widget build() method:
Widget build(BuildContext context) {
  final typography = Ux4gTheme.typography(context);
  final colors = Ux4gTheme.colors(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Government Service Portal',
        style: typography.hL_strong.copyWith(color: colors.onSurface),
      ),
      const SizedBox(height: 8),
      Text(
        'Please review the eligibility criteria carefully before applying.',
        style: typography.bM_default.copyWith(color: colors.onSurface),
      ),
    ],
  );
}''',
          ),
          _CodeBlock(
            label: 'Dart — Modifying Styles with copyWith()',
            code:
                '''// You can customize color, overflow, or alignment via copyWith():
Text(
  'Required field',
  style: Ux4gTheme.typography(context).lS_strong.copyWith(
    color: Ux4gTheme.colors(context).error,
    letterSpacing: 0.5,
  ),
);''',
          ),
        ],
      ),
    ),
  ],
);

// ── Utils — Dimensions ────────────────────────────────────────────────────────

final dimensionsSpacingComponent = WidgetbookComponent(
  name: 'Spacing',
  useCases: [
    WidgetbookUseCase(
      name: 'Scale',
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader('Spacing Tokens', 'Ux4gSpace.*'),
            const SizedBox(height: 16),
            ...[
              ('spaceNone', Ux4gSpace.spaceNone),
              ('space2', Ux4gSpace.space2),
              ('space4', Ux4gSpace.space4),
              ('space6', Ux4gSpace.space6),
              ('space8', Ux4gSpace.space8),
              ('space12', Ux4gSpace.space12),
              ('space16', Ux4gSpace.space16),
              ('space20', Ux4gSpace.space20),
              ('space24', Ux4gSpace.space24),
              ('space32', Ux4gSpace.space32),
              ('space40', Ux4gSpace.space40),
              ('space48', Ux4gSpace.space48),
              ('space56', Ux4gSpace.space56),
              ('space64', Ux4gSpace.space64),
              ('space80', Ux4gSpace.space80),
            ].map((e) => _SpacingRow(token: e.$1, value: e.$2)),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'How to use',
      builder: (context) => const _DocPage(
        title: 'Using UX4G Dimensions',
        sections: [
          _DocSection(
            heading: '1. Spacing  —  Ux4gSpace.*',
            body:
                'Ux4gSpace provides a fixed scale of spacing constants used for '
                'padding, margins, gaps, and SizedBox dimensions. '
                'Always prefer these over raw numeric literals so your layout '
                'stays aligned with the rest of the design system.\n\n'
                'Available values (dp): 0 · 2 · 4 · 6 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 48 · 56 · 64 · 80',
          ),
        ],
        codeBlocks: [
          _CodeBlock(
            label: 'Dart — Ux4gSpace',
            code:
                '''import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

// Padding
Padding(
  padding: const EdgeInsets.all(Ux4gSpace.space16),
  child: Text('Hello'),
);

// Symmetric padding
Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: Ux4gSpace.space24,
    vertical:   Ux4gSpace.space12,
  ),
  child: Text('Hello'),
);

// Gap between widgets
Column(
  children: [
    Text('Item 1'),
    SizedBox(height: Ux4gSpace.space8),
    Text('Item 2'),
    SizedBox(height: Ux4gSpace.space16),
    Text('Item 3'),
  ],
);

// Row gap
Row(
  children: [
    Icon(Icons.check),
    SizedBox(width: Ux4gSpace.space8),
    Text('Done'),
  ],
);''',
          ),
        ],
        trailingSections: [
          _DocSection(
            heading: '2. Border Radius  —  Ux4gRadius.*',
            body:
                'Ux4gRadius defines the corner-rounding scale. '
                'Use radius999 for fully-rounded pill/circle shapes.\n\n'
                'Available values (dp): 0 · 2 · 4 · 8 · 12 · 16 · 24 · 999',
          ),
          _DocSection(
            heading: '3. Border Width  —  Ux4gBorderWidth.*',
            body:
                'Ux4gBorderWidth provides consistent stroke widths.\n\n'
                'none=0  ·  thin=1  ·  thick=2  ·  thicker=3  ·  thickest=4',
          ),
        ],
        trailingCodeBlocks: [
          _CodeBlock(
            label: 'Dart — Ux4gRadius & Ux4gBorderWidth',
            code: '''// Rounded container
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
    border: Border.all(width: Ux4gBorderWidth.thin, color: Colors.grey),
  ),
);

// Pill-shaped button / chip
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(Ux4gRadius.radius999),
  ),
);

// Thicker focus ring
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(Ux4gRadius.radius4),
    border: Border.all(width: Ux4gBorderWidth.thick, color: Colors.blue),
  ),
);''',
          ),
          _CodeBlock(
            label: 'Component example — all three together',
            code: '''// A custom card that uses all three token families
class MyCard extends StatelessWidget {
  const MyCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Ux4gTheme.colors(context);   // theme-aware colors

    return Container(
      padding: const EdgeInsets.all(Ux4gSpace.space16),          // spacing
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(Ux4gRadius.radius12),  // radius
        border: Border.all(
          color: colors.onSurface.withValues(alpha: 0.12),
          width: Ux4gBorderWidth.thin,                            // border
        ),
      ),
      child: child,
    );
  }
}''',
          ),
        ],
      ),
    ),
  ],
);

final dimensionsRadiusComponent = WidgetbookComponent(
  name: 'Border Radius',
  useCases: [
    WidgetbookUseCase(
      name: 'Scale',
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader('Border Radius Tokens', 'Ux4gRadius.*'),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ('radiusNone', Ux4gRadius.radiusNone),
                ('radius2', Ux4gRadius.radius2),
                ('radius4', Ux4gRadius.radius4),
                ('radius8', Ux4gRadius.radius8),
                ('radius12', Ux4gRadius.radius12),
                ('radius16', Ux4gRadius.radius16),
                ('radius24', Ux4gRadius.radius24),
                ('radius999', Ux4gRadius.radius999),
              ].map((e) => _RadiusCard(token: e.$1, value: e.$2)).toList(),
            ),
          ],
        ),
      ),
    ),
  ],
);

final dimensionsBorderComponent = WidgetbookComponent(
  name: 'Border Width',
  useCases: [
    WidgetbookUseCase(
      name: 'Scale',
      builder: (context) => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader('Border Width Tokens', 'Ux4gBorderWidth.*'),
            const SizedBox(height: 16),
            ...[
              ('none', Ux4gBorderWidth.none),
              ('thin', Ux4gBorderWidth.thin),
              ('thick', Ux4gBorderWidth.thick),
              ('thicker', Ux4gBorderWidth.thicker),
              ('thickest', Ux4gBorderWidth.thickest),
            ].map((e) => _BorderWidthRow(token: e.$1, value: e.$2)),
          ],
        ),
      ),
    ),
  ],
);

final dimensionsShadowComponent = WidgetbookComponent(
  name: 'Shadow',
  useCases: [
    WidgetbookUseCase(
      name: 'Scale',
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final titleColor = isDark ? Colors.white : const Color(0xFF111827);
        final subColor = isDark
            ? const Color(0xFF9CA3AF)
            : const Color(0xFF4B5563);

        return SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shadow',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: titleColor,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Five reusable shadow styles. Each combines a key and an ambient shadow to express depth. Apply the matching effect style from UX4G Design System — never hand-set shadow values.',
                style: TextStyle(fontSize: 14.5, color: subColor, height: 1.5),
              ),
              const SizedBox(height: 36),
              Wrap(
                spacing: 24,
                runSpacing: 32,
                children: const [
                  _ShadowCardPreview(
                    level: 0,
                    title: 'Flat Surfaces',
                    details: 'No shadow',
                    tokenName: 'shadow0',
                  ),
                  _ShadowCardPreview(
                    level: 1,
                    title: 'Subtle Lift',
                    details: 'Key 0,1 · blur 2\nAmbient 0,1 · blur 2',
                    tokenName: 'shadow1',
                  ),
                  _ShadowCardPreview(
                    level: 2,
                    title: 'Floating Content',
                    details: 'Key 0,1 · blur 2\nAmbient 0,4 · blur 8',
                    tokenName: 'shadow2',
                  ),
                  _ShadowCardPreview(
                    level: 3,
                    title: 'Prominent overlay',
                    details: 'Key 0,4 · blur 8\nAmbient 0,0 · blur 16',
                    tokenName: 'shadow3',
                  ),
                  _ShadowCardPreview(
                    level: 4,
                    title: 'Highest emphasis',
                    details: 'Key 0,8 · blur 16\nAmbient 0,16 · blur 32',
                    tokenName: 'shadow4',
                  ),
                ],
              ),
              const SizedBox(height: 48),
              _SectionHeader('Shadow Tokens & Code Snippets', 'Ux4gShadow.*'),
              const SizedBox(height: 20),
              const _ShadowCodeRow(
                level: 0,
                tokenName: 'shadow0',
                label: 'Flat Surfaces',
                description: 'No shadow',
              ),
              const _ShadowCodeRow(
                level: 1,
                tokenName: 'shadow1',
                label: 'Subtle Lift',
                description: 'Key 0,1 · blur 2\nAmbient 0,1 · blur 2',
              ),
              const _ShadowCodeRow(
                level: 2,
                tokenName: 'shadow2',
                label: 'Floating Content',
                description: 'Key 0,1 · blur 2\nAmbient 0,4 · blur 8',
              ),
              const _ShadowCodeRow(
                level: 3,
                tokenName: 'shadow3',
                label: 'Prominent overlay',
                description: 'Key 0,4 · blur 8\nAmbient 0,0 · blur 16',
              ),
              const _ShadowCodeRow(
                level: 4,
                tokenName: 'shadow4',
                label: 'Highest emphasis',
                description: 'Key 0,8 · blur 16\nAmbient 0,16 · blur 32',
              ),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'How to use',
      builder: (context) => const _DocPage(
        title: 'Using UX4G Shadow Tokens',
        sections: [
          _DocSection(
            heading: '1. Shadow Levels  —  Ux4gShadow.*',
            body:
                'Ux4gShadow provides 5 BoxShadow lists expressing depth hierarchy. '
                'Using standard shadow tokens ensures consistent lighting angles, opacity, and blur.\n\n'
                'Available tokens:\n'
                '• Ux4gShadow.shadow0 / flat — Flat surfaces without shadows\n'
                '• Ux4gShadow.shadow1 / subtle — Subtle lift (cards, buttons)\n'
                '• Ux4gShadow.shadow2 / floating — Floating content (dropdowns, snackbars)\n'
                '• Ux4gShadow.shadow3 / prominent — Prominent overlays (modals, dialogs)\n'
                '• Ux4gShadow.shadow4 / highest — Highest emphasis (bottom sheets, popups)',
          ),
          _DocSection(
            heading: '2. Theme Adaptation  —  Ux4gShadow.get()',
            body:
                'In dark mode, shadows on dark surfaces need slightly higher alpha opacity to maintain visual separation. '
                'Use `Ux4gShadow.get(level, isDark: isDark)` when you need dynamically adjusted shadows for both light and dark themes.',
          ),
        ],
        codeBlocks: [
          _CodeBlock(
            label: 'Dart — Ux4gShadow in BoxDecoration',
            code:
                '''import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';

// 1. Card with Subtle Lift (Shadow 1)
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(Ux4gRadius.radius12),
    boxShadow: Ux4gShadow.shadow1,
  ),
  child: Text('Card Content'),
);

// 2. Floating Dropdown Menu (Shadow 2)
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
    boxShadow: Ux4gShadow.shadow2,
  ),
  child: DropdownMenu(...),
);

// 3. Dialog or Modal Overlay (Shadow 3)
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(Ux4gRadius.radius16),
    boxShadow: Ux4gShadow.shadow3,
  ),
  child: ModalDialog(...),
);

// 4. Dynamic Theme-aware Shadow
Container(
  decoration: BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.circular(16),
    boxShadow: Ux4gShadow.get(
      2,
      isDark: Theme.of(context).brightness == Brightness.dark,
    ),
  ),
  child: ...,
);''',
          ),
        ],
      ),
    ),
  ],
);

final themeShadowComponent = dimensionsShadowComponent;

// ── Private widgets ───────────────────────────────────────────────────────────

// ── Quick Guide widgets ───────────────────────────────────────────────────────

class _DocSection {
  final String heading;
  final String body;
  const _DocSection({required this.heading, required this.body});
}

class _CodeBlock {
  final String label;
  final String code;
  const _CodeBlock({required this.label, required this.code});
}

class _DocPage extends StatelessWidget {
  final String title;
  final List<_DocSection> sections;
  final List<_CodeBlock> codeBlocks;
  final List<_DocSection> trailingSections;
  final List<_CodeBlock> trailingCodeBlocks;

  const _DocPage({
    required this.title,
    this.sections = const [],
    this.codeBlocks = const [],
    this.trailingSections = const [],
    this.trailingCodeBlocks = const [],
  });

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF6A4EFF);
    final isDark = _isOuterDark(context);
    final titleColor = isDark ? Colors.white : const Color(0xFF111827);
    final bg = isDark ? const Color(0xFF121212) : Colors.white;

    return SizedBox.expand(
      child: ColoredBox(
        color: bg,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: titleColor,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 3,
                  width: 40,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 28),
                ...sections.map((s) => _buildSection(context, s)),
                ...codeBlocks.map((c) => _buildCodeBlock(context, c)),
                ...trailingSections.map((s) => _buildSection(context, s)),
                ...trailingCodeBlocks.map((c) => _buildCodeBlock(context, c)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, _DocSection s) {
    final isDark = _isOuterDark(context);
    final headColor = isDark ? Colors.white : const Color(0xFF111827);
    final bodyColor = isDark
        ? const Color(0xFF9CA3AF)
        : const Color(0xFF4B5563);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.heading,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: headColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            s.body,
            style: TextStyle(fontSize: 14, color: bodyColor, height: 1.65),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(BuildContext context, _CodeBlock c) {
    final isDark = _isOuterDark(context);
    final labelColor = isDark
        ? const Color(0xFF9CA3AF)
        : const Color(0xFF6B7280);

    // Theme-aware code block colors
    final codeBg = isDark ? const Color(0xFF1E1E2E) : const Color(0xFFF3F4F6);
    final codeText = isDark ? const Color(0xFFCDD6F4) : const Color(0xFF374151);
    final border = isDark ? Colors.transparent : const Color(0xFFE5E7EB);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (c.label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                c.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: labelColor,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 52), // Room for button
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: codeBg,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: border),
            ),
            child: Stack(
              clipBehavior: Clip.none, // Allow button to breathe if needed
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 60), // Space for button
                  child: Text(
                    c.code,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      color: codeText,
                      height: 1.6,
                    ),
                  ),
                ),
                Positioned(
                  top: -2, // Slight offset for better alignment
                  right: 0,
                  child: _CopyButton(text: c.code),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CopyButton extends StatefulWidget {
  final String text;
  const _CopyButton({required this.text});

  @override
  State<_CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<_CopyButton> {
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    final isDark = _isOuterDark(context);

    // Theme-aware button colors for high visibility
    final bg = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : const Color(0xFFE5E7EB);
    final textColor = isDark
        ? (_copied ? const Color(0xFFA6E3A1) : const Color(0xFF89DCEB))
        : (_copied ? const Color(0xFF059669) : const Color(0xFF2563EB));

    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: widget.text));
        setState(() => _copied = true);
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) setState(() => _copied = false);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isDark
                ? Colors.white10
                : Colors.black.withValues(alpha: 0.05),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_copied)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(Icons.check, size: 12, color: textColor),
              ),
            Text(
              _copied ? 'Copied!' : 'Copy',
              style: TextStyle(
                fontSize: 11,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Color Palette widgets ─────────────────────────────────────────────────────

class _Swatch {
  final String token;
  final Color color;
  final String label;
  final bool main;
  const _Swatch(this.token, this.color, this.label, {this.main = false});
}

// ── Semantic token helpers ────────────────────────────────────────────────────

class _SemanticPair {
  final String baseToken;
  final Color baseColor;
  final String onToken;
  final Color onColor;
  const _SemanticPair(
    this.baseToken,
    this.baseColor,
    this.onToken,
    this.onColor,
  );
}

class _SemanticTokenRow extends StatelessWidget {
  final List<_SemanticPair> pairs;
  const _SemanticTokenRow({required this.pairs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: pairs.map((pair) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Expanded(
                child: _SemanticTile(
                  token: pair.baseToken,
                  color: pair.baseColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SemanticTile(token: pair.onToken, color: pair.onColor),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _SemanticTile extends StatefulWidget {
  final String token;
  final Color color;
  const _SemanticTile({required this.token, required this.color});

  @override
  State<_SemanticTile> createState() => _SemanticTileState();
}

class _SemanticTileState extends State<_SemanticTile> {
  bool _copied = false;

  String _toHex(Color c) {
    final r = (c.r * 255).toInt();
    final g = (c.g * 255).toInt();
    final b = (c.b * 255).toInt();
    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        (widget.color.r * 0.299 +
            widget.color.g * 0.587 +
            widget.color.b * 0.114) <
        0.5;
    final fg = isDark ? Colors.white : Colors.black87;
    final hex = _toHex(widget.color);
    final dartCode = 'Ux4gTheme.colors(context).${widget.token}';

    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: hex));
            setState(() => _copied = true);
            await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
            if (mounted) setState(() => _copied = false);
          },
          child: Tooltip(
            message: 'Tap to copy $hex',
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'colors.${widget.token}',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: fg,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (_copied) Icon(Icons.check, size: 16, color: fg),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    hex,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'monospace',
                      color: fg.withValues(alpha: 0.75),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: _SwatchTopCopyIcon(
            text: dartCode,
            swatchColor: widget.color,
            tooltip: 'Copy Dart Code ($dartCode)',
          ),
        ),
      ],
    );
  }
}

class _PaletteView extends StatelessWidget {
  final String label;
  final List<_Swatch> swatches;
  final bool compact;
  final EdgeInsetsGeometry padding;

  const _PaletteView({
    required this.label,
    required this.swatches,
    this.compact = false,
    this.padding = const EdgeInsets.all(24),
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final labelColor = isDark ? Colors.white : const Color(0xFF111827);

    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: labelColor,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: swatches
                .map((s) => _SwatchTile(s, compact: compact))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SwatchTile extends StatefulWidget {
  final _Swatch swatch;
  final bool compact;
  const _SwatchTile(this.swatch, {this.compact = false});

  @override
  State<_SwatchTile> createState() => _SwatchTileState();
}

class _SwatchTileState extends State<_SwatchTile> {
  bool _copied = false;

  String _toHex(Color c) {
    final r = (c.r * 255).toInt();
    final g = (c.g * 255).toInt();
    final b = (c.b * 255).toInt();
    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  bool _isDark(Color c) => (c.r * 0.299 + c.g * 0.587 + c.b * 0.114) < 0.5;

  @override
  Widget build(BuildContext context) {
    final hex = _toHex(widget.swatch.color);
    final fg = _isDark(widget.swatch.color) ? Colors.white : Colors.black;
    final w = widget.compact ? 160.0 : 220.0;
    final h = widget.compact ? 64.0 : 76.0;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final codeSnippet = 'Ux4gColors.${widget.swatch.token.replaceAll('-', '')}';

    return Container(
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: widget.swatch.main
            ? Border.all(color: const Color(0xFF6A4EFF), width: 2)
            : Border.all(
                color: isDarkTheme ? Colors.white12 : const Color(0xFFE5E7EB),
              ),
        boxShadow: isDarkTheme
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: hex));
                  setState(() => _copied = true);
                  await Future.delayed(
                    const Duration(seconds: 1, milliseconds: 500),
                  );
                  if (mounted) setState(() => _copied = false);
                },
                child: Tooltip(
                  message: 'Tap to copy $hex',
                  child: Container(
                    height: h,
                    decoration: BoxDecoration(
                      color: widget.swatch.color,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(7),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _copied
                        ? Icon(Icons.check, color: fg, size: 20)
                        : null,
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: _SwatchTopCopyIcon(
                  text: hex,
                  swatchColor: widget.swatch.color,
                  tooltip: 'Copy Hex Code ($hex)',
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDarkTheme ? const Color(0xFF1E1E2E) : Colors.white,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(7),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.swatch.label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: isDarkTheme
                              ? Colors.white
                              : const Color(0xFF111827),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      hex,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'monospace',
                        color: isDarkTheme
                            ? Colors.white60
                            : const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isDarkTheme
                        ? Colors.white.withValues(alpha: 0.05)
                        : const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          codeSnippet,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'monospace',
                            color: Color(0xFF6A4EFF),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      _MiniCopyIcon(
                        text: codeSnippet,
                        tooltip: 'Copy Dart Code ($codeSnippet)',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SwatchTopCopyIcon extends StatefulWidget {
  final String text;
  final Color swatchColor;
  final String tooltip;
  const _SwatchTopCopyIcon({
    required this.text,
    required this.swatchColor,
    required this.tooltip,
  });

  @override
  State<_SwatchTopCopyIcon> createState() => _SwatchTopCopyIconState();
}

class _SwatchTopCopyIconState extends State<_SwatchTopCopyIcon> {
  bool _copied = false;

  bool _isDark(Color c) => (c.r * 0.299 + c.g * 0.587 + c.b * 0.114) < 0.5;

  @override
  Widget build(BuildContext context) {
    final isDarkSwatch = _isDark(widget.swatchColor);
    final iconColor = _copied
        ? (isDarkSwatch ? const Color(0xFFA6E3A1) : const Color(0xFF059669))
        : (isDarkSwatch ? Colors.white : Colors.black87);
    final bgColor = isDarkSwatch
        ? Colors.white.withValues(alpha: 0.2)
        : Colors.black.withValues(alpha: 0.08);

    return Tooltip(
      message: _copied ? 'Copied!' : widget.tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: widget.text));
          setState(() => _copied = true);
          await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
          if (mounted) setState(() => _copied = false);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            _copied ? Icons.check : Icons.content_copy,
            size: 13,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

class _MiniCopyIcon extends StatefulWidget {
  final String text;
  final String tooltip;
  const _MiniCopyIcon({required this.text, required this.tooltip});

  @override
  State<_MiniCopyIcon> createState() => _MiniCopyIconState();
}

class _MiniCopyIconState extends State<_MiniCopyIcon> {
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeColor = isDark
        ? const Color(0xFFA6E3A1)
        : const Color(0xFF059669);
    final idleColor = isDark ? Colors.white54 : const Color(0xFF6B7280);

    return Tooltip(
      message: _copied ? 'Copied!' : widget.tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: widget.text));
          setState(() => _copied = true);
          await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
          if (mounted) setState(() => _copied = false);
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(
            _copied ? Icons.check : Icons.content_copy,
            size: 13,
            color: _copied ? activeColor : idleColor,
          ),
        ),
      ),
    );
  }
}

// ── Typography widgets ────────────────────────────────────────────────────────

String _fontWeightName(FontWeight? w) {
  if (w == FontWeight.w100) return 'w100 (Thin)';
  if (w == FontWeight.w200) return 'w200 (Extra Light)';
  if (w == FontWeight.w300) return 'w300 (Light)';
  if (w == FontWeight.w400) return 'w400 (Regular)';
  if (w == FontWeight.w500) return 'w500 (Medium)';
  if (w == FontWeight.w600) return 'w600 (SemiBold)';
  if (w == FontWeight.w700) return 'w700 (Bold)';
  if (w == FontWeight.w800) return 'w800 (Extra Bold)';
  if (w == FontWeight.w900) return 'w900 (Black)';
  return w?.toString() ?? 'Normal';
}

class _TypographyRow extends StatelessWidget {
  final String tokenName;
  final TextStyle style;
  final String label;

  const _TypographyRow({
    required this.tokenName,
    required this.style,
    required this.label,
  });

  Widget _propPill(String text, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF6A4EFF).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6A4EFF),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _isOuterDark(context);
    final cardBg = isDark ? const Color(0xFF1E1E2E) : Colors.white;
    final borderColor = isDark ? Colors.white12 : const Color(0xFFE5E7EB);
    final labelColor = isDark ? Colors.white : const Color(0xFF111827);
    final codeBg = isDark ? const Color(0xFF121212) : const Color(0xFFF3F4F6);
    final codeColor = isDark
        ? const Color(0xFFCDD6F4)
        : const Color(0xFF374151);

    final fontSize = style.fontSize?.toStringAsFixed(0) ?? '?';
    final fontWeightStr = _fontWeightName(style.fontWeight);
    final heightVal = style.height ?? 1.0;
    final lineHeightPx = ((style.fontSize ?? 14) * heightVal).toStringAsFixed(
      0,
    );
    final codeSnippet = 'Ux4gTheme.typography(context).$tokenName';

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: labelColor,
                ),
              ),
              _propPill('Size: ${fontSize}px', isDark),
              _propPill('Weight: $fontWeightStr', isDark),
              _propPill('Line height: ${lineHeightPx}px', isDark),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: codeBg,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark ? Colors.white10 : const Color(0xFFE5E7EB),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SelectableText(
                    codeSnippet,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12.5,
                      color: codeColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _CopyButton(text: codeSnippet),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Dimensions widgets ────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final String token;
  const _SectionHeader(this.title, this.token);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : const Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFF6A4EFF).withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            token,
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: Color(0xFF6A4EFF),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShadowCardPreview extends StatelessWidget {
  final int level;
  final String title;
  final String details;
  final String tokenName;

  const _ShadowCardPreview({
    required this.level,
    required this.title,
    required this.details,
    required this.tokenName,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF1E1E2E) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF111827);
    final subColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    final activeShadows = Ux4gShadow.get(level, isDark: isDark);

    return SizedBox(
      width: 175,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 175,
            height: 175,
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(16),
              boxShadow: activeShadows,
              border: level == 0
                  ? Border.all(
                      color: isDark ? Colors.white12 : const Color(0xFFE5E7EB),
                    )
                  : (isDark
                        ? Border.all(
                            color: Colors.white.withValues(alpha: 0.06),
                          )
                        : null),
            ),
            alignment: Alignment.center,
            child: Text(
              'Shadow $level',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            details,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11.5, color: subColor, height: 1.45),
          ),
        ],
      ),
    );
  }
}

class _ShadowCodeRow extends StatelessWidget {
  final int level;
  final String tokenName;
  final String label;
  final String description;

  const _ShadowCodeRow({
    required this.level,
    required this.tokenName,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF1E1E2E) : Colors.white;
    final borderColor = isDark ? Colors.white12 : const Color(0xFFE5E7EB);
    final labelColor = isDark ? Colors.white : const Color(0xFF111827);
    final subColor = isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280);
    final codeBg = isDark ? const Color(0xFF121212) : const Color(0xFFF3F4F6);
    final codeColor = isDark
        ? const Color(0xFFCDD6F4)
        : const Color(0xFF374151);
    final codeSnippet = 'Ux4gShadow.$tokenName';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF6A4EFF).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Shadow $level',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF6A4EFF),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: labelColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description.replaceAll('\n', ' • '),
            style: TextStyle(fontSize: 12, color: subColor),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: codeBg,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isDark ? Colors.white10 : const Color(0xFFE5E7EB),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SelectableText(
                    codeSnippet,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      color: codeColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _CopyButton(text: codeSnippet),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpacingRow extends StatelessWidget {
  final String token;
  final double value;
  const _SpacingRow({required this.token, required this.value});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 160,
            child: Text(
              'Ux4gSpace.$token',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: isDark ? Colors.white70 : const Color(0xFF374151),
              ),
            ),
          ),
          Container(
            width: value == 0 ? 2 : value.clamp(2, 320),
            height: 20,
            decoration: BoxDecoration(
              color: const Color(0xFF6A4EFF).withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${value.toStringAsFixed(0)}px',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white38 : const Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _RadiusCard extends StatelessWidget {
  final String token;
  final double value;
  const _RadiusCard({required this.token, required this.value});

  @override
  Widget build(BuildContext context) {
    final r = value.clamp(0, 40).toDouble();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: const Color(0xFF6A4EFF).withValues(alpha: 0.12),
            border: Border.all(
              color: const Color(0xFF6A4EFF).withValues(alpha: 0.5),
            ),
            borderRadius: BorderRadius.circular(r),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          token,
          style: TextStyle(
            fontFamily: 'monospace',
            fontSize: 11,
            color: isDark ? Colors.white70 : const Color(0xFF374151),
          ),
        ),
        Text(
          '${value.toStringAsFixed(0)}px',
          style: TextStyle(
            fontSize: 11,
            color: isDark ? Colors.white38 : const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}

class _BorderWidthRow extends StatelessWidget {
  final String token;
  final double value;
  const _BorderWidthRow({required this.token, required this.value});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            child: Text(
              'Ux4gBorderWidth.$token',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: isDark ? Colors.white70 : const Color(0xFF374151),
              ),
            ),
          ),
          Container(
            width: 120,
            height: value == 0 ? 1 : value,
            color: const Color(0xFF6A4EFF),
          ),
          const SizedBox(width: 12),
          Text(
            value == 0 ? 'none' : '${value.toStringAsFixed(0)}px',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white38 : const Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
