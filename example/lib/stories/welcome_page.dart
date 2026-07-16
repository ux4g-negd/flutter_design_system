import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme_notifier.dart';

// Retained icons to ensure Flutter's icon tree-shaking (--tree-shake-icons)
// preserves them when referenced inside non-const card constructors.
const List<IconData> _retainedIcons = [
  Icons.account_tree_outlined,
  Icons.accessibility_new_rounded,
  Icons.palette_outlined,
  Icons.code_rounded,
  Icons.widgets_outlined,
  Icons.style_outlined,
  Icons.dashboard_customize_outlined,
];

class Ux4gWelcomePage extends StatelessWidget {
  const Ux4gWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    assert(_retainedIcons.isNotEmpty);
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: widgetbookThemeNotifier,
      builder: (context, mode, _) {
        final theme = Theme.of(context);
        final bool isDark;
        if (mode == ThemeMode.dark) {
          isDark = true;
        } else if (mode == ThemeMode.light) {
          isDark = false;
        } else {
          isDark = theme.brightness == Brightness.dark;
        }

        final bg = isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC);
        final onSurface = isDark ? Colors.white : const Color(0xFF0F172A);
        final subColor = isDark
            ? const Color(0xFF94A3B8)
            : const Color(0xFF4B5563);
        final primary = const Color(0xFF4F46E5);

        return Scaffold(
          backgroundColor: bg,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(-0.5, -1.0),
                end: const Alignment(1.0, 0.5),
                stops: const [0.0, 0.52, 0.82, 1.0],
                colors: isDark
                    ? const [
                        Color(0xFF0F172A),
                        Color(0xFF0F172A),
                        Color(0xFF1E1B4B),
                        Color(0xFF312E81),
                      ]
                    : const [
                        Color(0xFFFFFFFF),
                        Color(0xFFFFFFFF),
                        Color(0xFFE4E1F3),
                        Color(0xFFDAD5F0),
                      ],
              ),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop = constraints.maxWidth >= 960;
                final isTablet = constraints.maxWidth >= 640 && !isDesktop;
                final maxW = constraints.maxWidth > 1150
                    ? 1150.0
                    : constraints.maxWidth;

                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop
                        ? 48
                        : isTablet
                        ? 32
                        : 20,
                    vertical: isDesktop ? 64 : 32,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxW),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── 1. HERO SECTION ──────────────────────────────────────────────────
                          _buildHeroSection(
                            context,
                            isDesktop,
                            isDark,
                            onSurface,
                            subColor,
                            primary,
                          ),

                          SizedBox(height: isDesktop ? 96 : 64),

                          // ── 2. CORE STRENGTHS SECTION ────────────────────────────────────────
                          _buildCoreStrengthsSection(
                            context,
                            isDesktop,
                            isDark,
                            onSurface,
                            subColor,
                            primary,
                          ),

                          SizedBox(height: isDesktop ? 96 : 64),

                          // ── 3. LIBRARY MAP SECTION ───────────────────────────────────────────
                          _buildLibraryMapSection(
                            context,
                            isDesktop,
                            isDark,
                            onSurface,
                            subColor,
                            primary,
                          ),

                          SizedBox(height: isDesktop ? 80 : 56),

                          // ── 4. FOOTER ────────────────────────────────────────────────────────
                          _buildFooter(
                            context,
                            isDesktop,
                            isDark,
                            subColor,
                            primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeroSection(
    BuildContext context,
    bool isDesktop,
    bool isDark,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    final leftSide = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // UX4G Title Logo
        SvgPicture.asset('assets/ux4g_logo.svg', height: isDesktop ? 48 : 36),
        const SizedBox(height: 12),
        Text(
          'Flutter Documentation | UX4G Design System',
          style: TextStyle(
            fontSize: isDesktop ? 46 : 32,
            fontWeight: FontWeight.w900,
            color: onSurface,
            letterSpacing: -1.2,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 12),
        // Version Tag
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF312E81).withValues(alpha: 0.5)
                : const Color(0xFFEDE9FE),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: isDark
                  ? const Color(0xFF6366F1).withValues(alpha: 0.3)
                  : const Color(0xFFDDD6FE),
            ),
          ),
          child: Text(
            '3.0',
            style: TextStyle(
              color: isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9),
              fontWeight: FontWeight.w800,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Tagline
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Government-grade UI foundations for '),
              TextSpan(
                text: 'trusted\n',
                // style: TextStyle(
                //   color: isDark
                //       ? const Color(0xFFFBBF24)
                //       : const Color(0xFFD97706),
                // ),
              ),
              TextSpan(text: 'public digital experiences.'),
            ],
          ),
          style: TextStyle(
            fontSize: isDesktop ? 22 : 18,
            fontWeight: FontWeight.w700,
            color: onSurface,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 16),
        // Description
        Text(
          'UX4G gives product, design, and engineering teams one coherent\n'
          'system for building accessible, consistent, and scalable citizen-\n'
          'facing services.',
          style: TextStyle(
            fontSize: isDesktop ? 16 : 15,
            color: subColor,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        // Buttons
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            ElevatedButton(
              onPressed: () {
                final state = WidgetbookState.maybeOf(context);
                // ignore: invalid_use_of_internal_member
                state?.updatePath('quick-start-guide/installation');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Text('Get Started'),
            ),
            OutlinedButton(
              onPressed: () {
                final state = WidgetbookState.maybeOf(context);
                // ignore: invalid_use_of_internal_member
                state?.updatePath('components/accordion/standard/single');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: isDark
                    ? Colors.white
                    : const Color(0xFF334155),
                side: BorderSide(
                  color: isDark ? Colors.white24 : const Color(0xFFCBD5E1),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Text('Component Library'),
            ),
          ],
        ),
      ],
    );

    final rightSide = _OverviewCard(
      isDark: isDark,
      onSurface: onSurface,
      subColor: subColor,
      primary: primary,
    );

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 11, child: leftSide),
          const SizedBox(width: 48),
          Expanded(flex: 9, child: rightSide),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [leftSide, const SizedBox(height: 40), rightSide],
      );
    }
  }

  Widget _buildCoreStrengthsSection(
    BuildContext context,
    bool isDesktop,
    bool isDark,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Core strengths',
          style: TextStyle(
            color: isDark ? const Color(0xFFA5B4FC) : const Color(0xFF4A2BC2),
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Built for design systems that need\nto scale beyond one product team.',
          style: TextStyle(
            color: onSurface,
            fontSize: isDesktop ? 32 : 24,
            fontWeight: FontWeight.w800,
            height: 1.25,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'UX4G combines visual consistency, engineering pragmatism, and accessibility\n'
          'expectations into a single documentation experience.',
          style: TextStyle(color: subColor, fontSize: 15.5, height: 1.55),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, box) {
            final w = box.maxWidth;
            final cols = w >= 768 ? 2 : 1;
            final cardW = cols == 2 ? (w - 20) / 2 : w;

            if (cols == 2) {
              return Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _StrengthCard(
                            icon: Icons.account_tree_outlined,
                            title: 'Scalable Architecture',
                            description:
                                'A structured system of foundations, patterns, and components that can scale across ministries, vendors, and service teams.',
                            isDark: isDark,
                            onSurface: onSurface,
                            subColor: subColor,
                            primary: primary,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _StrengthCard(
                            icon: Icons.accessibility_new_rounded,
                            title: 'Accessible Components',
                            description:
                                'Interaction patterns are designed for clarity, contrast, keyboard use, and dependable public-facing experiences.',
                            isDark: isDark,
                            onSurface: onSurface,
                            subColor: subColor,
                            primary: primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _StrengthCard(
                            icon: Icons.palette_outlined,
                            title: 'Token-Driven Design',
                            description:
                                'Color, typography, spacing, and elevation are governed through reusable tokens that keep every experience aligned.',
                            isDark: isDark,
                            onSurface: onSurface,
                            subColor: subColor,
                            primary: primary,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _StrengthCard(
                            icon: Icons.code_rounded,
                            title: 'Developer Friendly',
                            description:
                                'Composable utilities, production-ready components, and Storybook documentation reduce friction from exploration to delivery.',
                            isDark: isDark,
                            onSurface: onSurface,
                            subColor: subColor,
                            primary: primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: cardW,
                    child: _StrengthCard(
                      icon: Icons.account_tree_outlined,
                      title: 'Scalable Architecture',
                      description:
                          'A structured system of foundations, patterns, and components that can scale across ministries, vendors, and service teams.',
                      isDark: isDark,
                      onSurface: onSurface,
                      subColor: subColor,
                      primary: primary,
                    ),
                  ),
                  SizedBox(
                    width: cardW,
                    child: _StrengthCard(
                      icon: Icons.accessibility_new_rounded,
                      title: 'Accessible Components',
                      description:
                          'Interaction patterns are designed for clarity, contrast, keyboard use, and dependable public-facing experiences.',
                      isDark: isDark,
                      onSurface: onSurface,
                      subColor: subColor,
                      primary: primary,
                    ),
                  ),
                  SizedBox(
                    width: cardW,
                    child: _StrengthCard(
                      icon: Icons.palette_outlined,
                      title: 'Token-Driven Design',
                      description:
                          'Color, typography, spacing, and elevation are governed through reusable tokens that keep every experience aligned.',
                      isDark: isDark,
                      onSurface: onSurface,
                      subColor: subColor,
                      primary: primary,
                    ),
                  ),
                  SizedBox(
                    width: cardW,
                    child: _StrengthCard(
                      icon: Icons.code_rounded,
                      title: 'Developer Friendly',
                      description:
                          'Composable utilities, production-ready components, and Storybook documentation reduce friction from exploration to delivery.',
                      isDark: isDark,
                      onSurface: onSurface,
                      subColor: subColor,
                      primary: primary,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildLibraryMapSection(
    BuildContext context,
    bool isDesktop,
    bool isDark,
    Color onSurface,
    Color subColor,
    Color primary,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Library map',
          style: TextStyle(
            color: isDark ? const Color(0xFFA5B4FC) : const Color(0xFF4A2BC2),
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Navigate the design system through the same\ncategories shown in the Storybook sidebar.',
          style: TextStyle(
            color: onSurface,
            fontSize: isDesktop ? 32 : 24,
            fontWeight: FontWeight.w800,
            height: 1.25,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Components, tokens, and Patterns are organized to help teams move from exploration to\n'
          'implementation without losing context.',
          style: TextStyle(color: subColor, fontSize: 15.5, height: 1.55),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, box) {
            final w = box.maxWidth;
            final cols = w >= 768 ? 2 : 1;
            final cardW = cols == 2 ? (w - 20) / 2 : w;

            if (cols == 2) {
              return Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: _MapCard(
                            icon: Icons.widgets_outlined,
                            title: 'Components',
                            description:
                                'Form controls, navigation, feedback, and layout primitives designed for real government workflows.',
                            bullets: const [
                              'Production-ready UI building blocks',
                              'Interactive states documented in Storybook',
                              'Consistent anatomy across surfaces',
                            ],
                            isDark: isDark,
                            onSurface: onSurface,
                            subColor: subColor,
                            primary: primary,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _MapCard(
                            icon: Icons.style_outlined,
                            title: 'Tokens',
                            description:
                                'Core design decisions captured as reusable color, typography, spacing, and semantic values.',
                            bullets: const [
                              'Brand and neutral palettes',
                              'Semantic mappings for surfaces and states',
                              'A shared source of truth for scale',
                            ],
                            isDark: isDark,
                            onSurface: onSurface,
                            subColor: subColor,
                            primary: primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _MapCard(
                          icon: Icons.dashboard_customize_outlined,
                          title: 'Patterns',
                          description:
                              'Reusable block-level compositions like headers, footers, and complex forms used across applications.',
                          bullets: const [
                            'Pre-built structural blocks',
                            'Streamlined composition',
                            'Accelerated feature delivery',
                          ],
                          isDark: isDark,
                          onSurface: onSurface,
                          subColor: subColor,
                          primary: primary,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              );
            } else {
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: cardW,
                    child: _MapCard(
                      icon: Icons.widgets_outlined,
                      title: 'Components',
                      description:
                          'Form controls, navigation, feedback, and layout primitives designed for real government workflows.',
                      bullets: const [
                        'Production-ready UI building blocks',
                        'Interactive states documented in Storybook',
                        'Consistent anatomy across surfaces',
                      ],
                      isDark: isDark,
                      onSurface: onSurface,
                      subColor: subColor,
                      primary: primary,
                    ),
                  ),
                  SizedBox(
                    width: cardW,
                    child: _MapCard(
                      icon: Icons.style_outlined,
                      title: 'Tokens',
                      description:
                          'Core design decisions captured as reusable color, typography, spacing, and semantic values.',
                      bullets: const [
                        'Brand and neutral palettes',
                        'Semantic mappings for surfaces and states',
                        'A shared source of truth for scale',
                      ],
                      isDark: isDark,
                      onSurface: onSurface,
                      subColor: subColor,
                      primary: primary,
                    ),
                  ),
                  SizedBox(
                    width: cardW,
                    child: _MapCard(
                      icon: Icons.dashboard_customize_outlined,
                      title: 'Patterns',
                      description:
                          'Reusable block-level compositions like headers, footers, and complex forms used across applications.',
                      bullets: const [
                        'Pre-built structural blocks',
                        'Streamlined composition',
                        'Accelerated feature delivery',
                      ],
                      isDark: isDark,
                      onSurface: onSurface,
                      subColor: subColor,
                      primary: primary,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildFooter(
    BuildContext context,
    bool isDesktop,
    bool isDark,
    Color subColor,
    Color primary,
  ) {
    return Column(
      children: [
        Divider(color: isDark ? Colors.white12 : const Color(0xFFE5E7EB)),
        const SizedBox(height: 32),
        if (isDesktop)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/ux4g_logo.svg', height: 26),
                  const SizedBox(width: 16),
                  Text(
                    'A shared platform for accessible, consistent, and reliable public digital products.',
                    style: TextStyle(fontSize: 13, color: subColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Visit:',
                    style: TextStyle(fontSize: 14, color: subColor),
                  ),
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: () => launchUrl(
                      Uri.parse('https://www.ux4g.gov.in'),
                      webOnlyWindowName: '_blank',
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    child: Text(
                      'ux4g.gov.in',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark ? const Color(0xFFA5B4FC) : primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/ux4g_logo.svg', height: 26),
              const SizedBox(height: 6),
              Text(
                'A shared platform for accessible, consistent, and reliable public digital products.',
                style: TextStyle(fontSize: 13, color: subColor),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Visit:',
                    style: TextStyle(fontSize: 14, color: subColor),
                  ),
                  const SizedBox(width: 6),
                  InkWell(
                    onTap: () => launchUrl(
                      Uri.parse('https://www.ux4g.gov.in'),
                      webOnlyWindowName: '_blank',
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    child: Text(
                      'ux4g.gov.in',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDark ? const Color(0xFFA5B4FC) : primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        const SizedBox(height: 48),
      ],
    );
  }
}

// ── OVERVIEW CARD WIDGET ─────────────────────────────────────────────────────────────

class _OverviewCard extends StatelessWidget {
  final bool isDark;
  final Color onSurface;
  final Color subColor;
  final Color primary;

  const _OverviewCard({
    required this.isDark,
    required this.onSurface,
    required this.subColor,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.3)
                : const Color(0xFF4F46E5).withValues(alpha: 0.08),
            blurRadius: 36,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header pill
          Row(
            children: [
              Text(
                'System overview',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? const Color(0xFFA5B4FC)
                      : const Color(0xFF4A2BC2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'One platform for\nconsistent public\nservice journeys.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: onSurface,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Start from shared tokens, move into\nreusable components, and document\ndelivery paths in one place.',
            style: TextStyle(fontSize: 13.5, color: subColor, height: 1.5),
          ),
          const SizedBox(height: 24),
          // Stats Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isDark ? Colors.white12 : const Color(0xFFF1F5F9),
                ),
                bottom: BorderSide(
                  color: isDark ? Colors.white12 : const Color(0xFFF1F5F9),
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StatItem(
                  val: '45+',
                  label: 'Reusable\ncomponents',
                  isDark: isDark,
                  onSurface: onSurface,
                  subColor: subColor,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 42,
                      width: 1,
                      color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                    ),
                  ),
                ),
                _StatItem(
                  val: '1K+',
                  label: 'Design\ntokens',
                  isDark: isDark,
                  onSurface: onSurface,
                  subColor: subColor,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 42,
                      width: 1,
                      color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                    ),
                  ),
                ),
                _StatItem(
                  val: '10+',
                  label: 'Patterns',
                  isDark: isDark,
                  onSurface: onSurface,
                  subColor: subColor,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 42,
                      width: 1,
                      color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
                    ),
                  ),
                ),
                _StatItem(
                  val: 'AA',
                  label: 'Accessibility\ntarget',
                  isDark: isDark,
                  onSurface: onSurface,
                  subColor: subColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Table items
          _TableItem(
            category: 'Tokens',
            desc: 'Spacing, Radius, Colors',
            isDark: isDark,
            onSurface: onSurface,
            subColor: subColor,
          ),
          const SizedBox(height: 14),
          _TableItem(
            category: 'Components',
            desc: 'Inputs, buttons, cards',
            isDark: isDark,
            onSurface: onSurface,
            subColor: subColor,
          ),
          const SizedBox(height: 14),
          _TableItem(
            category: 'Patterns',
            desc: 'Headers, footers, forms',
            isDark: isDark,
            onSurface: onSurface,
            subColor: subColor,
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String val;
  final String label;
  final bool isDark;
  final Color onSurface;
  final Color subColor;

  const _StatItem({
    required this.val,
    required this.label,
    required this.isDark,
    required this.onSurface,
    required this.subColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          val,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: subColor, height: 1.3),
        ),
      ],
    );
  }
}

class _TableItem extends StatelessWidget {
  final String category;
  final String desc;
  final bool isDark;
  final Color onSurface;
  final Color subColor;

  const _TableItem({
    required this.category,
    required this.desc,
    required this.isDark,
    required this.onSurface,
    required this.subColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
            color: onSurface,
          ),
        ),
        Text(desc, style: TextStyle(fontSize: 13, color: subColor)),
      ],
    );
  }
}

// ── STRENGTH CARD WIDGET ─────────────────────────────────────────────────────────────

class _StrengthCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isDark;
  final Color onSurface;
  final Color subColor;
  final Color primary;

  const _StrengthCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isDark,
    required this.onSurface,
    required this.subColor,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 184),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
        ),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark
                  ? primary.withValues(alpha: 0.2)
                  : const Color(0xFFF3F0FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: isDark ? const Color(0xFFA5B4FC) : const Color(0xFF6D28D9),
              size: 20,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: onSurface,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: subColor, fontSize: 13.5, height: 1.55),
          ),
        ],
      ),
    );
  }
}

// ── MAP CARD WIDGET ──────────────────────────────────────────────────────────────────

class _MapCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> bullets;
  final bool isDark;
  final Color onSurface;
  final Color subColor;
  final Color primary;

  const _MapCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.bullets,
    required this.isDark,
    required this.onSurface,
    required this.subColor,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 255),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white12 : const Color(0xFFE2E8F0),
        ),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark
                  ? primary.withValues(alpha: 0.2)
                  : const Color(0xFFF3F0FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: isDark ? const Color(0xFFA5B4FC) : const Color(0xFF6D28D9),
              size: 20,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: onSurface,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: subColor, fontSize: 13.5, height: 1.55),
          ),
          const SizedBox(height: 16),
          ...bullets.map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: TextStyle(
                      color: isDark ? const Color(0xFFA5B4FC) : primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      b,
                      style: TextStyle(
                        color: onSurface,
                        fontSize: 13.5,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
