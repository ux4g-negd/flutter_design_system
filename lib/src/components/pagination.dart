import 'package:flutter/material.dart';
import '../foundation/colors.dart';

enum Ux4gPaginationVariant { defaultVariant, capsule }

enum Ux4gPaginationSize {
  small(10, 8, 24),
  medium(12, 10, 32);

  final double dotSize;
  final double spacing;
  final double arrowSize;
  const Ux4gPaginationSize(this.dotSize, this.spacing, this.arrowSize);
}

class Ux4gPaginationIndicator extends StatelessWidget {
  final int totalPageCount;
  final int currentPageIndex;
  final ValueChanged<int> onPageChange;
  final bool showArrows;
  final bool arrowsOnRight;
  final Ux4gPaginationVariant variant;
  final Ux4gPaginationSize size;
  final bool enabled;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? inactiveBorderColor;
  final double? width;
  final double? height;

  const Ux4gPaginationIndicator({
    super.key,
    required this.totalPageCount,
    required this.currentPageIndex,
    required this.onPageChange,
    this.showArrows = true,
    this.arrowsOnRight = false,
    this.variant = Ux4gPaginationVariant.defaultVariant,
    this.size = Ux4gPaginationSize.small,
    this.enabled = true,
    this.activeColor,
    this.inactiveColor,
    this.inactiveBorderColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final uxColors = Theme.of(context).extension<Ux4gColors>();
    final materialTheme = Theme.of(context);

    final effectiveActiveColor =
        activeColor ?? uxColors?.primary ?? materialTheme.colorScheme.primary;
    final effectiveInactiveColor =
        inactiveColor ?? uxColors?.surface ?? materialTheme.colorScheme.surface;
    final effectiveInactiveBorderColor =
        inactiveBorderColor ??
        (uxColors?.onSurface ?? materialTheme.colorScheme.onSurface).withValues(
          alpha: 0.3,
        );

    Widget dotsRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalPageCount, (index) {
        return Padding(
          padding: EdgeInsets.only(
            right: index == totalPageCount - 1 ? 0 : size.spacing,
          ),
          child: _buildDot(
            context,
            index == currentPageIndex,
            () => onPageChange(index),
            effectiveActiveColor,
            effectiveInactiveColor,
            effectiveInactiveBorderColor,
          ),
        );
      }),
    );

    Widget mainContent;

    if (arrowsOnRight) {
      Widget dotsContent = dotsRow;
      if (variant == Ux4gPaginationVariant.capsule) {
        dotsContent = Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: uxColors?.surface ?? materialTheme.colorScheme.surface,
            borderRadius: BorderRadius.circular(999),
          ),
          child: dotsRow,
        );
      }

      Widget arrowsGroup = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildArrow(
            context,
            Icons.chevron_left,
            enabled && currentPageIndex > 0,
            () => onPageChange(currentPageIndex - 1),
            effectiveActiveColor,
          ),
          SizedBox(width: size.spacing * 1.2),
          _buildArrow(
            context,
            Icons.chevron_right,
            enabled && currentPageIndex < totalPageCount - 1,
            () => onPageChange(currentPageIndex + 1),
            effectiveActiveColor,
          ),
        ],
      );

      mainContent = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          dotsContent,
          if (showArrows) arrowsGroup,
        ],
      );
    } else {
      Widget content = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showArrows) ...[
            _buildArrow(
              context,
              Icons.chevron_left,
              enabled && currentPageIndex > 0,
              () => onPageChange(currentPageIndex - 1),
              effectiveActiveColor,
            ),
            SizedBox(width: size.spacing),
          ],
          dotsRow,
          if (showArrows) ...[
            SizedBox(width: size.spacing),
            _buildArrow(
              context,
              Icons.chevron_right,
              enabled && currentPageIndex < totalPageCount - 1,
              () => onPageChange(currentPageIndex + 1),
              effectiveActiveColor,
            ),
          ],
        ],
      );

      mainContent = content;
      if (variant == Ux4gPaginationVariant.capsule) {
        mainContent = Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: uxColors?.surface ?? materialTheme.colorScheme.surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: effectiveActiveColor.withValues(alpha: 0.12),
            ),
          ),
          child: content,
        );
      }
    }

    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: FittedBox(
          fit: BoxFit.contain,
          child: mainContent,
        ),
      );
    }

    return mainContent;
  }

  Widget _buildDot(
    BuildContext context,
    bool isSelected,
    VoidCallback onClick,
    Color activeColor,
    Color inactiveColor,
    Color inactiveBorderColor,
  ) {
    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: enabled ? onClick : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isSelected ? size.dotSize * 2.5 : size.dotSize,
          height: size.dotSize,
          decoration: BoxDecoration(
            color: isSelected
                ? (enabled ? activeColor : activeColor.withValues(alpha: 0.38))
                : inactiveColor,
            borderRadius: BorderRadius.circular(999),
            border: isSelected ? null : Border.all(color: inactiveBorderColor),
          ),
        ),
      ),
    );
  }

  Widget _buildArrow(
    BuildContext context,
    IconData icon,
    bool canClick,
    VoidCallback onClick,
    Color activeColor,
  ) {
    return MouseRegion(
      cursor: canClick ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: canClick ? onClick : null,
        child: Container(
          width: size.arrowSize,
          height: size.arrowSize,
          decoration: BoxDecoration(
            color: activeColor.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: size.arrowSize * 0.5,
            color: canClick ? activeColor : activeColor.withValues(alpha: 0.38),
          ),
        ),
      ),
    );
  }
}
