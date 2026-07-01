import 'package:flutter/material.dart';
import '../foundation/colors.dart';
import '../foundation/dimensions.dart';
import '../foundation/typography.dart';

enum Ux4gRadioButtonSize {
  small(16.0, 8.0),
  medium(20.0, 10.0),
  large(24.0, 12.0);

  final double size;
  final double dotSize;
  const Ux4gRadioButtonSize(this.size, this.dotSize);
}

enum Ux4gRadioButtonDescriptionVariant { helper, error, warning, success }

/// Visual status for the radio circle itself (independent of selection).
/// Drives the ring color so callers can render error / warning / success
/// states consistently (e.g. validation errors on the parent form).
enum Ux4gRadioButtonStatus { defaultStatus, error, warning, success }

class Ux4gRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final String? label;
  final String? description;
  final Ux4gRadioButtonSize size;
  final bool isRequired;
  final IconData? trailingIcon;
  final Ux4gRadioButtonDescriptionVariant descriptionVariant;
  final Ux4gRadioButtonStatus status;

  /// Optional override for the radio circle color. When set, takes
  /// precedence over [status] and the theme primary color.
  /// Useful when you need a brand-specific color outside the standard
  /// status palette.
  final Color? color;

  final Color? labelColor;
  final TextStyle? labelStyle;
  final TextStyle? descriptionStyle;

  final bool enabled;

  const Ux4gRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.label,
    this.description,
    this.size = Ux4gRadioButtonSize.medium,
    this.isRequired = false,
    this.trailingIcon,
    this.descriptionVariant = Ux4gRadioButtonDescriptionVariant.helper,
    this.status = Ux4gRadioButtonStatus.defaultStatus,
    this.color,
    this.labelColor,
    this.labelStyle,
    this.descriptionStyle,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final isDark = materialTheme.brightness == Brightness.dark;
    final ux4gColors = materialTheme.extension<Ux4gColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();

    final isSelected = value == groupValue;

    final onSurface = ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface;

    final descriptionColor = switch (descriptionVariant) {
      Ux4gRadioButtonDescriptionVariant.helper =>
        onSurface.withValues(alpha: 0.7),
      Ux4gRadioButtonDescriptionVariant.error =>
        ux4gColors?.error ?? materialTheme.colorScheme.error,
      Ux4gRadioButtonDescriptionVariant.warning =>
        ux4gColors?.warning ?? Ux4gPalette.secondary,
      Ux4gRadioButtonDescriptionVariant.success =>
        ux4gColors?.success ?? Ux4gPalette.green,
    };

    final descriptionIcon = switch (descriptionVariant) {
      Ux4gRadioButtonDescriptionVariant.helper => Icons.info_outline,
      Ux4gRadioButtonDescriptionVariant.error => Icons.error_outline,
      Ux4gRadioButtonDescriptionVariant.warning => Icons.warning_amber_outlined,
      Ux4gRadioButtonDescriptionVariant.success => Icons.check_circle_outline,
    };

    final resolvedLabelTextStyle = labelStyle ?? switch (size) {
      Ux4gRadioButtonSize.small =>
        ux4gTypography?.lM_default ??
            materialTheme.textTheme.labelMedium ??
            const TextStyle(),
      Ux4gRadioButtonSize.medium =>
        ux4gTypography?.lL_default ??
            materialTheme.textTheme.labelLarge ??
            const TextStyle(),
      Ux4gRadioButtonSize.large =>
        ux4gTypography?.lXL_default ??
            materialTheme.textTheme.labelLarge?.copyWith(fontSize: 16) ??
            const TextStyle(),
    };

    final resolvedDescriptionTextStyle = descriptionStyle ?? switch (size) {
      Ux4gRadioButtonSize.small =>
        ux4gTypography?.lS_default ??
            materialTheme.textTheme.labelSmall ??
            const TextStyle(),
      Ux4gRadioButtonSize.medium =>
        ux4gTypography?.lM_default ??
            materialTheme.textTheme.labelMedium ??
            const TextStyle(),
      Ux4gRadioButtonSize.large =>
        ux4gTypography?.lL_default ??
            materialTheme.textTheme.labelLarge ??
            const TextStyle(),
    };

    // Resolve the radio circle color based on status + state.
    final statusColor = switch (status) {
      Ux4gRadioButtonStatus.error =>
        ux4gColors?.error ?? materialTheme.colorScheme.error,
      Ux4gRadioButtonStatus.warning =>
        ux4gColors?.warning ?? Ux4gPalette.secondary,
      Ux4gRadioButtonStatus.success => ux4gColors?.success ?? Ux4gPalette.green,
      Ux4gRadioButtonStatus.defaultStatus => null,
    };

    final unselectedBorderColor = isDark ? Ux4gPalette.neutral700 : Ux4gPalette.neutral300;

    final radioColor = !enabled
        ? onSurface.withValues(alpha: 0.38)
        : isSelected
            ? (color ?? statusColor ?? (ux4gColors?.primary ?? materialTheme.colorScheme.primary))
            : unselectedBorderColor;

    // Selected state renders as a thick filled ring with a white inner
    // disc (donut) — see reference design. Unselected state is a thin
    // 1.5px outlined circle.
    final selectedRingThickness = size.size * 0.28;
    final disabledFillColor = onSurface.withValues(alpha: 0.1);
    final disabledBorderColor = onSurface.withValues(alpha: 0.2);

    return InkWell(
      onTap: enabled ? () => onChanged(value) : null,
      borderRadius: BorderRadius.circular(Ux4gRadius.radius4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: isSelected
                  ? Container(
                      width: size.size,
                      height: size.size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: !enabled ? disabledFillColor : radioColor,
                        border: !enabled ? Border.all(color: Colors.transparent, width: 0) : null,
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: size.size - selectedRingThickness * 2,
                        height: size.size - selectedRingThickness * 2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: !enabled ? radioColor : (isDark ? Colors.black : Colors.white),
                        ),
                      ),
                    )
                  : Container(
                      width: size.size,
                      height: size.size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: !enabled ? disabledFillColor : Colors.transparent,
                        border: !enabled
                            ? Border.all(color: Colors.transparent, width: 0)
                            : Border.all(color: radioColor, width: 1.5),
                      ),
                    ),
            ),
            if (label != null || description != null) ...[
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (label != null)
                      Row(
                        children: [
                          Text(
                            label!,
                            style: resolvedLabelTextStyle.copyWith(
                              color: !enabled
                                  ? onSurface.withValues(alpha: 0.38)
                                  : labelColor ?? onSurface,
                            ),
                          ),
                          if (isRequired) ...[
                            const SizedBox(width: 4),
                            Text(
                              '*',
                              style: resolvedLabelTextStyle.copyWith(
                                color:
                                    ux4gColors?.error ??
                                    materialTheme.colorScheme.error,
                              ),
                            ),
                          ],
                          if (trailingIcon != null) ...[
                            const SizedBox(width: 4),
                            Icon(
                              trailingIcon,
                              size: size.size,
                              color: enabled
                                  ? (ux4gColors?.onSurface ??
                                        materialTheme.colorScheme.onSurface)
                                  : (ux4gColors?.onSurface ??
                                            materialTheme.colorScheme.onSurface)
                                        .withValues(alpha: 0.38),
                            ),
                          ],
                        ],
                      ),
                    if (description != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            descriptionIcon,
                            size: 16,
                            color: descriptionColor,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              description!,
                              style: resolvedDescriptionTextStyle.copyWith(
                                color: descriptionColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
