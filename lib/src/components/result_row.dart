import 'package:flutter/material.dart';
import '../foundation/colors.dart';
import '../foundation/dimensions.dart';
import '../foundation/typography.dart';
import 'buttons.dart';
import 'tag.dart';

/// Data model for detailed information items in the [Ux4gResultRow].
class Ux4gResultDetail {
  final String label;
  final String value;
  final IconData? icon;
  final Color? valueColor;
  final bool isBold;
  final Widget? customValueWidget;

  const Ux4gResultDetail({
    required this.label,
    required this.value,
    this.icon,
    this.valueColor,
    this.isBold = false,
    this.customValueWidget,
  });
}

/// A configurable expandable list item component for search results and application status.
class Ux4gResultRow extends StatefulWidget {
  final String title;
  final Widget? titleTrailing;
  final String? statusTag;
  final Ux4gTagColor tagColorScheme;
  final List<Ux4gPillSegment>? metadataSegments;
  
  /// A custom widget to display instead of [metadataSegments] (e.g. a Row of text with no borders or dividers).
  final Widget? customMetadata;
  
  final String? actionButtonText;
  
  /// A custom widget to display right before the action button (e.g. an alert icon).
  final Widget? actionLeading;
  
  final VoidCallback? onActionPressed;
  final IconData? actionButtonIcon;
  final Color? actionButtonColor;
  final List<Ux4gResultDetail> details;
  final Widget? expandedChild;
  final int detailsColumns;
  final bool initialExpanded;
  final ValueChanged<bool>? onToggle;
  final bool showBottomDivider;
  final EdgeInsetsGeometry contentPadding;

  const Ux4gResultRow({
    super.key,
    required this.title,
    this.titleTrailing,
    this.statusTag,
    this.tagColorScheme = Ux4gTagColor.neutral,
    this.metadataSegments,
    this.customMetadata,
    this.actionButtonText,
    this.actionLeading,
    this.onActionPressed,
    this.actionButtonIcon,
    this.actionButtonColor,
    this.details = const [],
    this.expandedChild,
    this.detailsColumns = 2,
    this.initialExpanded = false,
    this.onToggle,
    this.showBottomDivider = true,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: Ux4gSpace.space16,
      vertical: Ux4gSpace.space16,
    ),
  });

  @override
  State<Ux4gResultRow> createState() => _Ux4gResultRowState();
}

class _Ux4gResultRowState extends State<Ux4gResultRow>
    with SingleTickerProviderStateMixin {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initialExpanded;
  }

  void _handleToggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    widget.onToggle?.call(_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();
    final isDark = materialTheme.brightness == Brightness.dark;
    final borderColor = isDark
        ? Ux4gPalette.neutral800
        : Ux4gPalette.neutral300;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: _handleToggle,
          child: Padding(
            padding: widget.contentPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Content: Title, Tag, Metadata
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  (ux4gTypography?.bL_strong ??
                                          materialTheme.textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ) ??
                                          const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ))
                                      .copyWith(
                                        color:
                                            ux4gColors?.onBackground ??
                                            materialTheme.colorScheme.onSurface,
                                      ),
                            ),
                          ),
                          if (widget.titleTrailing != null) ...[
                            const SizedBox(width: Ux4gSpace.space4),
                            widget.titleTrailing!,
                          ],
                        ],
                      ),
                      if (widget.statusTag != null ||
                          (widget.metadataSegments != null &&
                              widget.metadataSegments!.isNotEmpty) ||
                          widget.customMetadata != null) ...[
                        const SizedBox(height: Ux4gSpace.space8),
                        Wrap(
                          spacing: Ux4gSpace.space8,
                          runSpacing: Ux4gSpace.space4,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            if (widget.statusTag != null)
                              Ux4gTag(
                                text: widget.statusTag!,
                                colorScheme: widget.tagColorScheme,
                                shape: Ux4gTagShape.rectangular,
                                style: Ux4gTagStyle.tonal,
                              ),
                            if (widget.customMetadata != null)
                              widget.customMetadata!
                            else if (widget.metadataSegments != null &&
                                widget.metadataSegments!.isNotEmpty)
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: Ux4gUnifiedPillTag(
                                  segments: widget.metadataSegments!,
                                  size: Ux4gTagSize.l,
                                  borderColor: borderColor,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(width: Ux4gSpace.space8),

                // Right Content: Action Button, Expand Arrow
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.actionLeading != null) ...[
                      widget.actionLeading!,
                      const SizedBox(width: Ux4gSpace.space8),
                    ],
                    if (widget.actionButtonText != null) ...[
                      Ux4gButton(
                        text: widget.actionButtonText!,
                        variant: Ux4gButtonVariant.outline,
                        size: Ux4gButtonSize.small,
                        contentColor: widget.actionButtonColor ??
                            (isDark ? Ux4gPalette.neutral50 : Ux4gPalette.neutral900),
                        borderColor: widget.actionButtonColor ??
                            (isDark ? Ux4gPalette.neutral600 : Ux4gPalette.neutral300),
                        leadingIcon: widget.actionButtonIcon,
                        onPressed: widget.onActionPressed ?? () {},
                      ),
                      const SizedBox(width: Ux4gSpace.space8),
                    ],
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color:
                            (ux4gColors?.onSurface ??
                                    materialTheme.colorScheme.onSurface)
                                .withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Expanded Details
        ClipRect(
          child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: _isExpanded
                ? Builder(
                    builder: (context) {
                      final resolvedPadding = widget.contentPadding.resolve(Directionality.of(context));
                      return Padding(
                        padding: EdgeInsets.only(
                          left: resolvedPadding.left,
                          right: resolvedPadding.right,
                          bottom: Ux4gSpace.space24,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final availableWidth = constraints.maxWidth;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.details.isNotEmpty)
                                  Wrap(
                                    runSpacing: Ux4gSpace.space20,
                                    children: List.generate(widget.details.length, (
                                      index,
                                    ) {
                                      final detail = widget.details[index];
                                      final columnCount =
                                          availableWidth > 400
                                          ? widget.detailsColumns
                                          : 1;
                                      return SizedBox(
                                        width: columnCount > 1
                                            ? (availableWidth -
                                                      Ux4gSpace.space80) /
                                                  columnCount
                                            : double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              detail.label,
                                              style:
                                                  (ux4gTypography?.bS_default ??
                                                          materialTheme
                                                              .textTheme
                                                              .bodySmall ??
                                                          const TextStyle())
                                                      .copyWith(
                                                        color:
                                                            (ux4gColors?.onSurface ??
                                                                    materialTheme
                                                                        .colorScheme
                                                                        .onSurface)
                                                                .withValues(alpha: 0.5),
                                                      ),
                                            ),
                                            const SizedBox(height: Ux4gSpace.space4),
                                            if (detail.customValueWidget != null)
                                              detail.customValueWidget!
                                            else
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if (detail.icon != null) ...[
                                                    Icon(
                                                      detail.icon,
                                                      size: 16,
                                                      color:
                                                          detail.valueColor ??
                                                          (ux4gColors?.onBackground ??
                                                              materialTheme
                                                                  .colorScheme
                                                                  .onSurface),
                                                    ),
                                                    const SizedBox(width: Ux4gSpace.space4),
                                                  ],
                                                  Flexible(
                                                    child: Text(
                                                      detail.value,
                                                      style:
                                                          (detail.isBold
                                                                  ? (ux4gTypography?.bM_strong ??
                                                                      materialTheme
                                                                          .textTheme
                                                                          .bodyMedium?.copyWith(
                                                                            fontWeight: FontWeight.w700,
                                                                          ) ??
                                                                      const TextStyle(fontWeight: FontWeight.bold))
                                                                  : (ux4gTypography?.bM_default ??
                                                                      materialTheme
                                                                          .textTheme
                                                                          .bodyMedium ??
                                                                      const TextStyle()))
                                                              .copyWith(
                                                                color:
                                                                    detail.valueColor ??
                                                                    (ux4gColors?.onBackground ??
                                                                        materialTheme
                                                                            .colorScheme
                                                                            .onSurface),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                if (widget.expandedChild != null)
                                  widget.expandedChild!,
                              ],
                            );
                          },
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ),

        if (widget.showBottomDivider)
          Divider(
            height: 1,
            thickness: 1,
            color:
                (ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface)
                    .withValues(alpha: 0.1),
          ),
      ],
    );
  }
}
