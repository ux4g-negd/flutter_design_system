import 'package:flutter/material.dart';
import '../foundation/colors.dart';
import '../foundation/typography.dart';

enum Ux4gSwitchSize {
  s(32, 18, 14, 2),
  m(40, 22, 18, 2),
  l(48, 28, 24, 2);

  final double width;
  final double height;
  final double thumbSize;
  final double thumbPadding;
  const Ux4gSwitchSize(
    this.width,
    this.height,
    this.thumbSize,
    this.thumbPadding,
  );
}

enum Ux4gSwitchLabelPosition { noLabel, left, right, bothSides }

@Deprecated('Use Ux4gSwitchSize instead')
typedef Ux4gToggleSize = Ux4gSwitchSize;

@Deprecated('Use Ux4gSwitchLabelPosition instead')
typedef Ux4gToggleLabelPosition = Ux4gSwitchLabelPosition;

@Deprecated('Use Ux4gSwitch instead')
typedef Ux4gToggle = Ux4gSwitch;

class Ux4gSwitch extends StatelessWidget {
  final bool checked;
  final ValueChanged<bool>? onCheckedChange;
  final String? label;
  final String? description;
  final Ux4gSwitchSize size;
  final Ux4gSwitchLabelPosition labelPosition;
  final bool enabled;

  // Added properties for advanced native label styling
  final bool isRequired;
  final Widget? icon;
  final TextStyle? labelStyle;
  final TextStyle? descriptionStyle;
  final String? secondaryLabel;
  final bool isSecondaryRequired;
  final Widget? secondaryIcon;

  const Ux4gSwitch({
    super.key,
    required this.checked,
    this.onCheckedChange,
    this.label,
    this.description,
    this.size = Ux4gSwitchSize.m,
    this.labelPosition = Ux4gSwitchLabelPosition.right,
    this.enabled = true,
    this.isRequired = false,
    this.icon,
    this.labelStyle,
    this.descriptionStyle,
    this.secondaryLabel,
    this.isSecondaryRequired = false,
    this.secondaryIcon,
  });

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();

    final onSurface =
        ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface;

    // Color definitions
    final isDark = materialTheme.brightness == Brightness.dark;
    final checkedTrackColor = ux4gColors?.primary ?? (isDark ? Ux4gColors.primary300 : Ux4gColors.primary600);
    final uncheckedTrackColor = isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral300;
    final disabledTrackColor = isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;

    final trackColor = !enabled ? disabledTrackColor : (checked ? checkedTrackColor : uncheckedTrackColor);

    final thumbColor = isDark && checked && enabled ? Ux4gColors.gray900 : Colors.white;

    final endOffset = size.width - size.thumbSize - size.thumbPadding;
    final startOffset = size.thumbPadding;

    Widget toggleControl = MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: enabled && onCheckedChange != null
            ? () => onCheckedChange!(!checked)
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: trackColor,
            borderRadius: BorderRadius.circular(size.height / 2),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                left: checked ? endOffset : startOffset,
                child: Container(
                  width: size.thumbSize,
                  height: size.thumbSize,
                  decoration: BoxDecoration(
                    color: thumbColor,
                    shape: BoxShape.circle,
                    boxShadow: enabled
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    TextStyle labelStyleFallback;
    TextStyle descStyleFallback;

    final lMDefault =
        ux4gTypography?.lM_default ??
        materialTheme.textTheme.labelMedium ??
        const TextStyle();
    final lSDefault =
        ux4gTypography?.lS_default ??
        materialTheme.textTheme.labelSmall ??
        const TextStyle();
    final lLDefault =
        ux4gTypography?.lL_default ??
        materialTheme.textTheme.labelLarge ??
        const TextStyle();
    final lXLDefault =
        ux4gTypography?.lXL_default ??
        materialTheme.textTheme.labelLarge?.copyWith(fontSize: 16) ??
        const TextStyle();

    switch (size) {
      case Ux4gSwitchSize.s:
        labelStyleFallback = lMDefault;
        descStyleFallback = lSDefault;
        break;
      case Ux4gSwitchSize.m:
        labelStyleFallback = lLDefault;
        descStyleFallback = lMDefault;
        break;
      case Ux4gSwitchSize.l:
        labelStyleFallback = lXLDefault;
        descStyleFallback = lLDefault;
        break;
    }

    final resolvedLabelStyle = labelStyle ?? labelStyleFallback;
    final resolvedDescStyle = descriptionStyle ?? descStyleFallback;

    Widget buildLabelWidget(String text, bool required, Widget? trailingIcon) {
      final color = enabled ? onSurface : onSurface.withValues(alpha: 0.38);
      Widget labelText = Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text,
              style: resolvedLabelStyle.copyWith(color: color),
            ),
            if (required)
              TextSpan(
                text: ' *',
                style: resolvedLabelStyle.copyWith(
                  color: materialTheme.colorScheme.error,
                ),
              ),
          ],
        ),
      );

      if (trailingIcon != null) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            labelText,
            const SizedBox(width: 6),
            trailingIcon,
          ],
        );
      }
      return labelText;
    }

    Widget buildTextsWidget(
        String? mainLabel, bool required, Widget? trailingIcon, String? desc) {
      if (mainLabel == null && desc == null) return const SizedBox.shrink();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (mainLabel != null) buildLabelWidget(mainLabel, required, trailingIcon),
          if (desc != null) ...[
            const SizedBox(height: 4),
            Text(
              desc,
              style: resolvedDescStyle.copyWith(
                color: enabled
                    ? onSurface.withValues(alpha: 0.7)
                    : onSurface.withValues(alpha: 0.38),
              ),
            ),
          ],
        ],
      );
    }

    if (labelPosition == Ux4gSwitchLabelPosition.noLabel) {
      return toggleControl;
    }

    if (labelPosition == Ux4gSwitchLabelPosition.bothSides) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildTextsWidget(label, isRequired, icon, description),
          const SizedBox(width: 12),
          toggleControl,
          if (secondaryLabel != null) ...[
            const SizedBox(width: 12),
            buildTextsWidget(secondaryLabel, isSecondaryRequired, secondaryIcon, null),
          ]
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (labelPosition == Ux4gSwitchLabelPosition.left) ...[
          buildTextsWidget(label, isRequired, icon, description),
          const SizedBox(width: 12),
          toggleControl,
        ] else ...[
          toggleControl,
          const SizedBox(width: 12),
          buildTextsWidget(label, isRequired, icon, description),
        ],
      ],
    );
  }
}
