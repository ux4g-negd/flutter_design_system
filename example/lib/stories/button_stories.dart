import 'package:flutter/material.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/component_docs.dart';

final buttonComponent = WidgetbookComponent(
  name: 'Buttons',
  useCases: [
    WidgetbookUseCase(
      name: 'Primary',
      builder: (context) {
        final typography = Theme.of(context).extension<Ux4gTypography>();
        final size = context.knobs.list(
          label: 'Size',
          options: Ux4gButtonSize.values,
          initialOption: Ux4gButtonSize.medium,
          labelBuilder: (v) => v.name,
        );

        double? width;
        double height;
        TextStyle? textStyle;

        switch (size) {
          case Ux4gButtonSize.small:
            height = 32;
            textStyle = typography?.lL_default;
          case Ux4gButtonSize.medium:
            height = 40;
            textStyle = typography?.lXL_default;
          case Ux4gButtonSize.large:
            height = 48;
            textStyle = typography?.lXL_default;
        }

        return ComponentDocs(
          name: 'Button',
          description:
              'The primary action button. Supports loading state, disabled state, '
              'and optional leading / trailing icons.',
          code: '''Ux4gButton(
  text: 'Primary Button',
  variant: Ux4gButtonVariant.primary,
  size: Ux4gButtonSize.medium,
  onPressed: () {},
);

// With loading state
Ux4gButton(
  text: 'Saving...',
  variant: Ux4gButtonVariant.primary,
  isLoading: true,
  onPressed: () {},
);

// Disabled
Ux4gButton(
  text: 'Disabled',
  variant: Ux4gButtonVariant.primary,
  enabled: false,
  onPressed: () {},
);''',
          props: const [
            PropRow(
              name: 'onPressed',
              type: 'VoidCallback?',
              description: 'Called when button is tapped.',
              required: true,
            ),
            PropRow(
              name: 'text',
              type: 'String?',
              description: 'Label inside the button.',
            ),
            PropRow(
              name: 'child',
              type: 'Widget?',
              description: 'Custom widget instead of text.',
            ),
            PropRow(
              name: 'variant',
              type: 'Ux4gButtonVariant',
              description: 'Visual variant of the button.',
              defaultValue: 'primary',
            ),
            PropRow(
              name: 'size',
              type: 'Ux4gButtonSize',
              description: 'Size of the button.',
              defaultValue: 'medium',
            ),
            PropRow(
              name: 'enabled',
              type: 'bool',
              description: 'Whether the button is interactive.',
              defaultValue: 'true',
            ),
            PropRow(
              name: 'isLoading',
              type: 'bool',
              description: 'Shows a spinner and disables interaction.',
              defaultValue: 'false',
            ),
            PropRow(
              name: 'backgroundColor',
              type: 'Color?',
              description: 'Custom background color.',
            ),
            PropRow(
              name: 'contentColor',
              type: 'Color?',
              description: 'Custom text/icon color.',
            ),
            PropRow(
              name: 'disabledBackgroundColor',
              type: 'Color?',
              description: 'Background color when disabled.',
            ),
            PropRow(
              name: 'disabledContentColor',
              type: 'Color?',
              description: 'Text/icon color when disabled.',
            ),
            PropRow(
              name: 'borderColor',
              type: 'Color?',
              description: 'Custom border color.',
            ),
            PropRow(
              name: 'borderWidth',
              type: 'double?',
              description: 'Custom border width.',
            ),
            PropRow(
              name: 'borderRadius',
              type: 'double?',
              description: 'Custom border radius.',
            ),
            PropRow(
              name: 'padding',
              type: 'EdgeInsetsGeometry?',
              description: 'Custom padding.',
            ),
            PropRow(
              name: 'leadingIcon',
              type: 'IconData?',
              description: 'Icon placed before the label.',
            ),
            PropRow(
              name: 'trailingIcon',
              type: 'IconData?',
              description: 'Icon placed after the label.',
            ),
            PropRow(
              name: 'iconSize',
              type: 'double?',
              description: 'Size of the icons.',
            ),
            PropRow(
              name: 'width',
              type: 'double?',
              description: 'Custom width.',
            ),
            PropRow(
              name: 'height',
              type: 'double?',
              description: 'Custom height.',
            ),
            PropRow(
              name: 'elevation',
              type: 'double?',
              description: 'Button elevation.',
            ),
            PropRow(
              name: 'textStyle',
              type: 'TextStyle?',
              description: 'Custom text style.',
            ),
          ],
          child: Ux4gButton(
            onPressed: () {},
            text: context.knobs.string(
              label: 'Text',
              initialValue: 'Primary Button',
            ),
            variant: Ux4gButtonVariant.primary,
            size: size,
            width: width,
            height: height,
            textStyle: textStyle,
            enabled: context.knobs.boolean(
              label: 'Enabled',
              initialValue: true,
            ),
            isLoading: context.knobs.boolean(
              label: 'Loading',
              initialValue: false,
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Variants',
      builder: (context) {
        final colors = Theme.of(context).extension<Ux4gThemeColors>()!;
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final colorTheme = context.knobs.list<String>(
          label: 'Color Theme',
          options: const ['Primary', 'Red', 'Neutral'],
          initialOption: 'Primary',
        );

        final isRed = colorTheme == 'Red';
        final isNeutral = colorTheme == 'Neutral';

        final bgColor = isRed
            ? colors.error
            : (isNeutral
                  ? (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200)
                  : null);
        final fgColor = isRed
            ? colors.onError
            : (isNeutral
                  ? (isDark ? Ux4gColors.neutral100 : Ux4gColors.neutral900)
                  : null);
        final outlineFgColor = isRed
            ? colors.error
            : (isNeutral
                  ? (isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800)
                  : null);

        final tonalBgColor = isRed
            ? (isDark ? Ux4gColors.red800 : Ux4gColors.red100)
            : (isNeutral
                  ? (isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200)
                  : (isDark ? Ux4gColors.primary800 : Ux4gColors.primary100));
        final tonalFgColor = isRed
            ? (isDark ? Ux4gColors.red300 : Ux4gColors.red600)
            : (isNeutral
                  ? (isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800)
                  : (isDark ? Ux4gColors.primary300 : Ux4gColors.primary600));

        final bgStr = isRed
            ? 'backgroundColor: ux4gColors.error, '
            : (isNeutral
                  ? 'backgroundColor: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200, '
                  : '');
        final fgStr = isRed
            ? 'contentColor: ux4gColors.onError, '
            : (isNeutral
                  ? 'contentColor: isDark ? Ux4gColors.neutral100 : Ux4gColors.neutral900, '
                  : '');
        final outlineFgStr = isRed
            ? 'contentColor: ux4gColors.error, borderColor: ux4gColors.error, '
            : (isNeutral
                  ? 'contentColor: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800, borderColor: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800, '
                  : '');
        final ghostFgStr = isRed
            ? 'contentColor: ux4gColors.error, '
            : (isNeutral
                  ? 'contentColor: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800, '
                  : '');

        final tonalBgStr = isRed
            ? 'backgroundColor: isDark ? Ux4gColors.red800 : Ux4gColors.red100, '
            : (isNeutral
                  ? 'backgroundColor: isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200, '
                  : 'backgroundColor: isDark ? Ux4gColors.primary800 : Ux4gColors.primary100, ');
        final tonalFgStr = isRed
            ? 'contentColor: isDark ? Ux4gColors.red300 : Ux4gColors.red600, '
            : (isNeutral
                  ? 'contentColor: isDark ? Ux4gColors.neutral200 : Ux4gColors.neutral800, '
                  : 'contentColor: isDark ? Ux4gColors.primary300 : Ux4gColors.primary600, ');

        return ComponentDocs(
          name: 'Button — Variants',
          description:
              'Different visual variants, loading states, and icon configurations including Tonal options.',
          code:
              '''// Basic
Ux4gButton(text: 'Primary', variant: Ux4gButtonVariant.primary, ${bgStr}${fgStr}onPressed: () {});
Ux4gButton(text: 'Tonal', variant: Ux4gButtonVariant.primary, ${tonalBgStr}${tonalFgStr}onPressed: () {});
Ux4gButton(text: 'Outline', variant: Ux4gButtonVariant.outline, ${outlineFgStr}onPressed: () {});
Ux4gButton(text: 'Ghost', variant: Ux4gButtonVariant.ghost, ${ghostFgStr}onPressed: () {});

// Loading
Ux4gButton(text: 'Button', variant: Ux4gButtonVariant.primary, ${bgStr}${fgStr}isLoading: true, onPressed: () {});
Ux4gButton(text: 'Tonal', variant: Ux4gButtonVariant.primary, ${tonalBgStr}${tonalFgStr}isLoading: true, onPressed: () {});
Ux4gButton(text: 'Button', variant: Ux4gButtonVariant.outline, ${outlineFgStr}isLoading: true, onPressed: () {});
Ux4gButton(text: 'Button', variant: Ux4gButtonVariant.ghost, ${ghostFgStr}isLoading: true, onPressed: () {});

// Icons
Ux4gButton(text: 'Button', variant: Ux4gButtonVariant.primary, ${bgStr}${fgStr}leadingIcon: Icons.add, onPressed: () {});
Ux4gButton(text: 'Tonal', variant: Ux4gButtonVariant.primary, ${tonalBgStr}${tonalFgStr}leadingIcon: Icons.add, onPressed: () {});
Ux4gButton(text: 'Button', variant: Ux4gButtonVariant.primary, ${bgStr}${fgStr}trailingIcon: Icons.arrow_drop_down, onPressed: () {});
Ux4gButton(text: 'Tonal', variant: Ux4gButtonVariant.primary, ${tonalBgStr}${tonalFgStr}trailingIcon: Icons.arrow_drop_down, onPressed: () {});
Ux4gButton(text: 'Button', variant: Ux4gButtonVariant.primary, ${bgStr}${fgStr}leadingIcon: Icons.add, trailingIcon: Icons.arrow_drop_down, onPressed: () {});
Ux4gButton(text: 'Tonal', variant: Ux4gButtonVariant.primary, ${tonalBgStr}${tonalFgStr}leadingIcon: Icons.add, trailingIcon: Icons.arrow_drop_down, onPressed: () {});''',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  Ux4gButton(
                    text: 'Primary',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: bgColor,
                    contentColor: fgColor,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Tonal',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: tonalBgColor,
                    contentColor: tonalFgColor,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Outline',
                    variant: Ux4gButtonVariant.outline,
                    contentColor: outlineFgColor,
                    borderColor: outlineFgColor,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Ghost',
                    variant: Ux4gButtonVariant.ghost,
                    contentColor: outlineFgColor,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  Ux4gButton(
                    text: 'Button',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: bgColor,
                    contentColor: fgColor,
                    isLoading: true,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Tonal',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: tonalBgColor,
                    contentColor: tonalFgColor,
                    isLoading: true,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Button',
                    variant: Ux4gButtonVariant.outline,
                    contentColor: outlineFgColor,
                    borderColor: outlineFgColor,
                    isLoading: true,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Button',
                    variant: Ux4gButtonVariant.ghost,
                    contentColor: outlineFgColor,
                    isLoading: true,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  Ux4gButton(
                    text: 'Button',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: bgColor,
                    contentColor: fgColor,
                    leadingIcon: Icons.add,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Tonal',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: tonalBgColor,
                    contentColor: tonalFgColor,
                    leadingIcon: Icons.add,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Button',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: bgColor,
                    contentColor: fgColor,
                    trailingIcon: Icons.arrow_drop_down,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Tonal',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: tonalBgColor,
                    contentColor: tonalFgColor,
                    trailingIcon: Icons.arrow_drop_down,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Button',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: bgColor,
                    contentColor: fgColor,
                    leadingIcon: Icons.add,
                    trailingIcon: Icons.arrow_drop_down,
                    onPressed: () {},
                  ),
                  Ux4gButton(
                    text: 'Tonal',
                    variant: Ux4gButtonVariant.primary,
                    backgroundColor: tonalBgColor,
                    contentColor: tonalFgColor,
                    leadingIcon: Icons.add,
                    trailingIcon: Icons.arrow_drop_down,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Sizes',
      builder: (context) => ComponentDocs(
        name: 'Button — Sizes',
        description:
            'Five size options ranging from XS to XL controlling height, width, and padding.',
        code:
            '''Ux4gButton(text: 'XS', width: 72, height: 24, padding: EdgeInsets.zero, onPressed: () {});
Ux4gButton(text: 'Small',  size: Ux4gButtonSize.small,  onPressed: () {});
Ux4gButton(text: 'Medium', size: Ux4gButtonSize.medium, onPressed: () {});
Ux4gButton(text: 'Large',  size: Ux4gButtonSize.large,  onPressed: () {});
Ux4gButton(text: 'XL', width: 109, height: 56, onPressed: () {});''',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Ux4gButton(
                onPressed: () {},
                text: 'XS',
                width: 72,
                height: 24,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ...Ux4gButtonSize.values.map(
              (s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Ux4gButton(
                  onPressed: () {},
                  text: s.name.toUpperCase(),
                  variant: Ux4gButtonVariant.primary,
                  size: s,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Ux4gButton(
                onPressed: () {},
                text: 'XL',
                width: 109,
                height: 56,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With Icons',
      builder: (context) => ComponentDocs(
        name: 'Button — With Icons',
        description:
            'Attach icons to the leading or trailing position of the button label.',
        code: '''Ux4gButton(
  text: 'Add Item',
  variant: Ux4gButtonVariant.primary,
  leadingIcon: Icons.add,
  onPressed: () {},
);

Ux4gButton(
  text: 'Next',
  variant: Ux4gButtonVariant.primary,
  trailingIcon: Icons.arrow_forward,
  onPressed: () {},
);''',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ux4gButton(
              onPressed: () {},
              text: 'Add Item',
              variant: Ux4gButtonVariant.primary,
              leadingIcon: Icons.add,
            ),
            const SizedBox(height: 12),
            Ux4gButton(
              onPressed: () {},
              text: 'Next',
              variant: Ux4gButtonVariant.primary,
              trailingIcon: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            Ux4gButton(
              onPressed: () {},
              text: 'Download',
              variant: Ux4gButtonVariant.outline,
              leadingIcon: Icons.download_outlined,
            ),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'States',
      builder: (context) => ComponentDocs(
        name: 'Button — States',
        description: 'Default, loading, and disabled states side by side.',
        code:
            'Ux4gButton(text: \'Default\',  onPressed: () {});\n'
            'Ux4gButton(text: \'Loading\',  isLoading: true, onPressed: () {});\n'
            'Ux4gButton(text: \'Disabled\', enabled: false,  onPressed: () {});',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ux4gButton(text: 'Default', onPressed: () {}),
            const SizedBox(height: 12),
            Ux4gButton(text: 'Loading…', isLoading: true, onPressed: () {}),
            const SizedBox(height: 12),
            Ux4gButton(text: 'Disabled', enabled: false, onPressed: () {}),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Convenience buttons',
      builder: (context) => ComponentDocs(
        name: 'OutlineButton & TextButton',
        description:
            'Shorthand constructors: OutlineButton wraps variant=outline, '
            'Ux4gTextButton wraps variant=ghost.',
        code:
            'Ux4gOutlineButton(text: \'Cancel\',           onPressed: () {});\n'
            'Ux4gTextButton(   text: \'Forgot password?\', onPressed: () {});',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ux4gOutlineButton(text: 'Outline Button', onPressed: () {}),
            const SizedBox(height: 12),
            Ux4gTextButton(text: 'Text / Ghost Button', onPressed: () {}),
          ],
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'IconButton',
      builder: (context) => ComponentDocs(
        name: 'IconButton',
        description:
            'A square icon-only button. Same variant/size system as Button.',
        code: '''Ux4gIconButton(icon: Icons.favorite, onPressed: () {});
Ux4gIconButton(icon: Icons.share,    variant: Ux4gButtonVariant.outline, onPressed: () {});
Ux4gIconButton(icon: Icons.delete,   variant: Ux4gButtonVariant.ghost,   onPressed: () {});''',
        props: const [
          PropRow(
            name: 'icon',
            type: 'IconData',
            description: 'The icon to display.',
            required: true,
          ),
          PropRow(
            name: 'onPressed',
            type: 'VoidCallback?',
            description: 'Called when tapped.',
            required: true,
          ),
          PropRow(
            name: 'variant',
            type: 'Ux4gButtonVariant',
            description: 'Visual style.',
            defaultValue: 'primary',
          ),
          PropRow(
            name: 'size',
            type: 'double',
            description: 'Button size.',
            defaultValue: '40',
          ),
          PropRow(
            name: 'enabled',
            type: 'bool',
            description: 'Whether the button is interactive.',
            defaultValue: 'true',
          ),
          PropRow(
            name: 'backgroundColor',
            type: 'Color?',
            description: 'Custom background color.',
          ),
          PropRow(
            name: 'contentColor',
            type: 'Color?',
            description: 'Custom icon color.',
          ),
          PropRow(
            name: 'disabledBackgroundColor',
            type: 'Color?',
            description: 'Background color when disabled.',
          ),
          PropRow(
            name: 'disabledContentColor',
            type: 'Color?',
            description: 'Icon color when disabled.',
          ),
          PropRow(
            name: 'borderColor',
            type: 'Color?',
            description: 'Custom border color.',
          ),
          PropRow(
            name: 'borderWidth',
            type: 'double?',
            description: 'Custom border width.',
          ),
          PropRow(
            name: 'borderRadius',
            type: 'double?',
            description: 'Custom border radius.',
          ),
          PropRow(
            name: 'padding',
            type: 'EdgeInsetsGeometry?',
            description: 'Custom padding.',
          ),
          PropRow(
            name: 'isLoading',
            type: 'bool',
            description: 'Shows a spinner and disables interaction.',
            defaultValue: 'false',
          ),
          PropRow(
            name: 'tooltip',
            type: 'String?',
            description: 'Optional tooltip text.',
          ),
        ],
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Ux4gIconButton(onPressed: () {}, icon: Icons.favorite),
            const SizedBox(width: 12),
            Ux4gIconButton(
              onPressed: () {},
              icon: Icons.share,
              variant: Ux4gButtonVariant.outline,
            ),
            const SizedBox(width: 12),
            Ux4gIconButton(
              onPressed: () {},
              icon: Icons.delete,
              variant: Ux4gButtonVariant.ghost,
            ),
          ],
        ),
      ),
    ),
  ],
);
