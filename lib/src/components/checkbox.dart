import 'package:flutter/material.dart';
import '../foundation/colors.dart';
import '../foundation/typography.dart';

enum Ux4gCheckboxSize {
  small(16),
  medium(20),
  large(24);

  final double size;
  const Ux4gCheckboxSize(this.size);
}

enum Ux4gCheckboxDescriptionVariant { helper, error, warning, success }

class Ux4gCheckbox extends StatelessWidget {
  final bool? value; // true = On, false = Off, null = Indeterminate
  final ValueChanged<bool?> onChanged;
  final String? label;
  final String? description;
  final Ux4gCheckboxSize size;
  final bool isRequired;
  final bool hasError;
  final Ux4gCheckboxDescriptionVariant descriptionVariant;
  final bool enabled;
  final CrossAxisAlignment crossAxisAlignment;

  const Ux4gCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
    this.size = Ux4gCheckboxSize.medium,
    this.isRequired = false,
    this.hasError = false,
    this.descriptionVariant = Ux4gCheckboxDescriptionVariant.helper,
    this.enabled = true,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();

    final descriptionColor = switch (descriptionVariant) {
      Ux4gCheckboxDescriptionVariant.helper =>
        (ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface)
            .withValues(alpha: 0.7),
      Ux4gCheckboxDescriptionVariant.error =>
        ux4gColors?.error ?? materialTheme.colorScheme.error,
      Ux4gCheckboxDescriptionVariant.warning =>
        ux4gColors?.warning ?? Colors.orange,
      Ux4gCheckboxDescriptionVariant.success =>
        ux4gColors?.success ?? Colors.green,
    };

    final labelTextStyle = switch (size) {
      Ux4gCheckboxSize.small =>
        ux4gTypography?.lM_default ??
            materialTheme.textTheme.labelMedium ??
            const TextStyle(),
      Ux4gCheckboxSize.medium =>
        ux4gTypography?.lL_default ??
            materialTheme.textTheme.labelLarge ??
            const TextStyle(),
      Ux4gCheckboxSize.large =>
        ux4gTypography?.lXL_default ??
            materialTheme.textTheme.labelLarge?.copyWith(fontSize: 16) ??
            const TextStyle(),
    };

    final hasDescription = description != null && description!.trim().isNotEmpty;
    final hasLabel = label != null && label!.trim().isNotEmpty;

    return InkWell(
      onTap: enabled ? () => onChanged(value == null ? true : !value!) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: crossAxisAlignment == CrossAxisAlignment.start
                    ? (hasDescription ? 2 : 1)
                    : 0,
              ),
              child: SizedBox(
                width: size.size,
                height: size.size,
                child: Checkbox(
                  value: value,
                  tristate: true,
                  onChanged: enabled ? onChanged : null,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  activeColor:
                      ux4gColors?.primary ?? materialTheme.colorScheme.primary,
                  checkColor:
                      ux4gColors?.onPrimary ??
                      materialTheme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(
                    color: !enabled
                        ? (ux4gColors?.onSurface ??
                                  materialTheme.colorScheme.onSurface)
                              .withValues(alpha: 0.12)
                        : (hasError || descriptionVariant == Ux4gCheckboxDescriptionVariant.error
                            ? (ux4gColors?.error ?? materialTheme.colorScheme.error)
                            : (materialTheme.brightness == Brightness.dark
                                ? Ux4gColors.neutral700
                                : Ux4gColors.neutral200)),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            if (hasLabel || hasDescription) ...[
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (hasLabel)
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: label!,
                              style: labelTextStyle.copyWith(
                                color: enabled
                                    ? (ux4gColors?.onSurface ??
                                          materialTheme.colorScheme.onSurface)
                                    : (ux4gColors?.onSurface ??
                                              materialTheme
                                                  .colorScheme
                                                  .onSurface)
                                          .withValues(alpha: 0.38),
                              ),
                            ),
                            if (isRequired)
                              TextSpan(
                                text: " *",
                                style: labelTextStyle.copyWith(
                                  color:
                                      ux4gColors?.error ??
                                      materialTheme.colorScheme.error,
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (hasDescription) ...[
                      const SizedBox(height: 4),
                      Text(
                        description!,
                        style:
                            (ux4gTypography?.lS_default ??
                                    materialTheme.textTheme.labelSmall ??
                                    const TextStyle())
                                .copyWith(color: descriptionColor),
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
