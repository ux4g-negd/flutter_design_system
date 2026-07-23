import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

// ── Accordion ─────────────────────────────────────────────────────────────────

class _AccordionShowcase extends StatefulWidget {
  const _AccordionShowcase();

  @override
  State<_AccordionShowcase> createState() => _AccordionShowcaseState();
}

class _AccordionShowcaseState extends State<_AccordionShowcase> {
  bool _exp1 = false;
  bool _exp2 = false;
  bool _exp3 = false;
  bool _exp4 = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Simple Accordion Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Live previews taken directly from the simple Accordion showcase blocks in src/index.html.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDark ? Colors.white60 : Colors.grey[700],
                ),
          ),
          const SizedBox(height: 32),
          Text(
            'Title Left, Arrow Right',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : const Color(0xFF334155),
                ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2130) : Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: isDark ? const Color(0xFF2D3348) : Colors.grey.shade200,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Ux4gAccordion(
                  title: 'Accordion Item',
                  expanded: _exp1,
                  onExpandedChange: (v) => setState(() => _exp1 = v),
                  child: const Text('Accordion content goes here.'),
                ),
                Ux4gAccordion(
                  title: 'Accordion Item',
                  expanded: _exp2,
                  onExpandedChange: (v) => setState(() => _exp2 = v),
                  child: const Text('Accordion content goes here.'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Text(
            'Arrow Left + Title',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : const Color(0xFF334155),
                ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2130) : Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: isDark ? const Color(0xFF2D3348) : Colors.grey.shade200,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Ux4gAccordion(
                  title: 'Accordion Item',
                  expanded: _exp3,
                  onExpandedChange: (v) => setState(() => _exp3 = v),
                  chevronPosition: Ux4gAccordionChevronPosition.leading,
                  child: const Text('Accordion content goes here.'),
                ),
                Ux4gAccordion(
                  title: 'Accordion Item',
                  expanded: _exp4,
                  onExpandedChange: (v) => setState(() => _exp4 = v),
                  chevronPosition: Ux4gAccordionChevronPosition.leading,
                  child: const Text('Accordion content goes here.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final accordionIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Accordion',
          description:
              'Accordion are used to organize content in a compact, collapsible manner, making it easier for users to navigate and find information without overwhelming them too much content at once.',
          showPreview: false,
          child: _AccordionShowcase(),
        );
      },
    ),
  ],
);

final accordionComponent = WidgetbookComponent(
  name: 'Standard',
  useCases: [
    WidgetbookUseCase(
      name: 'Single',
      builder: (context) {
        bool expanded = false;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Accordion',
              description:
                  'Accordion are used to organize content in a compact, collapsible manner, making it easier for users to navigate and find information without overwhelming them too much content at once',
              code: '''// Single accordion
Ux4gAccordion(
  title: 'What is UX4G?',                              // ← change this
  expanded: expanded,                                    // ← replace 'expanded' with your state variable
  onExpandedChange: (v) => setState(() => expanded = v),// ← replace 'expanded' with your state variable
  child: Text('Your content here'),                     // ← replace with your widget
);''',
              props: const [
                PropRow(
                  name: 'title',
                  type: 'String',
                  description: 'Header text.',
                  required: true,
                ),
                PropRow(
                  name: 'child',
                  type: 'Widget',
                  description: 'Content shown when expanded.',
                  required: true,
                ),
                PropRow(
                  name: 'expanded',
                  type: 'bool',
                  description: 'Current expanded state.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description:
                      'When false, header is grayed out and non-interactive.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'onExpandedChange',
                  type: 'ValueChanged<bool>?',
                  description: 'Called when the panel is toggled.',
                ),
                PropRow(
                  name: 'backgroundColor',
                  type: 'Color?',
                  description:
                      'Header background. Defaults to colors.surface (theme-aware).',
                ),
                PropRow(
                  name: 'contentBackgroundColor',
                  type: 'Color?',
                  description:
                      'Background of the expanded content area only. Defaults to colors.surface.',
                ),
                PropRow(
                  name: 'collapsedBorderColor',
                  type: 'Color?',
                  description:
                      'Border when collapsed. Defaults to colors.onSurface at 12% opacity (theme-aware).',
                ),
                PropRow(
                  name: 'expandedBorderColor',
                  type: 'Color?',
                  description:
                      'Border when expanded. Defaults to colors.primary (theme-aware).',
                ),
                PropRow(
                  name: 'titleColor',
                  type: 'Color?',
                  description:
                      'Title text color. Defaults to colors.onSurface (theme-aware).',
                ),
                PropRow(
                  name: 'disabledTitleColor',
                  type: 'Color?',
                  description:
                      'Title color when disabled. Defaults to colors.onSurface at 38% opacity.',
                ),
                PropRow(
                  name: 'iconColor',
                  type: 'Color?',
                  description:
                      'Chevron icon color. Defaults to colors.onSurface (theme-aware).',
                ),
                PropRow(
                  name: 'disabledIconColor',
                  type: 'Color?',
                  description:
                      'Chevron color when disabled. Defaults to colors.onSurface at 38% opacity.',
                ),
              ],
              child: SizedBox(
                width: 340,
                child: Ux4gAccordion(
                  title: context.knobs.string(
                    label: 'Title',
                    initialValue: 'What is UX4G?',
                  ),
                  expanded: expanded,
                  onExpandedChange: (v) => setState(() => expanded = v),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'UX4G is a Flutter design system providing reusable UI components.',
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => ComponentDocs(
        name: 'Accordion — Disabled',
        description: 'A disabled accordion cannot be expanded.',
        code:
            'Ux4gAccordion(title: \'Locked\', expanded: false, enabled: false, onExpandedChange: (_) {});',
        child: SizedBox(
          width: 340,
          child: Ux4gAccordion(
            title: 'Locked Section (disabled)',
            expanded: false,
            enabled: false,
            onExpandedChange: (_) {},
            child: const Text('This content cannot be accessed.'),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom colors',
      builder: (context) {
        bool expanded = false;
        return StatefulBuilder(
          builder: (ctx, setState) {
            final colors = Ux4gTheme.colors(context);
            return ComponentDocs(
              name: 'Accordion — Custom Colors',
              description:
                  'Every color parameter can be overridden.\n\n'
                  'Use Ux4gTheme.colors(context) for theme-aware values that '
                  'automatically adapt between Light and Dark.\n'
                  'Use Ux4gColors.xxx for fixed, always-constant palette shades.',
              code: '''// 1. Get theme-aware semantic colors
final colors = Ux4gTheme.colors(context);

// 2. Pass them (or fixed palette values) to the component
Ux4gAccordion(
  title: 'Custom styled',
  child: Text('Content'),       // required

  // onExpandedChange is optional (nullable)
  onExpandedChange: (v) => setState(() => expanded = v),

  // theme-aware (changes with Light / Dark toggle)
  backgroundColor: colors.surface,
  expandedBorderColor: colors.primary,

  // fixed palette shades (override the theme-aware defaults)
  titleColor: Ux4gColors.primary600,
  collapsedBorderColor: Ux4gColors.gray200,
  iconColor: Ux4gColors.primary500,

  child: Text(\'Content\', style: TextStyle(color: colors.onSurface)),
);''',
              child: SizedBox(
                width: 340,
                child: Ux4gAccordion(
                  title: 'Custom styled accordion',
                  expanded: expanded,
                  onExpandedChange: (v) => setState(() => expanded = v),
                  backgroundColor: colors.surface,
                  expandedBorderColor: colors.primary,
                  titleColor: Ux4gColors.primary600,
                  collapsedBorderColor: Ux4gColors.gray200,
                  iconColor: Ux4gColors.primary500,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Themed content area.',
                      style: TextStyle(color: colors.onSurface),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'States Showcase',
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final hoverBg = isDark
            ? const Color(0xFF374151)
            : const Color(0xFFE5E7EB);
        final primaryColor = isDark
            ? const Color(0xFFA5B4FC)
            : const Color(0xFF4F46E5);
        final placeholderText =
            'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development. Its purpose is to permit a page layout to be designed, independently of the copy that will subsequently populate it, or to demonstrate various fonts of a typeface without meaningful text that could be distracting.';

        final hasBackground = context.knobs.boolean(
          label: 'With Background',
          initialValue: true,
        );
        final baseBgColor = hasBackground ? null : Colors.transparent;

        return ComponentDocs(
          name: 'Accordion — States Showcase',
          description:
              'A visual showcase of the various interaction states of the accordion item.',
          code:
              '''Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    // 1. Default
    Ux4gAccordion(
      title: 'Accordion Item',
${hasBackground ? '' : '      backgroundColor: Colors.transparent,\n'}      expanded: false,
      onExpandedChange: (_) {},
      child: const Text(''),
    ),
    const SizedBox(height: 16),
    
    // 2. Hovered (simulated)
    Ux4gAccordion(
      title: 'Accordion Item',
      expanded: false,
      backgroundColor: const Color(0xFF374151), // hoverBg
      iconColor: const Color(0xFFA5B4FC), // primaryColor
      onExpandedChange: (_) {},
      child: const Text(''),
    ),
    const SizedBox(height: 16),

    // 3. Expanded
    Ux4gAccordion(
      title: 'Accordion Item',
${hasBackground ? '' : '      backgroundColor: Colors.transparent,\n'}      expanded: true,
      onExpandedChange: (_) {},
      child: Text('...'),
    ),
    const SizedBox(height: 16),

    // 4. Active/Focused (simulated)
    Ux4gAccordion(
      title: 'Accordion Item',
${hasBackground ? '' : '      backgroundColor: Colors.transparent,\n'}      expanded: false,
      collapsedBorderColor: const Color(0xFFA5B4FC), // primaryColor
      onExpandedChange: (_) {},
      child: const Text(''),
    ),
    const SizedBox(height: 16),

    // 5. Disabled
    Ux4gAccordion(
      title: 'Accordion Item',
${hasBackground ? '' : '      backgroundColor: Colors.transparent,\n'}      expanded: false,
      enabled: false,
      child: const Text(''),
    ),
  ],
)''',
          child: SizedBox(
            width: 340,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. Default
                Ux4gAccordion(
                  title: 'Accordion Item',
                  backgroundColor: baseBgColor,
                  expanded: false,
                  onExpandedChange: (_) {},
                  child: const Text(''),
                ),
                const SizedBox(height: 16),

                // 2. Hovered (simulated)
                Ux4gAccordion(
                  title: 'Accordion Item',
                  expanded: false,
                  backgroundColor: hoverBg,
                  iconColor: primaryColor,
                  onExpandedChange: (_) {},
                  child: const Text(''),
                ),
                const SizedBox(height: 16),

                // 3. Expanded
                Ux4gAccordion(
                  title: 'Accordion Item',
                  backgroundColor: baseBgColor,
                  expanded: true,
                  onExpandedChange: (_) {},
                  child: Text(
                    placeholderText,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? const Color(0xFF9CA3AF)
                          : const Color(0xFF4B5563),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 4. Active/Focused (simulated)
                Ux4gAccordion(
                  title: 'Accordion Item',
                  backgroundColor: baseBgColor,
                  expanded: false,
                  collapsedBorderColor: primaryColor,
                  onExpandedChange: (_) {},
                  child: const Text(''),
                ),
                const SizedBox(height: 16),

                // 5. Disabled
                Ux4gAccordion(
                  title: 'Accordion Item',
                  backgroundColor: baseBgColor,
                  expanded: false,
                  enabled: false,
                  child: const Text(''),
                ),
              ],
            ),
          ),
        );
      },
    ),

    WidgetbookUseCase(
      name: 'Leading Chevron',
      builder: (context) {
        bool expanded1 = true;
        bool expanded2 = false;

        return StatefulBuilder(
          builder: (ctx, setState) {
            final isDark = Theme.of(context).brightness == Brightness.dark;
            final placeholderText =
                'Donec porta turpis ut ipsum tincidunt, sit amet aliquam leo laoreet. Nunc suscipit ligula non arcu.';

            final hasBackground = context.knobs.boolean(
              label: 'With Background',
              initialValue: true,
            );
            final baseBgColor = hasBackground ? null : Colors.transparent;

            return ComponentDocs(
              name: 'Accordion — Leading Chevron',
              description:
                  'The chevron arrow can be positioned on the left side (leading) instead of the right side.',
              code:
                  '''Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Ux4gAccordion(
      title: 'Accordion Item',
      chevronPosition: Ux4gAccordionChevronPosition.leading,
${hasBackground ? '' : '      backgroundColor: Colors.transparent,\n'}      expanded: expanded1,
      onExpandedChange: (val) => setState(() => expanded1 = val),
      child: Text('...'),
    ),
    const SizedBox(height: 16),
    Ux4gAccordion(
      title: 'Accordion Item',
      chevronPosition: Ux4gAccordionChevronPosition.leading,
${hasBackground ? '' : '      backgroundColor: Colors.transparent,\n'}      expanded: expanded2,
      onExpandedChange: (val) => setState(() => expanded2 = val),
      child: Text('...'),
    ),
  ],
)''',
              child: SizedBox(
                width: 340,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ux4gAccordion(
                      title: 'Accordion Item',
                      chevronPosition: Ux4gAccordionChevronPosition.leading,
                      backgroundColor: baseBgColor,
                      expanded: expanded1,
                      onExpandedChange: (val) =>
                          setState(() => expanded1 = val),
                      child: Text(
                        placeholderText,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? const Color(0xFF9CA3AF)
                              : const Color(0xFF4B5563),
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Ux4gAccordion(
                      title: 'Accordion Item',
                      chevronPosition: Ux4gAccordionChevronPosition.leading,
                      backgroundColor: baseBgColor,
                      expanded: expanded2,
                      onExpandedChange: (val) =>
                          setState(() => expanded2 = val),
                      child: Text(
                        placeholderText,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? const Color(0xFF9CA3AF)
                              : const Color(0xFF4B5563),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

final accordionGroupComponent = WidgetbookComponent(
  name: 'AccordionGroup',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        int? expandedIndex = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            final items = [
              const Ux4gAccordionItem(title: 'What is UX4G?'),
              const Ux4gAccordionItem(title: 'How do I install it?'),
              const Ux4gAccordionItem(title: 'Is it open source?'),
            ];
            final contents = [
              'UX4G is a Flutter design system providing reusable UI components.',
              'Add it to pubspec.yaml and run flutter pub get.',
              'Yes, UX4G is open source under the MIT licence.',
            ];
            return ComponentDocs(
              name: 'AccordionGroup',
              description:
                  'AccordionGroup ensures only one item is open at a time.',
              code: () {
                final buf = StringBuffer();
                buf.writeln(
                  "// ── Declare these variables in your widget state ──",
                );
                buf.writeln("int? expandedIndex = 0;");
                buf.writeln();
                buf.writeln("final items = <Ux4gAccordionItem>[");
                buf.writeln(
                  "  const Ux4gAccordionItem(title: 'What is UX4G?'),",
                );
                buf.writeln(
                  "  const Ux4gAccordionItem(title: 'How do I install it?'),",
                );
                buf.writeln(
                  "  const Ux4gAccordionItem(title: 'Is it open source?'),",
                );
                buf.writeln("];");
                buf.writeln();
                buf.writeln("final contents = <String>[");
                buf.writeln(
                  "  'UX4G is a Flutter design system providing reusable UI components.',",
                );
                buf.writeln(
                  "  'Add it to pubspec.yaml and run flutter pub get.',",
                );
                buf.writeln(
                  "  'Yes, UX4G is open source under the MIT licence.',",
                );
                buf.writeln("];");
                buf.writeln();
                buf.writeln("// ── Use them in your build method ──");
                buf.writeln("Ux4gAccordionGroup(");
                buf.writeln("  items: items,");
                buf.writeln("  expandedIndex: expandedIndex,");
                buf.writeln("  onExpandedIndexChange: (i) =>");
                buf.writeln("      setState(() => expandedIndex = i),");
                buf.writeln("  contentBuilder: (index, item) => Padding(");
                buf.writeln("    padding: const EdgeInsets.all(12),");
                buf.writeln("    child: Text(contents[index]),");
                buf.writeln("  ),");
                buf.writeln(");");
                return buf.toString();
              }(),
              props: const [
                PropRow(
                  name: 'items',
                  type: 'List<Ux4gAccordionItem>',
                  description: 'List of accordion items (title + enabled).',
                  required: true,
                ),
                PropRow(
                  name: 'contentBuilder',
                  type: 'Widget Function(int, Ux4gAccordionItem)',
                  description:
                      'Builds content for the item at the given index.',
                  required: true,
                ),
                PropRow(
                  name: 'expandedIndex',
                  type: 'int?',
                  description:
                      'Index of the currently expanded item. null = all collapsed.',
                ),
                PropRow(
                  name: 'onExpandedIndexChange',
                  type: 'ValueChanged<int?>?',
                  description:
                      'Called when an item is toggled. null means collapsed.',
                ),
                PropRow(
                  name: 'itemSpacing',
                  type: 'double',
                  description: 'Vertical gap between accordion items.',
                  defaultValue: 'Ux4gSpace.space20',
                ),
              ],
              child: SizedBox(
                width: 340,
                child: Ux4gAccordionGroup(
                  items: items,
                  expandedIndex: expandedIndex,
                  onExpandedIndexChange: (i) =>
                      setState(() => expandedIndex = i),
                  contentBuilder: (index, item) => Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(contents[index]),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Status Banner ─────────────────────────────────────────────────────────────

final statusBannerComponent = WidgetbookComponent(
  name: 'Draft Status',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Draft Status',
          description:
              'Draft Status Banner component displays a persistent notification indicating that content is currently in draft mode. It helps users distinguish unpublished content from published information.',
          showPreview: false,
          child: _DraftStatusVisualShowcase(),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'All variants',
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final ux4gTypography = Theme.of(context).extension<Ux4gTypography>();
        final bannerBgColor = isDark
            ? const Color(0xFF7C2D12)
            : const Color(0xFFFFF7ED); // orange900 : orange50
        final titleColor = isDark
            ? const Color(0xFFF9FAFB)
            : const Color(0xFF111827); // neutral50 : neutral900
        final actualTitleStyle =
            ux4gTypography?.tS_default?.copyWith(color: titleColor) ??
            TextStyle(color: titleColor, fontWeight: FontWeight.bold);

        final warningBg = isDark
            ? const Color(0xFFAD4E00)
            : const Color(0xFFFFE7BF); // orange800 : orange100
        final warningText = isDark
            ? const Color(0xFFFFC973)
            : const Color(0xFFAD4E00); // orange300 : orange800
        final warningPillStyle =
            ux4gTypography?.lM_default?.copyWith(color: warningText) ??
            TextStyle(
              color: warningText,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            );

        final warningPill = Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: warningBg,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text('Step 3 of 5 Document Upload', style: warningPillStyle),
        );

        final datePill = Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: warningBg,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text('16 Apr', style: warningPillStyle),
        );

        final subtitleColor = isDark
            ? const Color(0xFFE5E7EB)
            : const Color(0xFF374151); // neutral200 : neutral700
        final subtitleTextStyle =
            ux4gTypography?.bS_default?.copyWith(color: subtitleColor) ??
            TextStyle(color: subtitleColor, fontSize: 14);

        final solidBannerBg = isDark
            ? const Color(0xFFFDBA74)
            : const Color(0xFFEA580C); // orange300 : orange600
        final solidBannerTextColor = isDark
            ? const Color(0xFF111827)
            : const Color(0xFFF9FAFB); // neutral900 : neutral50
        final solidBannerTitleStyle =
            ux4gTypography?.bS_strong?.copyWith(color: solidBannerTextColor) ??
            TextStyle(color: solidBannerTextColor, fontWeight: FontWeight.bold);

        final savingBgColor = isDark
            ? const Color(0xFF873C05)
            : const Color(0xFFFFF7E6); // secondary900 : secondary50
        final savingTextColor = isDark
            ? const Color(0xFFD9D9D9)
            : const Color(0xFF737373); // neutral300 : neutral500
        final savingTextStyle =
            ux4gTypography?.bS_default?.copyWith(color: savingTextColor) ??
            TextStyle(color: savingTextColor, fontSize: 14);

        final successBgColor = isDark
            ? const Color(0xFF00381F)
            : const Color(0xFFF2FCEF); // green900 : green50
        final successIconColor = isDark
            ? const Color(0xFF1AA64A)
            : const Color(0xFF128937); // green500 : green600
        final successTextColor = isDark
            ? const Color(0xFFF9FAFB)
            : const Color(0xFF111827); // neutral50 : neutral900
        final successTextStyle =
            ux4gTypography?.bS_default?.copyWith(color: successTextColor) ??
            TextStyle(color: successTextColor, fontSize: 14);

        final expiryTitleStyle =
            ux4gTypography?.bS_strong?.copyWith(color: titleColor) ??
            TextStyle(color: titleColor, fontWeight: FontWeight.bold);

        final errorBgColor = isDark
            ? const Color(0xFF60150F)
            : const Color(0xFFFFF8F8); // red900 : red50
        final errorTextColor = isDark
            ? const Color(0xFFF9FAFB)
            : const Color(0xFF111827); // neutral50 : neutral900
        final errorIconColor = isDark
            ? const Color(0xFFF55E57)
            : const Color(0xFFDB372D); // red500 : red600
        final errorTextStyle =
            ux4gTypography?.bS_default?.copyWith(color: errorTextColor) ??
            TextStyle(color: errorTextColor, fontSize: 14);
        final actionTextColor = isDark
            ? const Color(0xFFFDBA74)
            : const Color(0xFF9A3412); // orange300 : orange800
        final actionTextStyle =
            ux4gTypography?.lXL_default?.copyWith(color: actionTextColor) ??
            TextStyle(color: actionTextColor, fontWeight: FontWeight.bold);

        final successRightTextColor = isDark
            ? const Color(0xFF80DA88)
            : const Color(0xFF00522C); // green300 : green800
        final successRightTextStyle =
            ux4gTypography?.bM_default?.copyWith(
              color: successRightTextColor,
            ) ??
            TextStyle(color: successRightTextColor, fontSize: 14);

        final discardButtonColor = isDark
            ? const Color(0xFFF55E57)
            : const Color(0xFFDB372D); // red500 : red600
        final buttonTextStyle =
            ux4gTypography?.lXL_default ??
            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

        return ComponentDocs(
          name: 'StatusBanner',
          description:
              'Draft Status Banner component displays a persistent notification indicating that content is currently in draft mode. It helps users distinguish unpublished content from published information.',
          code: () {
            final buf = StringBuffer();
            buf.writeln("// ── Get the typography object from theme ──");
            buf.writeln(
              "final typography = Theme.of(context).extension<Ux4gTypography>();",
            );
            buf.writeln(
              "// typography exposes: tS_default, bS_default, bS_strong, lM_default, lXL_default, etc.",
            );
            buf.writeln(
              "// Use ?. and ?? to handle null safely, or use ! if you're sure it's registered.",
            );
            buf.writeln();
            buf.writeln("Column(");
            buf.writeln("  mainAxisSize: MainAxisSize.min,");
            buf.writeln("  children: [");
            buf.writeln("    // 1. Accordion style (collapsed)");
            buf.writeln("    Ux4gStatusBanner(");
            buf.writeln("      borderColor: Colors.transparent,");
            buf.writeln("      variant: Ux4gBannerVariant.warningLight,");
            buf.writeln("      title: 'Income Certificate Application',");
            buf.writeln(
              "      titleStyle: typography?.tS_default?.copyWith(color: const Color(0xFF111827)),",
            );
            buf.writeln("      subtitleWidget: Column(");
            buf.writeln(
              "        crossAxisAlignment: CrossAxisAlignment.start,",
            );
            buf.writeln("        children: [");
            buf.writeln("          const SizedBox(height: 8),");
            buf.writeln(
              "          Text('Step 3 of 5', style: typography?.lM_default),",
            );
            buf.writeln("          const SizedBox(height: 8),");
            buf.writeln(
              "          Text('Last saved: 10 Apr 2026', style: typography?.bS_default?.copyWith(color: const Color(0xFF374151))),",
            );
            buf.writeln("        ],");
            buf.writeln("      ),");
            buf.writeln(
              "      trailingIcon: const Icon(Icons.keyboard_arrow_down),",
            );
            buf.writeln("    ),");
            buf.writeln("    const SizedBox(height: 24),");
            buf.writeln();
            buf.writeln("    // 2. Solid Warning Banner");
            buf.writeln("    Ux4gStatusBanner(");
            buf.writeln("      borderColor: Colors.transparent,");
            buf.writeln("      variant: Ux4gBannerVariant.warningSolid,");
            buf.writeln(
              "      title: 'Your draft expires tomorrow. Submit today',",
            );
            buf.writeln("      titleStyle: typography?.bS_strong,");
            buf.writeln("    ),");
            buf.writeln("    const SizedBox(height: 24),");
            buf.writeln();
            buf.writeln("    // 3. Saving State");
            buf.writeln("    Ux4gStatusBanner(");
            buf.writeln("      borderColor: Colors.transparent,");
            buf.writeln("      variant: Ux4gBannerVariant.warningLight,");
            buf.writeln("      title: '',");
            buf.writeln("      trailingIcon: Row(");
            buf.writeln("        mainAxisSize: MainAxisSize.min,");
            buf.writeln("        children: [");
            buf.writeln(
              "          const SizedBox(width: 16, height: 16, child: Ux4gSpinner(strokeWidth: 2.0)),",
            );
            buf.writeln("          const SizedBox(width: 8),");
            buf.writeln(
              "          Text('Saving', style: typography?.bS_default),",
            );
            buf.writeln("        ],");
            buf.writeln("      ),");
            buf.writeln("    ),");
            buf.writeln("    const SizedBox(height: 24),");
            buf.writeln();
            buf.writeln("    // 4. Success Banner (Left Icon)");
            buf.writeln("    Ux4gStatusBanner(");
            buf.writeln("      borderColor: Colors.transparent,");
            buf.writeln("      variant: Ux4gBannerVariant.successLight,");
            buf.writeln("      title: 'Draft saved successfully at 3:14 PM',");
            buf.writeln("      titleStyle: typography?.bS_default,");
            buf.writeln(
              "      leadingIcon: const Icon(Icons.check_circle_outline),",
            );
            buf.writeln("    ),");
            buf.writeln("    const SizedBox(height: 24),");
            buf.writeln();
            buf.writeln("    // 5. Expiry Warning with Badge");
            buf.writeln("    Ux4gStatusBanner(");
            buf.writeln("      borderColor: Colors.transparent,");
            buf.writeln("      variant: Ux4gBannerVariant.warningLight,");
            buf.writeln("      title: 'Your draft expires in 5 days',");
            buf.writeln(
              "      titleStyle: typography?.bS_strong?.copyWith(color: const Color(0xFF111827)),",
            );
            buf.writeln("    ),");
            buf.writeln("    const SizedBox(height: 24),");
            buf.writeln();
            buf.writeln("    // 6. Error Banner with Action");
            buf.writeln("    Ux4gStatusBanner(");
            buf.writeln("      borderColor: Colors.transparent,");
            buf.writeln("      variant: Ux4gBannerVariant.errorLight,");
            buf.writeln("      title: 'Draft expired on 9 April\\\\n2026',");
            buf.writeln(
              "      titleStyle: typography?.bS_default?.copyWith(color: const Color(0xFF111827)),",
            );
            buf.writeln("      leadingIcon: const Icon(Icons.error_outline),");
            buf.writeln(
              "      trailingIcon: Text('Action', style: typography?.lXL_default?.copyWith(color: const Color(0xFF9A3412))),",
            );
            buf.writeln("    ),");
            buf.writeln("    const SizedBox(height: 24),");
            buf.writeln();
            buf.writeln("    // 7. Success Banner (Right Icon)");
            buf.writeln("    Ux4gStatusBanner(");
            buf.writeln("      borderColor: Colors.transparent,");
            buf.writeln("      variant: Ux4gBannerVariant.successLight,");
            buf.writeln("      title: '',");
            buf.writeln("      trailingIcon: Row(");
            buf.writeln("        mainAxisSize: MainAxisSize.min,");
            buf.writeln("        children: [");
            buf.writeln(
              "          const Icon(Icons.check_circle_outline, size: 18),",
            );
            buf.writeln("          const SizedBox(width: 4),");
            buf.writeln(
              "          Text('Saved 3:14 PM', style: typography?.bM_default),",
            );
            buf.writeln("        ],");
            buf.writeln("      ),");
            buf.writeln("    ),");
            buf.writeln("    const SizedBox(height: 24),");
            buf.writeln();
            buf.writeln("    // 8. Accordion style (expanded)");
            buf.writeln("    Ux4gStatusBanner(");
            buf.writeln("      borderColor: Colors.transparent,");
            buf.writeln("      variant: Ux4gBannerVariant.warningLight,");
            buf.writeln("      title: 'Income Certificate Application',");
            buf.writeln(
              "      titleStyle: typography?.tS_default?.copyWith(color: const Color(0xFF111827)),",
            );
            buf.writeln("      subtitleWidget: Column(");
            buf.writeln(
              "        crossAxisAlignment: CrossAxisAlignment.start,",
            );
            buf.writeln("        children: [");
            buf.writeln("          const SizedBox(height: 8),");
            buf.writeln(
              "          Text('Step 3 of 5', style: typography?.lM_default),",
            );
            buf.writeln("          const SizedBox(height: 8),");
            buf.writeln(
              "          Text('Last saved: 10 Apr 2026', style: typography?.bS_default?.copyWith(color: const Color(0xFF374151))),",
            );
            buf.writeln("        ],");
            buf.writeln("      ),");
            buf.writeln(
              "      trailingIcon: const Icon(Icons.keyboard_arrow_up),",
            );
            buf.writeln("      actionsAlignment: WrapAlignment.spaceBetween,");
            buf.writeln("      actions: [");
            buf.writeln("        TextButton(");
            buf.writeln("          onPressed: () {},");
            buf.writeln(
              "          child: Text('Discard', style: typography?.lXL_default?.copyWith(color: const Color(0xFFDB372D))),",
            );
            buf.writeln("        ),");
            buf.writeln("        ElevatedButton(");
            buf.writeln("          onPressed: () {},");
            buf.writeln(
              "          child: Text('Resume', style: typography?.lXL_default),",
            );
            buf.writeln("        ),");
            buf.writeln("      ],");
            buf.writeln("    ),");
            buf.writeln("  ],");
            buf.writeln(")");
            return buf.toString();
          }(),
          child: SizedBox(
            width: 480,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 1. Accordion style (collapsed)
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningLight,
                    backgroundColor: bannerBgColor,
                    title: 'Income Certificate Application',
                    titleStyle: actualTitleStyle,
                    subtitleWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        warningPill,
                        const SizedBox(height: 8),
                        Text(
                          'Last saved: 10 Apr 2026',
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                    trailingIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                  const SizedBox(height: 24),

                  // 2. Solid Warning Banner
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningSolid,
                    backgroundColor: solidBannerBg,
                    title: 'Your draft expires tomorrow. Submit today',
                    titleStyle: solidBannerTitleStyle,
                  ),
                  const SizedBox(height: 24),

                  // 3. Saving State
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningLight,
                    backgroundColor: savingBgColor,
                    title: '',
                    trailingIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: Ux4gSpinner(strokeWidth: 2.0),
                        ),
                        const SizedBox(width: 8),
                        Text('Saving', style: savingTextStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 4. Success Banner (Left Icon)
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.successLight,
                    backgroundColor: successBgColor,
                    title: 'Draft saved successfully at 3:14 PM',
                    titleStyle: successTextStyle,
                    leadingIcon: Icon(
                      Icons.check_circle_outline,
                      color: successIconColor,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 5. Expiry Warning with Badge
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningLight,
                    backgroundColor: bannerBgColor,
                    title: 'Your draft expires in 5 days',
                    titleStyle: expiryTitleStyle,
                    badge: datePill,
                  ),
                  const SizedBox(height: 24),

                  // 6. Error Banner with Action
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.errorLight,
                    backgroundColor: errorBgColor,
                    title: 'Draft expired on 9 April\n2026',
                    titleStyle: errorTextStyle,
                    leadingIcon: Icon(
                      Icons.error_outline,
                      color: errorIconColor,
                    ),
                    trailingIcon: Text('Action', style: actionTextStyle),
                  ),
                  const SizedBox(height: 24),

                  // 7. Success Banner (Right Icon)
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.successLight,
                    backgroundColor: successBgColor,
                    title: '',
                    trailingIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: successIconColor,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text('Saved 3:14 PM', style: successRightTextStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 8. Accordion style (expanded)
                  Ux4gStatusBanner(
                    borderColor: Colors.transparent,
                    variant: Ux4gBannerVariant.warningLight,
                    backgroundColor: bannerBgColor,
                    title: 'Income Certificate Application',
                    titleStyle: actualTitleStyle,
                    subtitleWidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        warningPill,
                        const SizedBox(height: 8),
                        Text(
                          'Last saved: 10 Apr 2026',
                          style: subtitleTextStyle,
                        ),
                      ],
                    ),
                    trailingIcon: const Icon(Icons.keyboard_arrow_up),
                    actionsAlignment: WrapAlignment.spaceBetween,
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Discard',
                          style: buttonTextStyle.copyWith(
                            color: discardButtonColor,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F46E5),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Resume',
                          style: buttonTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          props: const [
            PropRow(
              name: 'variant',
              type: 'Ux4gBannerVariant',
              description: 'Sets the visual variant of the banner.',
              required: true,
            ),
            PropRow(
              name: 'title',
              type: 'String',
              description: 'Primary message of the banner.',
              required: true,
            ),
            PropRow(
              name: 'subtitle',
              type: 'String?',
              description: 'Secondary descriptive text.',
            ),
            PropRow(
              name: 'subtitleWidget',
              type: 'Widget?',
              description:
                  'Custom widget to replace the default subtitle text.',
            ),
            PropRow(
              name: 'titleStyle',
              type: 'TextStyle?',
              description: 'Overrides the default title text style.',
            ),
            PropRow(
              name: 'subtitleStyle',
              type: 'TextStyle?',
              description: 'Overrides the default subtitle text style.',
            ),
            PropRow(
              name: 'badge',
              type: 'Widget?',
              description: 'Optional badge widget displayed near the title.',
            ),
            PropRow(
              name: 'leadingIcon',
              type: 'Widget?',
              description: 'Widget displayed at the start of the banner.',
            ),
            PropRow(
              name: 'trailingIcon',
              type: 'Widget?',
              description: 'Widget displayed at the end of the banner.',
            ),
            PropRow(
              name: 'actions',
              type: 'List<Widget>?',
              description: 'List of action buttons displayed below the title.',
            ),
            PropRow(
              name: 'onDismiss',
              type: 'VoidCallback?',
              description: 'Callback when the dismiss button is tapped.',
            ),
            PropRow(
              name: 'backgroundColor',
              type: 'Color?',
              description: 'Overrides the background color.',
            ),
            PropRow(
              name: 'borderColor',
              type: 'Color?',
              description: 'Overrides the border color.',
            ),
          ],
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Custom styling',
      builder: (context) => ComponentDocs(
        name: 'StatusBanner — Custom Styling',
        description:
            'You can override the title and subtitle styles, including size, weight, and color.',
        code: () {
          final buf = StringBuffer();
          buf.writeln("// ── Get the typography object from theme ──");
          buf.writeln(
            "final typography = Theme.of(context).extension<Ux4gTypography>();",
          );
          buf.writeln();
          buf.writeln("// Option A: Use theme-aware typography styles");
          buf.writeln("Ux4gStatusBanner(");
          buf.writeln("  variant: Ux4gBannerVariant.infoLight,");
          buf.writeln("  title: 'Info Message',");
          buf.writeln("  titleStyle: typography?.bM_strong,");
          buf.writeln("  subtitle: 'Subtitle with theme-aware style.',");
          buf.writeln("  subtitleStyle: typography?.bS_default?.copyWith(");
          buf.writeln("    color: Colors.black54,");
          buf.writeln("  ),");
          buf.writeln(");");
          buf.writeln();
          buf.writeln("// Option B: Use a completely custom TextStyle");
          buf.writeln("Ux4gStatusBanner(");
          buf.writeln("  variant: Ux4gBannerVariant.infoLight,");
          buf.writeln("  title: 'Custom Title',");
          buf.writeln("  titleStyle: TextStyle(");
          buf.writeln(
            "    fontSize: 18, fontWeight: FontWeight.w900, color: Colors.blue.shade900,",
          );
          buf.writeln("  ),");
          buf.writeln("  subtitle: 'Custom subtitle styling example.',");
          buf.writeln("  subtitleStyle: TextStyle(");
          buf.writeln(
            "    fontSize: 12, fontStyle: FontStyle.italic, color: Colors.black54,",
          );
          buf.writeln("  ),");
          buf.writeln(");");
          return buf.toString();
        }(),
        child: SizedBox(
          width: 380,
          child: Ux4gStatusBanner(
            variant: Ux4gBannerVariant.infoLight,
            title: 'Custom Styled Banner',
            titleStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.blue.shade900,
              letterSpacing: 1.1,
            ),
            subtitle: 'This subtitle has custom styling applied directly.',
            subtitleStyle: const TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
            leadingIcon: const Icon(Icons.info_outline, color: Colors.blue),
            trailingIcon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'New',
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    ),
  ],
);

// ── Empty State ────────────────────────────────────────────────────────────────

final emptyStateComponent = WidgetbookComponent(
  name: 'Empty State',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Empty State',
          description:
              'An Empty state screen is used to prompt the user to take action or provide input when there is no existing data or content to display.',
          showPreview: false,
          child: _EmptyStateVisualShowcase(),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => ComponentDocs(
        name: 'EmptyState',
        description:
            'An Empty state screen is used to prompt the user to take action or provide input when there is no existing data or content to display.',
        code: '''Ux4gEmptyState(
  title: 'No results found',
  description: 'Try adjusting your search.',
  icon: Icons.search_off,
);

// With CTA button
Ux4gEmptyState(
  title: 'Nothing here yet',
  subtitle: 'Create your first item.',
  icon: Icons.inbox_outlined,
  buttonText: 'Get Started',
  onButtonPressed: () {},
);''',
        props: const [
          PropRow(
            name: 'title',
            type: 'String',
            description: 'Primary message.',
            required: true,
          ),
          PropRow(
            name: 'variant',
            type: 'Ux4gEmptyStateVariant',
            description: 'Semantic preset for the empty state.',
            defaultValue: 'custom',
          ),
          PropRow(
            name: 'subtitle',
            type: 'String?',
            description: 'Secondary message.',
          ),
          PropRow(
            name: 'description',
            type: 'String?',
            description: 'Descriptive text.',
          ),
          PropRow(
            name: 'icon',
            type: 'IconData?',
            description: 'Icon displayed above title.',
          ),
          PropRow(
            name: 'iconSize',
            type: 'double?',
            description: 'Size of the top icon.',
            defaultValue: '48',
          ),
          PropRow(
            name: 'iconColor',
            type: 'Color?',
            description: 'Color of the top icon.',
          ),
          PropRow(
            name: 'titleStyle',
            type: 'TextStyle?',
            description: 'Custom style for the title.',
          ),
          PropRow(
            name: 'bodyStyle',
            type: 'TextStyle?',
            description: 'Custom style for subtitle and description.',
          ),
          PropRow(
            name: 'buttonText',
            type: 'String?',
            description: 'CTA button label.',
          ),
          PropRow(
            name: 'onButtonPressed',
            type: 'VoidCallback?',
            description: 'CTA button callback.',
          ),
          PropRow(
            name: 'buttonSize',
            type: 'Ux4gButtonSize',
            description: 'Size of the CTA button.',
            defaultValue: 'small',
          ),
          PropRow(
            name: 'buttonLeadingIcon',
            type: 'IconData?',
            description: 'Icon shown inside the CTA button.',
          ),
          PropRow(
            name: 'padding',
            type: 'EdgeInsetsGeometry?',
            description: 'Padding around the whole widget.',
            defaultValue: 'EdgeInsets.all(24)',
          ),
          PropRow(
            name: 'bodyHorizontalPadding',
            type: 'double',
            description: 'Extra horizontal padding for text.',
            defaultValue: '24.0',
          ),
        ],
        child: SizedBox(
          width: 320,
          child: Ux4gEmptyState(
            title: context.knobs.string(
              label: 'Title',
              initialValue: 'No results found',
            ),
            description: context.knobs.string(
              label: 'Description',
              initialValue: 'Try adjusting your filters.',
            ),
            icon: Icons.search_off,
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With CTA button',
      builder: (context) => ComponentDocs(
        name: 'EmptyState — With CTA',
        description:
            'Providing buttonText and onButtonPressed adds a primary action button.',
        code:
            'Ux4gEmptyState(\n'
            '  title: \'Nothing here yet\',\n'
            '  icon: Icons.inbox_outlined,\n'
            '  buttonText: \'Get Started\', onButtonPressed: () {},\n'
            ');',
        child: SizedBox(
          width: 320,
          child: Ux4gEmptyState(
            title: 'Nothing here yet',
            description: 'Create your first item to get started.',
            icon: Icons.inbox_outlined,
            buttonText: 'Get Started',
            onButtonPressed: () {},
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'All variants',
      builder: (context) => ComponentDocs(
        name: 'EmptyState — Variants',
        description:
            'Predefined variants that automatically apply the correct icon and color.',
        code: '''Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Ux4gEmptyState(
      variant: Ux4gEmptyStateVariant.noResults,
      title: 'No results found',
      subtitle: 'Did you mean:',
      description: 'Driving License, Ration Card',
      buttonText: 'Clear all filters',
      onButtonPressed: () {},
    ),
    const SizedBox(height: 16),
    Ux4gEmptyState(
      variant: Ux4gEmptyStateVariant.noData,
      title: 'No active applications',
      subtitle: 'Start your application easily',
      description: 'by clicking on the button below.',
      buttonText: 'Start application',
      onButtonPressed: () {},
    ),
    const SizedBox(height: 16),
    Ux4gEmptyState(
      variant: Ux4gEmptyStateVariant.comingSoon,
      title: 'Coming soon',
      subtitle: 'This feature is under development.',
      buttonText: 'Go Back',
      onButtonPressed: () {},
    ),
    const SizedBox(height: 16),
    Ux4gEmptyState(
      variant: Ux4gEmptyStateVariant.error,
      title: 'Could not load data',
      subtitle: 'Last updated: 4 minutes ago',
      buttonText: 'Refresh',
      onButtonPressed: () {},
    ),
  ],
)''',
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Ux4gEmptyState(
                variant: Ux4gEmptyStateVariant.noResults,
                title: 'No results found',
                subtitle: 'Did you mean:',
                description: 'Driving License, Ration Card',
                buttonText: 'Clear all filters',
                onButtonPressed: () {},
              ),
              const SizedBox(height: 16),
              Ux4gEmptyState(
                variant: Ux4gEmptyStateVariant.noData,
                title: 'No active applications',
                subtitle: 'Start your application easily',
                description: 'by clicking on the button below.',
                buttonText: 'Start application',
                onButtonPressed: () {},
              ),
              const SizedBox(height: 16),
              Ux4gEmptyState(
                variant: Ux4gEmptyStateVariant.comingSoon,
                title: 'Coming soon',
                subtitle: 'This feature is under development.',
                buttonText: 'Go Back',
                onButtonPressed: () {},
              ),
              const SizedBox(height: 16),
              Ux4gEmptyState(
                variant: Ux4gEmptyStateVariant.error,
                title: 'Could not load data',
                subtitle: 'Last updated: 4 minutes ago',
                buttonText: 'Refresh',
                onButtonPressed: () {},
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);

// ── Chips ─────────────────────────────────────────────────────────────────────

final chipIntroductionComponent = WidgetbookComponent(
  name: 'Introduction',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Chips',
          description:
              'Chips are compact UI elements that represent discrete information, such as tags, categories, selections, or input. They help users quickly filter, select, or manage items in an interface.',
          showPreview: false,
          child: _ChipVisualShowcase(),
        );
      },
    ),
  ],
);

final choiceChipComponent = WidgetbookComponent(
  name: 'ChoiceChip',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        int selected = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'ChoiceChip',
              description:
                  'Single-select chips. Exactly one option is active at a time.',
              code: '''Ux4gChoiceChip(
  text: 'Option A',
  selected: selected == 0,
  onClick: () => setState(() => selected = 0),
);''',
              props: const [
                PropRow(
                  name: 'text',
                  type: 'String',
                  description: 'Chip label.',
                  required: true,
                ),
                PropRow(
                  name: 'selected',
                  type: 'bool',
                  description: 'Whether this chip is active.',
                  required: true,
                ),
                PropRow(
                  name: 'onClick',
                  type: 'VoidCallback',
                  description: 'Called when tapped.',
                  required: true,
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gChoiceChipSize',
                  description: 's or m.',
                  defaultValue: 'm',
                ),
                PropRow(
                  name: 'leadingContent',
                  type: 'Widget?',
                  description: 'Optional icon or widget before text.',
                ),
                PropRow(
                  name: 'borderRadius',
                  type: 'double',
                  description: 'Corner radius.',
                  defaultValue: 'Ux4gRadius.radius4',
                ),
                PropRow(
                  name: 'selectedBackgroundColor',
                  type: 'Color?',
                  description: 'Background when selected.',
                ),
                PropRow(
                  name: 'unselectedBackgroundColor',
                  type: 'Color?',
                  description: 'Background when unselected.',
                ),
                PropRow(
                  name: 'selectedBorderColor',
                  type: 'Color?',
                  description: 'Border when selected.',
                ),
                PropRow(
                  name: 'unselectedBorderColor',
                  type: 'Color?',
                  description: 'Border when unselected.',
                ),
                PropRow(
                  name: 'selectedTextColor',
                  type: 'Color?',
                  description: 'Text when selected.',
                ),
                PropRow(
                  name: 'unselectedTextColor',
                  type: 'Color?',
                  description: 'Text when unselected.',
                ),
                PropRow(
                  name: 'selectedBorderWidth',
                  type: 'double',
                  description: 'Border width when selected.',
                  defaultValue: '1',
                ),
                PropRow(
                  name: 'unselectedBorderWidth',
                  type: 'double',
                  description: 'Border width when unselected.',
                  defaultValue: '1',
                ),
              ],
              child: Wrap(
                spacing: 8,
                children: ['Option A', 'Option B', 'Option C']
                    .asMap()
                    .entries
                    .map(
                      (e) => Ux4gChoiceChip(
                        text: e.value,
                        selected: selected == e.key,
                        onClick: () => setState(() => selected = e.key),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'With Icon',
      builder: (context) {
        int selected = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'ChoiceChip — With Icon',
              description: 'Choice chips displaying leading icons or avatars.',
              code: '''Ux4gChoiceChip(
  text: 'Favorites',
  leadingContent: Icon(Icons.favorite, size: 16),
  selected: selected == 0,
  onClick: () => setState(() => selected = 0),
);''',
              child: Wrap(
                spacing: 8,
                children: [
                  Ux4gChoiceChip(
                    text: 'Favorites',
                    leadingContent: const Icon(Icons.favorite, size: 16),
                    selected: selected == 0,
                    onClick: () => setState(() => selected = 0),
                  ),
                  Ux4gChoiceChip(
                    text: 'Trending',
                    leadingContent: const Icon(Icons.trending_up, size: 16),
                    selected: selected == 1,
                    onClick: () => setState(() => selected = 1),
                  ),
                  Ux4gChoiceChip(
                    text: 'Recent',
                    leadingContent: const Icon(Icons.history, size: 16),
                    selected: selected == 2,
                    onClick: () => setState(() => selected = 2),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => ComponentDocs(
        name: 'ChoiceChip — Disabled',
        description:
            'Choice chips in disabled state (selected and unselected).',
        code: '''Ux4gChoiceChip(
  text: 'Selected Disabled',
  selected: true,
  enabled: false,
  onClick: () {},
);''',
        child: Wrap(
          spacing: 8,
          children: [
            Ux4gChoiceChip(
              text: 'Selected Disabled',
              selected: true,
              enabled: false,
              onClick: () {},
            ),
            Ux4gChoiceChip(
              text: 'Unselected Disabled',
              selected: false,
              enabled: false,
              onClick: () {},
            ),
            Ux4gChoiceChip(
              text: 'Icon Disabled',
              leadingContent: const Icon(Icons.block, size: 16),
              selected: false,
              enabled: false,
              onClick: () {},
            ),
          ],
        ),
      ),
    ),
  ],
);

final filterChipComponent = WidgetbookComponent(
  name: 'FilterChip',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        final Set<int> selectedSet = {};
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'FilterChip',
              description:
                  'Multi-select chips. Any number of options can be active simultaneously.',
              code: '''Ux4gFilterChip(
  text: 'Flutter',
  selected: selected.contains(0),
  onClick: () => setState(() => selected.toggle(0)),
);''',
              props: const [
                PropRow(
                  name: 'text',
                  type: 'String',
                  description: 'Chip label.',
                  required: true,
                ),
                PropRow(
                  name: 'selected',
                  type: 'bool',
                  description: 'Whether this chip is active.',
                  required: true,
                ),
                PropRow(
                  name: 'onClick',
                  type: 'VoidCallback',
                  description: 'Called when tapped.',
                  required: true,
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gFilterChipSize',
                  description: 's or m.',
                  defaultValue: 'm',
                ),
                PropRow(
                  name: 'leadingContent',
                  type: 'Widget?',
                  description: 'Optional icon or widget before text.',
                ),
                PropRow(
                  name: 'borderRadius',
                  type: 'double',
                  description: 'Corner radius.',
                  defaultValue: 'Ux4gRadius.radius4',
                ),
                PropRow(
                  name: 'selectedBackgroundColor',
                  type: 'Color?',
                  description: 'Background when selected.',
                ),
                PropRow(
                  name: 'unselectedBackgroundColor',
                  type: 'Color?',
                  description: 'Background when unselected.',
                ),
                PropRow(
                  name: 'selectedBorderColor',
                  type: 'Color?',
                  description: 'Border when selected.',
                ),
                PropRow(
                  name: 'unselectedBorderColor',
                  type: 'Color?',
                  description: 'Border when unselected.',
                ),
                PropRow(
                  name: 'selectedTextColor',
                  type: 'Color?',
                  description: 'Text when selected.',
                ),
                PropRow(
                  name: 'unselectedTextColor',
                  type: 'Color?',
                  description: 'Text when unselected.',
                ),
                PropRow(
                  name: 'selectedBorderWidth',
                  type: 'double',
                  description: 'Border width when selected.',
                  defaultValue: '2',
                ),
                PropRow(
                  name: 'unselectedBorderWidth',
                  type: 'double',
                  description: 'Border width when unselected.',
                  defaultValue: '1',
                ),
              ],
              child: Wrap(
                spacing: 8,
                children: ['Flutter', 'Dart', 'Firebase', 'Material']
                    .asMap()
                    .entries
                    .map(
                      (e) => Ux4gFilterChip(
                        text: e.value,
                        selected: selectedSet.contains(e.key),
                        onClick: () => setState(
                          () => selectedSet.contains(e.key)
                              ? selectedSet.remove(e.key)
                              : selectedSet.add(e.key),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'With Icon',
      builder: (context) {
        final Set<int> selectedSet = {0};
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'FilterChip — With Icon',
              description: 'Filter chips with leading icons.',
              code: '''Ux4gFilterChip(
  text: 'Downloads',
  leadingContent: Icon(Icons.download, size: 16),
  selected: selectedSet.contains(0),
  onClick: () => setState(() => selectedSet.contains(0) ? selectedSet.remove(0) : selectedSet.add(0)),
);''',
              child: Wrap(
                spacing: 8,
                children: [
                  Ux4gFilterChip(
                    text: 'Downloads',
                    leadingContent: const Icon(Icons.download, size: 16),
                    selected: selectedSet.contains(0),
                    onClick: () => setState(
                      () => selectedSet.contains(0)
                          ? selectedSet.remove(0)
                          : selectedSet.add(0),
                    ),
                  ),
                  Ux4gFilterChip(
                    text: 'Cloud Storage',
                    leadingContent: const Icon(Icons.cloud, size: 16),
                    selected: selectedSet.contains(1),
                    onClick: () => setState(
                      () => selectedSet.contains(1)
                          ? selectedSet.remove(1)
                          : selectedSet.add(1),
                    ),
                  ),
                  Ux4gFilterChip(
                    text: 'Shared',
                    leadingContent: const Icon(Icons.share, size: 16),
                    selected: selectedSet.contains(2),
                    onClick: () => setState(
                      () => selectedSet.contains(2)
                          ? selectedSet.remove(2)
                          : selectedSet.add(2),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => ComponentDocs(
        name: 'FilterChip — Disabled',
        description: 'Filter chips in disabled state.',
        code: '''Ux4gFilterChip(
  text: 'Selected Disabled',
  selected: true,
  enabled: false,
  onClick: () {},
);''',
        child: Wrap(
          spacing: 8,
          children: [
            Ux4gFilterChip(
              text: 'Selected Disabled',
              selected: true,
              enabled: false,
              onClick: () {},
            ),
            Ux4gFilterChip(
              text: 'Unselected Disabled',
              selected: false,
              enabled: false,
              onClick: () {},
            ),
            Ux4gFilterChip(
              text: 'Icon Disabled',
              leadingContent: const Icon(Icons.lock, size: 16),
              selected: false,
              enabled: false,
              onClick: () {},
            ),
          ],
        ),
      ),
    ),
  ],
);

final inputChipComponent = WidgetbookComponent(
  name: 'InputChip',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        List<String> chips = ['Design', 'Code', 'Review'];
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'InputChip',
              description: 'Dismissible tag chips. Tap × to remove.',
              code: '''Ux4gInputChip(
  text: 'Design',
  onDismiss: () => setState(() => chips.remove('Design')),
);''',
              props: const [
                PropRow(
                  name: 'text',
                  type: 'String',
                  description: 'Chip label.',
                  required: true,
                ),
                PropRow(
                  name: 'onDismiss',
                  type: 'VoidCallback',
                  description: 'Called when × is tapped.',
                  required: true,
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gInputChipSize',
                  description: 'xs, s, or m.',
                  defaultValue: 'm',
                ),
                PropRow(
                  name: 'leadingContent',
                  type: 'Widget?',
                  description: 'Optional icon or widget before text.',
                ),
                PropRow(
                  name: 'borderRadius',
                  type: 'double',
                  description: 'Corner radius.',
                  defaultValue: 'Ux4gRadius.radius4',
                ),
                PropRow(
                  name: 'backgroundColor',
                  type: 'Color?',
                  description: 'Chip background color.',
                ),
                PropRow(
                  name: 'borderColor',
                  type: 'Color?',
                  description: 'Chip border color.',
                ),
                PropRow(
                  name: 'textColor',
                  type: 'Color?',
                  description: 'Chip text and icon color.',
                ),
                PropRow(
                  name: 'borderWidth',
                  type: 'double',
                  description: 'Border width.',
                  defaultValue: '1',
                ),
              ],
              child: Wrap(
                spacing: 8,
                children: chips
                    .map(
                      (c) => Ux4gInputChip(
                        text: c,
                        onDismiss: () => setState(() => chips.remove(c)),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'With Icon',
      builder: (context) {
        List<Map<String, dynamic>> chips = [
          {'label': 'Alice', 'icon': Icons.person},
          {'label': 'Bob', 'icon': Icons.person_outline},
          {'label': 'Charlie', 'icon': Icons.supervised_user_circle},
        ];
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'InputChip — With Icon',
              description: 'Input chips displaying leading icons or avatars.',
              code: '''Ux4gInputChip(
  text: 'Alice',
  leadingContent: Icon(Icons.person, size: 16),
  onDismiss: () {},
);''',
              child: Wrap(
                spacing: 8,
                children: chips
                    .map(
                      (c) => Ux4gInputChip(
                        text: c['label'] as String,
                        leadingContent: Icon(c['icon'] as IconData, size: 16),
                        onDismiss: () => setState(() => chips.remove(c)),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => ComponentDocs(
        name: 'InputChip — Disabled',
        description:
            'Input chips in disabled state where dismiss action is disabled.',
        code: '''Ux4gInputChip(
  text: 'Read-only Tag',
  enabled: false,
  onDismiss: () {},
);''',
        child: Wrap(
          spacing: 8,
          children: [
            Ux4gInputChip(text: 'Locked Tag', enabled: false, onDismiss: () {}),
            Ux4gInputChip(
              text: 'Admin Role',
              leadingContent: const Icon(Icons.security, size: 16),
              enabled: false,
              onDismiss: () {},
            ),
          ],
        ),
      ),
    ),
  ],
);

final inputChipFieldComponent = WidgetbookComponent(
  name: 'InputChipField',
  useCases: [
    WidgetbookUseCase(
      name: 'Interactive',
      builder: (context) {
        List<String> labels = ['Design', 'Code'];
        String currentText = '';
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'InputChipField',
              description:
                  'A text field that allows adding multiple chips/tags.',
              code: '''Ux4gInputChipField(
  value: currentText,
  onValueChange: (v) => setState(() => currentText = v),
  onAddChip: (v) => setState(() => labels.add(v)),
  chips: labels.map((l) => Ux4gInputChip(
    text: l, 
    onDismiss: () => setState(() => labels.remove(l)),
  )).toList(),
  placeholder: 'Add tag...',
);''',
              props: const [
                PropRow(
                  name: 'value',
                  type: 'String',
                  description: 'Current text in the input field.',
                  required: true,
                ),
                PropRow(
                  name: 'onValueChange',
                  type: 'ValueChanged<String>',
                  description: 'Called when input text changes.',
                  required: true,
                ),
                PropRow(
                  name: 'onAddChip',
                  type: 'ValueChanged<String>',
                  description: 'Called when the add button is pressed.',
                  required: true,
                ),
                PropRow(
                  name: 'chips',
                  type: 'List<Widget>',
                  description: 'List of chips to display below the field.',
                  defaultValue: '[]',
                ),
                PropRow(
                  name: 'arrangement',
                  type: 'Ux4gChipGroupArrangement',
                  description:
                      'Layout arrangement for chips: horizontal scroll (default) or wrap.',
                  defaultValue: 'horizontal',
                ),
                PropRow(
                  name: 'placeholder',
                  type: 'String',
                  description: 'Placeholder text.',
                  defaultValue: "'Please select..'",
                ),
                PropRow(
                  name: 'leadingIcon',
                  type: 'Widget?',
                  description: 'Icon at the start of the field.',
                ),
                PropRow(
                  name: 'isDropdown',
                  type: 'bool',
                  description:
                      'Whether to show a dropdown instead of text input.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'dropdownOptions',
                  type: 'List<String>',
                  description: 'Options if isDropdown is true.',
                  defaultValue: '[]',
                ),
              ],
              child: SizedBox(
                width: 340,
                child: Ux4gInputChipField(
                  value: currentText,
                  onValueChange: (v) => setState(() => currentText = v),
                  onAddChip: (v) => setState(() => labels.add(v)),
                  chips: labels
                      .map(
                        (l) => Ux4gInputChip(
                          text: l,
                          onDismiss: () => setState(() => labels.remove(l)),
                        ),
                      )
                      .toList(),
                  placeholder: 'Add tag...',
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Chip Group ───────────────────────────────────────────────────────────────

final chipGroupComponent = WidgetbookComponent(
  name: 'Chip Group',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Chip Group',
          description:
              'A collection of compact interactive chips for filtering or selecting options. Supports Filter (multi-select) and Choice (single-select) types, horizontal and wrapped layouts, and overflow handling for both desktop and mobile contexts.',
          showPreview: false,
          child: _ChipGroupVisualShowcase(),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Wrap',
      builder: (context) {
        int selected = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'ChipGroup (Wrap)',
              description:
                  'A collection of compact interactive chips for filtering or selecting options. Supports Filter (multi-select) and Choice (single-select) types, horizontal and wrapped layouts, and overflow handling for both desktop and mobile contexts. Image Image component displays photographic or illustrative content in a consistent and responsive manner. It supports configurable aspect ratios, corner styles, and overlays to maintain visual consistency across interfaces.',
              code: '''Ux4gChipGroup(
  arrangement: Ux4gChipGroupArrangement.wrap,
  spacing: 8,
  runSpacing: 8,
  chips: [
    Ux4gChoiceChip(text: 'English', selected: true, onClick: () {}),
    Ux4gChoiceChip(text: 'हिन्दी', selected: false, onClick: () {}),
    Ux4gChoiceChip(text: 'தமிழ்', selected: false, onClick: () {}),
    Ux4gChoiceChip(text: 'తెలుగు', selected: false, onClick: () {}),
  ],
);''',
              props: const [
                PropRow(
                  name: 'chips',
                  type: 'List<Widget>',
                  description: 'List of chip widgets to display.',
                  required: true,
                ),
                PropRow(
                  name: 'arrangement',
                  type: 'Ux4gChipGroupArrangement',
                  description: 'horizontal (scrollable) or wrap (multi-line).',
                  defaultValue: 'wrap',
                ),
                PropRow(
                  name: 'spacing',
                  type: 'double',
                  description: 'Horizontal gap between chips.',
                  defaultValue: '8.0',
                ),
                PropRow(
                  name: 'runSpacing',
                  type: 'double',
                  description: 'Vertical gap between rows (wrap mode only).',
                  defaultValue: '8.0',
                ),
              ],
              child: SizedBox(
                width: 260,
                child: Ux4gChipGroup(
                  arrangement: Ux4gChipGroupArrangement.wrap,
                  spacing: 8,
                  runSpacing: 8,
                  chips: [
                    Ux4gChoiceChip(
                      text: 'English',
                      selected: selected == 0,
                      onClick: () => setState(() => selected = 0),
                    ),
                    Ux4gChoiceChip(
                      text: 'हिन्दी',
                      selected: selected == 1,
                      onClick: () => setState(() => selected = 1),
                    ),
                    Ux4gChoiceChip(
                      text: 'தமிழ்',
                      selected: selected == 2,
                      onClick: () => setState(() => selected = 2),
                    ),
                    Ux4gChoiceChip(
                      text: 'తెలుగు',
                      selected: selected == 3,
                      onClick: () => setState(() => selected = 3),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Variants',
      builder: (context) {
        int selectedRow1 = 2; // Under Review
        Set<int> selectedRow2 = {1, 3}; // Full-Time, Remote
        return StatefulBuilder(
          builder: (ctx, setState) {
            final isDark = Theme.of(context).brightness == Brightness.dark;
            final primary = isDark
                ? Ux4gColors.primary300
                : Ux4gColors.primary600;
            final surface = Theme.of(context).colorScheme.surface;

            Widget buildBadge(String text, bool isSelected) {
              final typography = Theme.of(context).extension<Ux4gTypography>();
              final countStyle =
                  typography?.lS_default ??
                  const TextStyle(fontSize: 11, fontWeight: FontWeight.w500);

              return Container(
                constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                padding: EdgeInsets.symmetric(
                  horizontal: text.length <= 2 ? 0 : 4,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.transparent : primary,
                  borderRadius: BorderRadius.circular(100),
                ),
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: countStyle.copyWith(color: surface, height: 1.0),
                ),
              );
            }

            return ComponentDocs(
              name: 'ChipGroup — Variants',
              description:
                  'A collection of compact interactive chips for filtering or selecting options. Supports Filter (multi-select) and Choice (single-select) types, horizontal and wrapped layouts, and overflow handling for both desktop and mobile contexts. Image Image component displays photographic or illustrative content in a consistent and responsive manner. It supports configurable aspect ratios, corner styles, and overlays to maintain visual consistency across interfaces.',
              code: '''// Custom buildBadge method to match the design
Widget buildBadge(BuildContext context, String text, bool isSelected) {
  final typography = Theme.of(context).extension<Ux4gTypography>();
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final primary = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;
  final surface = Theme.of(context).colorScheme.surface;
  final countStyle = typography?.lS_default ?? const TextStyle(fontSize: 11, fontWeight: FontWeight.w500);

  return Container(
    constraints: const BoxConstraints(
      minWidth: 18,
      minHeight: 18,
    ),
    padding: EdgeInsets.symmetric(horizontal: text.length <= 2 ? 0 : 4),
    decoration: BoxDecoration(
      color: isSelected ? Colors.transparent : primary,
      borderRadius: BorderRadius.circular(100),
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: countStyle.copyWith(
        color: surface,
        height: 1.0,
      ),
    ),
  );
}

// Example: ChipGroup with badges (Single select)
Ux4gChipGroup(
  arrangement: Ux4gChipGroupArrangement.wrap,
  spacing: 12,
  chips: [
    Ux4gChoiceChip(
      text: 'All',
      selected: selectedRow1 == 0,
      onClick: () => setState(() => selectedRow1 = 0),
      trailingContent: buildBadge(context, '62', selectedRow1 == 0),
    ),
    Ux4gChoiceChip(
      text: 'Pending',
      selected: selectedRow1 == 1,
      onClick: () => setState(() => selectedRow1 = 1),
      trailingContent: buildBadge(context, '3', selectedRow1 == 1),
    ),
    Ux4gChoiceChip(
      text: 'Under Review',
      selected: selectedRow1 == 2,
      onClick: () => setState(() => selectedRow1 = 2),
      trailingContent: buildBadge(context, '12', selectedRow1 == 2),
    ),
    Ux4gChoiceChip(
      text: 'Approved',
      selected: selectedRow1 == 3,
      onClick: () => setState(() => selectedRow1 = 3),
      trailingContent: buildBadge(context, '41', selectedRow1 == 3),
    ),
    Ux4gChoiceChip(
      text: 'Rejected',
      selected: selectedRow1 == 4,
      onClick: () => setState(() => selectedRow1 = 4),
      trailingContent: buildBadge(context, '6', selectedRow1 == 4),
    ),
  ],
)

// Example: ChipGroup without badges (Multi-select)
Ux4gChipGroup(
  arrangement: Ux4gChipGroupArrangement.wrap,
  spacing: 12,
  chips: [
    Ux4gFilterChip(
      text: 'All',
      selected: selectedRow2.contains(0),
      onClick: () => setState(() {
        selectedRow2.contains(0) ? selectedRow2.remove(0) : selectedRow2.add(0);
      }),
    ),
    Ux4gFilterChip(
      text: 'Full-Time',
      selected: selectedRow2.contains(1),
      onClick: () => setState(() {
        selectedRow2.contains(1) ? selectedRow2.remove(1) : selectedRow2.add(1);
      }),
    ),
    Ux4gFilterChip(
      text: 'Part-Time',
      selected: selectedRow2.contains(2),
      onClick: () => setState(() {
        selectedRow2.contains(2) ? selectedRow2.remove(2) : selectedRow2.add(2);
      }),
    ),
    Ux4gFilterChip(
      text: 'Remote',
      selected: selectedRow2.contains(3),
      onClick: () => setState(() {
        selectedRow2.contains(3) ? selectedRow2.remove(3) : selectedRow2.add(3);
      }),
    ),
    Ux4gFilterChip(
      text: 'Hybrid',
      selected: selectedRow2.contains(4),
      onClick: () => setState(() {
        selectedRow2.contains(4) ? selectedRow2.remove(4) : selectedRow2.add(4);
      }),
    ),
  ],
)''',
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ux4gChipGroup(
                      arrangement: Ux4gChipGroupArrangement.wrap,
                      spacing: 12,
                      chips: [
                        Ux4gChoiceChip(
                          text: 'All',
                          selected: selectedRow1 == 0,
                          onClick: () => setState(() => selectedRow1 = 0),
                          trailingContent: buildBadge('62', selectedRow1 == 0),
                        ),
                        Ux4gChoiceChip(
                          text: 'Pending',
                          selected: selectedRow1 == 1,
                          onClick: () => setState(() => selectedRow1 = 1),
                          trailingContent: buildBadge('3', selectedRow1 == 1),
                        ),
                        Ux4gChoiceChip(
                          text: 'Under Review',
                          selected: selectedRow1 == 2,
                          onClick: () => setState(() => selectedRow1 = 2),
                          trailingContent: buildBadge('12', selectedRow1 == 2),
                        ),
                        Ux4gChoiceChip(
                          text: 'Approved',
                          selected: selectedRow1 == 3,
                          onClick: () => setState(() => selectedRow1 = 3),
                          trailingContent: buildBadge('41', selectedRow1 == 3),
                        ),
                        Ux4gChoiceChip(
                          text: 'Rejected',
                          selected: selectedRow1 == 4,
                          onClick: () => setState(() => selectedRow1 = 4),
                          trailingContent: buildBadge('6', selectedRow1 == 4),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Ux4gChipGroup(
                      arrangement: Ux4gChipGroupArrangement.wrap,
                      spacing: 12,
                      chips: [
                        Ux4gFilterChip(
                          text: 'All',
                          selected: selectedRow2.contains(0),
                          onClick: () => setState(() {
                            selectedRow2.contains(0)
                                ? selectedRow2.remove(0)
                                : selectedRow2.add(0);
                          }),
                        ),
                        Ux4gFilterChip(
                          text: 'Full-Time',
                          selected: selectedRow2.contains(1),
                          onClick: () => setState(() {
                            selectedRow2.contains(1)
                                ? selectedRow2.remove(1)
                                : selectedRow2.add(1);
                          }),
                        ),
                        Ux4gFilterChip(
                          text: 'Part-Time',
                          selected: selectedRow2.contains(2),
                          onClick: () => setState(() {
                            selectedRow2.contains(2)
                                ? selectedRow2.remove(2)
                                : selectedRow2.add(2);
                          }),
                        ),
                        Ux4gFilterChip(
                          text: 'Remote',
                          selected: selectedRow2.contains(3),
                          onClick: () => setState(() {
                            selectedRow2.contains(3)
                                ? selectedRow2.remove(3)
                                : selectedRow2.add(3);
                          }),
                        ),
                        Ux4gFilterChip(
                          text: 'Hybrid',
                          selected: selectedRow2.contains(4),
                          onClick: () => setState(() {
                            selectedRow2.contains(4)
                                ? selectedRow2.remove(4)
                                : selectedRow2.add(4);
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  ],
);

// ── Ux4gPaginationDotted ────────────────────────────────────────────────────────────────

final paginationDottedComponent = WidgetbookComponent(
  name: 'Pagination Dots Variant',
  useCases: [
    WidgetbookUseCase(
      name: 'Introduction',
      builder: (context) {
        return const ComponentDocs(
          name: 'Pagination',
          description:
              'Pagination divides large datasets into manageable pages, allowing users to navigate through information efficiently. It enhances performance, readability, and user experience in lists, tables, and search results.',
          showPreview: false,
          child: _PaginationDottedVisualShowcase(),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        int current = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'Pagination Dots Variant',
              description:
                  'Pagination divides large datasets into manageable pages, allowing users to navigate through information efficiently. It enhances performance, readability, and user experience in lists, tables, and search results. here.',
              code: '''Ux4gPaginationDotted(
  totalPageCount: 5,
  currentPageIndex: currentPage,
  onPageChange: (i) => setState(() => currentPage = i),
);''',
              props: const [
                PropRow(
                  name: 'totalPageCount',
                  type: 'int',
                  description: 'Total number of pages.',
                  required: true,
                ),
                PropRow(
                  name: 'currentPageIndex',
                  type: 'int',
                  description: 'Zero-based active page index.',
                  required: true,
                ),
                PropRow(
                  name: 'onPageChange',
                  type: 'ValueChanged<int>',
                  description: 'Called when dot is tapped.',
                  required: true,
                ),
                PropRow(
                  name: 'showArrows',
                  type: 'bool',
                  description: 'Show prev/next chevron buttons.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'arrowsOnRight',
                  type: 'bool',
                  description: 'Group chevrons together on the right side.',
                  defaultValue: 'false',
                ),
                PropRow(
                  name: 'variant',
                  type: 'Ux4gPaginationVariant',
                  description: 'defaultVariant or capsule.',
                  defaultValue: 'defaultVariant',
                ),
                PropRow(
                  name: 'size',
                  type: 'Ux4gPaginationSize',
                  description: 'small or medium.',
                  defaultValue: 'small',
                ),
                PropRow(
                  name: 'enabled',
                  type: 'bool',
                  description: 'Interactive state.',
                  defaultValue: 'true',
                ),
                PropRow(
                  name: 'activeColor',
                  type: 'Color?',
                  description: 'Color of the active dot.',
                ),
                PropRow(
                  name: 'inactiveColor',
                  type: 'Color?',
                  description: 'Background of inactive dots.',
                ),
                PropRow(
                  name: 'inactiveBorderColor',
                  type: 'Color?',
                  description: 'Border of inactive dots.',
                ),
                PropRow(
                  name: 'width',
                  type: 'double?',
                  description:
                      'Fixed width to auto-scale the component within.',
                ),
                PropRow(
                  name: 'height',
                  type: 'double?',
                  description:
                      'Fixed height to auto-scale the component within.',
                ),
              ],
              child: Ux4gPaginationIndicator(
                totalPageCount: context.knobs.int.input(
                  label: 'Count',
                  initialValue: 5,
                ),
                arrowsOnRight: context.knobs.boolean(
                  label: 'arrowsOnRight',
                  initialValue: false,
                ),
                currentPageIndex: current,
                onPageChange: (i) => setState(() => current = i),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Right Aligned Arrows',
      builder: (context) {
        int currentRow1 = 0;
        int currentRow2 = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            final isDark = Theme.of(context).brightness == Brightness.dark;
            final inactiveBg = isDark
                ? Ux4gColors.primary800.withValues(alpha: 0.4)
                : Ux4gColors.primary100;

            return ComponentDocs(
              name: 'PaginationIndicator - Right Aligned Arrows',
              description:
                  'Showcasing right-aligned navigation chevrons with default and outer capsule variants.',
              code: '''// Row 1: Default dots with right-aligned arrows
Ux4gPaginationIndicator(
  totalPageCount: 7,
  currentPageIndex: currentRow1,
  arrowsOnRight: true,
  size: Ux4gPaginationSize.medium,
  inactiveColor: inactiveBg,
  inactiveBorderColor: Colors.transparent,
  onPageChange: (i) => setState(() => currentRow1 = i),
);

// Row 2: Capsule dots with right-aligned arrows
Ux4gPaginationIndicator(
  totalPageCount: 7,
  currentPageIndex: currentRow2,
  variant: Ux4gPaginationVariant.capsule,
  arrowsOnRight: true,
  size: Ux4gPaginationSize.medium,
  inactiveColor: inactiveBg,
  inactiveBorderColor: Colors.transparent,
  onPageChange: (i) => setState(() => currentRow2 = i),
);''',
              child: SizedBox(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Ux4gPaginationIndicator(
                      totalPageCount: 7,
                      currentPageIndex: currentRow1,
                      arrowsOnRight: true,
                      size: Ux4gPaginationSize.medium,
                      inactiveColor: inactiveBg,
                      inactiveBorderColor: Colors.transparent,
                      onPageChange: (i) => setState(() => currentRow1 = i),
                    ),
                    const SizedBox(height: 32),
                    Ux4gPaginationIndicator(
                      totalPageCount: 7,
                      currentPageIndex: currentRow2,
                      variant: Ux4gPaginationVariant.capsule,
                      arrowsOnRight: true,
                      size: Ux4gPaginationSize.medium,
                      inactiveColor: inactiveBg,
                      inactiveBorderColor: Colors.transparent,
                      onPageChange: (i) => setState(() => currentRow2 = i),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Capsule Variant',
      builder: (context) {
        int currentWithArrows = 0;
        int currentWithoutArrows = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'PaginationIndicator - Capsule',
              description:
                  'The capsule variant wraps the pagination dots and arrows inside a pill-shaped container with a subtle background and border. It can be used with or without arrows.',
              code: '''// Capsule with arrows
Ux4gPaginationIndicator(
  totalPageCount: 5,
  currentPageIndex: currentPage,
  variant: Ux4gPaginationVariant.capsule,
  onPageChange: (i) => setState(() => currentPage = i),
);

// Capsule without arrows
Ux4gPaginationIndicator(
  totalPageCount: 7,
  currentPageIndex: currentPage,
  showArrows: false,
  variant: Ux4gPaginationVariant.capsule,
  onPageChange: (i) => setState(() => currentPage = i),
);''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('With Arrows'),
                  const SizedBox(height: 12),
                  Ux4gPaginationIndicator(
                    totalPageCount: 5,
                    currentPageIndex: currentWithArrows,
                    variant: Ux4gPaginationVariant.capsule,
                    onPageChange: (i) => setState(() => currentWithArrows = i),
                  ),
                  const SizedBox(height: 24),
                  const Text('Without Arrows (as in image)'),
                  const SizedBox(height: 12),
                  Ux4gPaginationIndicator(
                    totalPageCount: 7,
                    currentPageIndex: currentWithoutArrows,
                    showArrows: false,
                    variant: Ux4gPaginationVariant.capsule,
                    onPageChange: (i) =>
                        setState(() => currentWithoutArrows = i),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Sizes',
      builder: (context) {
        int currentSmall = 0;
        int currentMedium = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'PaginationIndicator - Sizes',
              description: 'Available in small (default) and medium sizes.',
              code: '''// Small
Ux4gPaginationIndicator(
  totalPageCount: 5,
  currentPageIndex: currentPage,
  size: Ux4gPaginationSize.small,
  onPageChange: (i) => setState(() => currentPage = i),
);

// Medium
Ux4gPaginationIndicator(
  totalPageCount: 5,
  currentPageIndex: currentPage,
  size: Ux4gPaginationSize.medium,
  onPageChange: (i) => setState(() => currentPage = i),
);''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Small (Default)'),
                  const SizedBox(height: 12),
                  Ux4gPaginationIndicator(
                    totalPageCount: 5,
                    currentPageIndex: currentSmall,
                    size: Ux4gPaginationSize.small,
                    onPageChange: (i) => setState(() => currentSmall = i),
                  ),
                  const SizedBox(height: 24),
                  const Text('Medium'),
                  const SizedBox(height: 12),
                  Ux4gPaginationIndicator(
                    totalPageCount: 5,
                    currentPageIndex: currentMedium,
                    size: Ux4gPaginationSize.medium,
                    onPageChange: (i) => setState(() => currentMedium = i),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'No Arrows',
      builder: (context) {
        int current = 0;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return ComponentDocs(
              name: 'PaginationIndicator - No Arrows',
              description:
                  'You can hide the prev/next arrow buttons by setting showArrows to false.',
              code: '''Ux4gPaginationIndicator(
  totalPageCount: 5,
  currentPageIndex: currentPage,
  showArrows: false,
  onPageChange: (i) => setState(() => currentPage = i),
);''',
              child: Ux4gPaginationIndicator(
                totalPageCount: 5,
                currentPageIndex: current,
                showArrows: false,
                onPageChange: (i) => setState(() => current = i),
              ),
            );
          },
        );
      },
    ),
  ],
);

final paginationComponent = paginationDottedComponent;

class _PaginationDottedVisualShowcase extends StatefulWidget {
  const _PaginationDottedVisualShowcase();

  @override
  State<_PaginationDottedVisualShowcase> createState() =>
      _PaginationDottedVisualShowcaseState();
}

class _PaginationDottedVisualShowcaseState
    extends State<_PaginationDottedVisualShowcase> {
  int _pageIndex1 = 2; // Default dots with arrows (as in image)
  int _pageIndex2 = 2; // Capsule with arrows
  int _pageIndex3 = 2; // Capsule without arrows
  int _pageIndex4 = 2; // Capsule with right-aligned arrows

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of pagination dot indicators, capsule container variants, and chevron alignments.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 32),

          // 1. Standard Dot Pagination (Matching Image Card)
          _buildPaginationSectionCard(
            title: 'Pagination Dots with Chevrons',
            isDark: isDark,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Ux4gPaginationIndicator(
                totalPageCount: 7,
                currentPageIndex: _pageIndex1,
                showArrows: true,
                onPageChange: (i) => setState(() => _pageIndex1 = i),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 2. Capsule Variant (With Arrows)
          _buildPaginationSectionCard(
            title: 'Capsule Variant with Arrows',
            isDark: isDark,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Ux4gPaginationIndicator(
                totalPageCount: 7,
                currentPageIndex: _pageIndex2,
                variant: Ux4gPaginationVariant.capsule,
                showArrows: true,
                onPageChange: (i) => setState(() => _pageIndex2 = i),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 3. Capsule Variant (Without Arrows)
          _buildPaginationSectionCard(
            title: 'Capsule Variant without Arrows',
            isDark: isDark,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Ux4gPaginationIndicator(
                totalPageCount: 7,
                currentPageIndex: _pageIndex3,
                variant: Ux4gPaginationVariant.capsule,
                showArrows: false,
                onPageChange: (i) => setState(() => _pageIndex3 = i),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 4. Capsule Variant (Right-Aligned Arrows)
          _buildPaginationSectionCard(
            title: 'Capsule Variant with Right-Aligned Arrows',
            isDark: isDark,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Ux4gPaginationIndicator(
                totalPageCount: 7,
                currentPageIndex: _pageIndex4,
                variant: Ux4gPaginationVariant.capsule,
                showArrows: true,
                arrowsOnRight: true,
                onPageChange: (i) => setState(() => _pageIndex4 = i),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaginationSectionCard({
    required String title,
    required Widget child,
    bool isDark = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _ChipVisualShowcase extends StatefulWidget {
  const _ChipVisualShowcase();

  @override
  State<_ChipVisualShowcase> createState() => _ChipVisualShowcaseState();
}

class _ChipVisualShowcaseState extends State<_ChipVisualShowcase> {
  // Card 1 state
  bool _card1ChoiceSelected = true;
  bool _card1FilterSelected = true;

  // Card 2 state
  int _card2SizeIndex = 1; // 0 for S, 1 for M
  bool _card2IconSelected = false;
  bool _card2AvatarSelected = true;

  // Card 3 state
  int _card3ChoiceIndex = 0;
  final Set<String> _card3Filters = {'Design System', 'Flutter'};
  final List<String> _card3Tags = ['Flutter', 'Dart', 'UX4G', 'UI Kit'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'A compact tour of the chip patterns used across the source-backed stories.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 32),
          // Card 1: Chip Types & Variants
          _buildChipSectionCard(
            title: 'Chip Types & Variants',
            isDark: isDark,
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Ux4gChoiceChip(
                  text: 'Choice Chip',
                  selected: _card1ChoiceSelected,
                  onClick: () => setState(() => _card1ChoiceSelected = !_card1ChoiceSelected),
                ),
                Ux4gFilterChip(
                  text: 'Filter Chip',
                  selected: _card1FilterSelected,
                  leadingContent: _card1FilterSelected
                      ? const Icon(Icons.check, size: 14, color: Color(0xFF4F46E5))
                      : null,
                  onClick: () => setState(() => _card1FilterSelected = !_card1FilterSelected),
                ),
                Ux4gInputChip(
                  text: 'Deletable Input',
                  onDismiss: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Deletable Input Chip dismissed'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Card 2: Sizes & Configurations
          _buildChipSectionCard(
            title: 'Sizes & Configurations',
            isDark: isDark,
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Ux4gChoiceChip(
                  text: 'Small (S)',
                  size: Ux4gChoiceChipSize.s,
                  selected: _card2SizeIndex == 0,
                  onClick: () => setState(() => _card2SizeIndex = 0),
                ),
                Ux4gChoiceChip(
                  text: 'Medium (M)',
                  size: Ux4gChoiceChipSize.m,
                  selected: _card2SizeIndex == 1,
                  onClick: () => setState(() => _card2SizeIndex = 1),
                ),
                Ux4gChoiceChip(
                  text: 'With Icon',
                  selected: _card2IconSelected,
                  leadingContent: const Icon(Icons.star_outline, size: 16),
                  onClick: () => setState(() => _card2IconSelected = !_card2IconSelected),
                ),
                Ux4gChoiceChip(
                  text: 'With Avatar',
                  selected: _card2AvatarSelected,
                  leadingContent: const CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    ),
                  ),
                  onClick: () => setState(() => _card2AvatarSelected = !_card2AvatarSelected),
                ),
                Ux4gChoiceChip(
                  text: 'Disabled',
                  selected: false,
                  enabled: false,
                  onClick: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Card 3: Interactive Working Live Patterns
          _buildChipSectionCard(
            title: 'Interactive Chip Patterns (Live Working)',
            isDark: isDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Single-Select Category (Choice Chips)',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white70 : Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(4, (index) {
                    final labels = ['All', 'Components', 'Templates', 'Guidelines'];
                    return Ux4gChoiceChip(
                      text: labels[index],
                      selected: _card3ChoiceIndex == index,
                      onClick: () => setState(() => _card3ChoiceIndex = index),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Text(
                  'Multi-Select Filters (Filter Chips)',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white70 : Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ['Design System', 'Flutter', 'Web', 'Mobile'].map((filter) {
                    final isSelected = _card3Filters.contains(filter);
                    return Ux4gFilterChip(
                      text: filter,
                      selected: isSelected,
                      leadingContent: isSelected
                          ? const Icon(Icons.check, size: 14, color: Color(0xFF4F46E5))
                          : null,
                      onClick: () {
                        setState(() {
                          if (isSelected) {
                            _card3Filters.remove(filter);
                          } else {
                            _card3Filters.add(filter);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Removable Input Tags (Input Chips)',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white70 : Colors.grey[800],
                      ),
                    ),
                    if (_card3Tags.length < 4)
                      InkWell(
                        onTap: () {
                          setState(() {
                            _card3Tags.clear();
                            _card3Tags.addAll(['Flutter', 'Dart', 'UX4G', 'UI Kit']);
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          child: Text(
                            'Reset Tags',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4F46E5),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                _card3Tags.isEmpty
                    ? Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E2130) : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'All tags dismissed. Click "Reset Tags" above to restore.',
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? Colors.white60 : Colors.grey[700],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _card3Tags.map((tag) {
                          return Ux4gInputChip(
                            text: tag,
                            onDismiss: () {
                              setState(() {
                                _card3Tags.remove(tag);
                              });
                            },
                          );
                        }).toList(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyStateVisualShowcase extends StatelessWidget {
  const _EmptyStateVisualShowcase();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Demonstration of semantic empty state variants including search results, empty data, coming soon, and error states.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 32),
          // Grid layout for 4 empty state variants
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              // 1. No Results
              _buildEmptyStateCard(
                title: 'No Results Preset',
                isDark: isDark,
                child: Ux4gEmptyState(
                  variant: Ux4gEmptyStateVariant.noResults,
                  title: 'No results found',
                  subtitle: 'Did you mean:',
                  description: 'Driving License, Ration Card',
                  buttonText: 'Clear all filters',
                  onButtonPressed: () {},
                ),
              ),
              // 2. No Data
              _buildEmptyStateCard(
                title: 'No Data Preset',
                isDark: isDark,
                child: Ux4gEmptyState(
                  variant: Ux4gEmptyStateVariant.noData,
                  title: 'No active applications',
                  subtitle: 'Start your application easily',
                  description: 'by clicking on the button below.',
                  buttonText: 'Start application',
                  onButtonPressed: () {},
                ),
              ),
              // 3. Coming Soon
              _buildEmptyStateCard(
                title: 'Coming Soon Preset',
                isDark: isDark,
                child: Ux4gEmptyState(
                  variant: Ux4gEmptyStateVariant.comingSoon,
                  title: 'Coming soon',
                  subtitle: 'This feature is under development.',
                  buttonText: 'Go Back',
                  onButtonPressed: () {},
                ),
              ),
              // 4. Error State
              _buildEmptyStateCard(
                title: 'Error Preset',
                isDark: isDark,
                child: Ux4gEmptyState(
                  variant: Ux4gEmptyStateVariant.error,
                  title: 'Could not load data',
                  subtitle: 'Last updated: 4 minutes ago',
                  buttonText: 'Refresh',
                  onButtonPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateCard({
    required String title,
    required Widget child,
    bool isDark = false,
  }) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2130) : Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isDark ? const Color(0xFF2D3348) : const Color(0xFFE5E7EB),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _DraftStatusVisualShowcase extends StatelessWidget {
  const _DraftStatusVisualShowcase();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ux4gTypography = Theme.of(context).extension<Ux4gTypography>();

    final titleColor = isDark ? const Color(0xFFF9FAFB) : const Color(0xFF111827);
    final warningBg = isDark ? const Color(0xFFAD4E00) : const Color(0xFFFFE7BF);
    final warningText = isDark ? const Color(0xFFFFC973) : const Color(0xFFAD4E00);

    final warningPillStyle =
        ux4gTypography?.lM_default?.copyWith(color: warningText) ??
        TextStyle(color: warningText, fontSize: 12, fontWeight: FontWeight.w500);

    final stepBadge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: warningBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text('Step 3 of 5 Document Upload', style: warningPillStyle),
    );

    final dateBadge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: warningBg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text('16 Apr', style: warningPillStyle),
    );

    final solidBannerBg = isDark ? const Color(0xFFFDBA74) : const Color(0xFFEA580C);
    final solidBannerTextColor = isDark ? const Color(0xFF111827) : const Color(0xFFF9FAFB);
    final solidBannerTitleStyle =
        ux4gTypography?.bS_strong?.copyWith(color: solidBannerTextColor) ??
        TextStyle(color: solidBannerTextColor, fontWeight: FontWeight.bold);

    final savingBgColor = isDark ? const Color(0xFF873C05) : const Color(0xFFFFF7E6);
    final savingTextColor = isDark ? const Color(0xFFD9D9D9) : const Color(0xFF737373);
    final savingTextStyle =
        ux4gTypography?.bS_default?.copyWith(color: savingTextColor) ??
        TextStyle(color: savingTextColor, fontSize: 14);

    final successBgColor = isDark ? const Color(0xFF00381F) : const Color(0xFFF2FCEF);
    final successIconColor = isDark ? const Color(0xFF1AA64A) : const Color(0xFF128937);
    final successTextStyle =
        ux4gTypography?.bS_default?.copyWith(color: isDark ? Colors.white : const Color(0xFF111827)) ??
        TextStyle(color: isDark ? Colors.white : const Color(0xFF111827), fontSize: 14);

    final errorBgColor = isDark ? const Color(0xFF60150F) : const Color(0xFFFFF8F8);
    final errorIconColor = isDark ? const Color(0xFFF55E57) : const Color(0xFFDB372D);
    final errorTextStyle =
        ux4gTypography?.bS_default?.copyWith(color: isDark ? Colors.white : const Color(0xFF111827)) ??
        const TextStyle(fontSize: 14);
    final actionTextColor = isDark ? const Color(0xFFFDBA74) : const Color(0xFF9A3412);
    final actionTextStyle =
        ux4gTypography?.lXL_default?.copyWith(color: actionTextColor) ??
        TextStyle(color: actionTextColor, fontWeight: FontWeight.bold);

    final successRightTextColor = isDark ? const Color(0xFF80DA88) : const Color(0xFF00522C);
    final successRightTextStyle =
        ux4gTypography?.bM_default?.copyWith(color: successRightTextColor) ??
        TextStyle(color: successRightTextColor, fontSize: 14);

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Implementation Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Visual demonstration of various Draft Status Bar types and save states.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),

          // 1. General Draft Status
          Text(
            'General Draft Status',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white70 : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          Ux4gStatusBanner(
            borderColor: Colors.transparent,
            variant: Ux4gBannerVariant.warningLight,
            leadingIcon: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFFFFE7BF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.inventory_2_outlined, size: 16, color: Color(0xFFAD4E00)),
            ),
            title: 'Income Certificate Application',
            badge: stepBadge,
            subtitle: 'Last saved: 10 Apr 2026',
            actionsAlignment: WrapAlignment.end,
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Discard',
                  style: TextStyle(color: Color(0xFFDB372D), fontWeight: FontWeight.w600),
                ),
              ),
              Ux4gButton(
                text: 'Resume',
                size: Ux4gButtonSize.small,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 2. Expiration Warnings
          Text(
            'Expiration Warnings',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // 2a. Expiring in 5 days
          Ux4gStatusBanner(
            borderColor: Colors.transparent,
            variant: Ux4gBannerVariant.warningLight,
            leadingIcon: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFFFFE7BF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.inventory_2_outlined, size: 16, color: Color(0xFFAD4E00)),
            ),
            title: 'Your draft expires in 5 days',
            badge: dateBadge,
          ),
          const SizedBox(height: 12),
          // 2b. Solid warning (Expires tomorrow)
          Ux4gStatusBanner(
            borderColor: Colors.transparent,
            variant: Ux4gBannerVariant.warningSolid,
            backgroundColor: solidBannerBg,
            leadingIcon: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.inventory_2_outlined, size: 16, color: Color(0xFFEA580C)),
            ),
            title: 'Your draft expires tomorrow. Submit today',
            titleStyle: solidBannerTitleStyle,
          ),
          const SizedBox(height: 12),
          // 2c. Expired error banner
          Ux4gStatusBanner(
            borderColor: Colors.transparent,
            variant: Ux4gBannerVariant.errorLight,
            backgroundColor: errorBgColor,
            title: 'Draft expired on 9 April 2026',
            titleStyle: errorTextStyle,
            leadingIcon: Icon(Icons.error_outline, color: errorIconColor),
            trailingIcon: Text('Action', style: actionTextStyle),
          ),
          const SizedBox(height: 24),

          // 3. Auto-save States
          Text(
            'Auto-save States',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // 3a. Saving state
          Ux4gStatusBanner(
            borderColor: Colors.transparent,
            variant: Ux4gBannerVariant.warningLight,
            backgroundColor: savingBgColor,
            title: '',
            trailingIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: Ux4gSpinner(strokeWidth: 2.0),
                ),
                const SizedBox(width: 8),
                Text('Saving', style: savingTextStyle),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // 3b. Saved timestamp state
          Ux4gStatusBanner(
            borderColor: Colors.transparent,
            variant: Ux4gBannerVariant.successLight,
            backgroundColor: successBgColor,
            title: '',
            trailingIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle_outline, size: 18, color: successIconColor),
                const SizedBox(width: 4),
                Text('Saved 3:14 PM', style: successRightTextStyle),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 4. Success State
          Text(
            'Success State',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Ux4gStatusBanner(
            borderColor: Colors.transparent,
            variant: Ux4gBannerVariant.successLight,
            backgroundColor: successBgColor,
            title: 'Draft saved successfully at 3:14 PM',
            titleStyle: successTextStyle,
            leadingIcon: Icon(Icons.check_circle_outline, color: successIconColor),
          ),
        ],
      ),
    );
  }
}

class _ChipGroupVisualShowcase extends StatefulWidget {
  const _ChipGroupVisualShowcase();

  @override
  State<_ChipGroupVisualShowcase> createState() => _ChipGroupVisualShowcaseState();
}

class _ChipGroupVisualShowcaseState extends State<_ChipGroupVisualShowcase> {
  int _selectedRow1 = 2; // Under Review
  final Set<int> _selectedRow2 = {1, 3}; // Full-Time, Remote

  Widget _buildBadge(BuildContext context, String text, bool isSelected) {
    final typography = Theme.of(context).extension<Ux4gTypography>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = isDark ? Ux4gColors.primary300 : Ux4gColors.primary600;
    final surface = Theme.of(context).colorScheme.surface;
    final countStyle = typography?.lS_default ??
        const TextStyle(fontSize: 11, fontWeight: FontWeight.w500);

    return Container(
      constraints: const BoxConstraints(
        minWidth: 18,
        minHeight: 18,
      ),
      padding: EdgeInsets.symmetric(horizontal: text.length <= 2 ? 0 : 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.transparent : primary,
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: countStyle.copyWith(
          color: surface,
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161925) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Showcase',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Interactive chip group patterns for application status filtering, employment types, and custom badges.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? Colors.white60 : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 32),
          _buildChipSectionCard(
            title: 'Application Status Filters with Badges',
            isDark: isDark,
            child: Ux4gChipGroup(
              arrangement: Ux4gChipGroupArrangement.wrap,
              spacing: 12,
              chips: [
                Ux4gChoiceChip(
                  text: 'All',
                  selected: _selectedRow1 == 0,
                  onClick: () => setState(() => _selectedRow1 = 0),
                  trailingContent: _buildBadge(context, '62', _selectedRow1 == 0),
                ),
                Ux4gChoiceChip(
                  text: 'Pending',
                  selected: _selectedRow1 == 1,
                  onClick: () => setState(() => _selectedRow1 = 1),
                  trailingContent: _buildBadge(context, '3', _selectedRow1 == 1),
                ),
                Ux4gChoiceChip(
                  text: 'Under Review',
                  selected: _selectedRow1 == 2,
                  onClick: () => setState(() => _selectedRow1 = 2),
                  trailingContent: _buildBadge(context, '12', _selectedRow1 == 2),
                ),
                Ux4gChoiceChip(
                  text: 'Approved',
                  selected: _selectedRow1 == 3,
                  onClick: () => setState(() => _selectedRow1 = 3),
                  trailingContent: _buildBadge(context, '41', _selectedRow1 == 3),
                ),
                Ux4gChoiceChip(
                  text: 'Rejected',
                  selected: _selectedRow1 == 4,
                  onClick: () => setState(() => _selectedRow1 = 4),
                  trailingContent: _buildBadge(context, '6', _selectedRow1 == 4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildChipSectionCard(
            title: 'Employment Type Filters',
            isDark: isDark,
            child: Ux4gChipGroup(
              arrangement: Ux4gChipGroupArrangement.wrap,
              spacing: 12,
              chips: [
                Ux4gFilterChip(
                  text: 'All',
                  selected: _selectedRow2.contains(0),
                  onClick: () => setState(() {
                    _selectedRow2.contains(0)
                        ? _selectedRow2.remove(0)
                        : _selectedRow2.add(0);
                  }),
                ),
                Ux4gFilterChip(
                  text: 'Full-Time',
                  selected: _selectedRow2.contains(1),
                  onClick: () => setState(() {
                    _selectedRow2.contains(1)
                        ? _selectedRow2.remove(1)
                        : _selectedRow2.add(1);
                  }),
                ),
                Ux4gFilterChip(
                  text: 'Part-Time',
                  selected: _selectedRow2.contains(2),
                  onClick: () => setState(() {
                    _selectedRow2.contains(2)
                        ? _selectedRow2.remove(2)
                        : _selectedRow2.add(2);
                  }),
                ),
                Ux4gFilterChip(
                  text: 'Remote',
                  selected: _selectedRow2.contains(3),
                  onClick: () => setState(() {
                    _selectedRow2.contains(3)
                        ? _selectedRow2.remove(3)
                        : _selectedRow2.add(3);
                  }),
                ),
                Ux4gFilterChip(
                  text: 'Hybrid',
                  selected: _selectedRow2.contains(4),
                  onClick: () => setState(() {
                    _selectedRow2.contains(4)
                        ? _selectedRow2.remove(4)
                        : _selectedRow2.add(4);
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildChipSectionCard({
  required String title,
  required Widget child,
  bool isDark = false,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      color: isDark ? const Color(0xFF1E2130) : Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      border: Border.all(
        color: isDark ? const Color(0xFF2D3348) : const Color(0xFFE5E7EB),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.02),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    ),
  );
}
