import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../foundation/colors.dart';
import '../foundation/typography.dart';

// ─── TYPES & INTERFACES ──────────────────────────────────────────────────────

/// Indicator style for active tab item:
/// - `pill`: Soft rounded purple capsule background behind active tab
/// - `bar`: Purple horizontal bar indicator at the top of the active tab
/// - `plain`: Clean active color highlight for icon and text without extra background/bar
enum Ux4gBottomNavIndicatorVariant { pill, bar, plain }

/// High-level layout / shape variant preset:
/// - `labelled`: Standard flat bottom bar with icons and text labels
/// - `topRounded`: Bottom bar with rounded top-left and top-right corners
/// - `iconOnly`: Icons only without text labels
/// - `centreAction`: Bottom bar with a prominent circular action button in the center
/// - `floatingPill`: Floating capsule bar with rounded edges detached from screen borders
enum Ux4gBottomNavVariant {
  labelled,
  topRounded,
  iconOnly,
  centreAction,
  floatingPill,
}

/// Geometric shape of the bottom navigation bar container
enum Ux4gBottomNavShape { rectangular, topRounded, floatingPill }

/// Individual navigation tab item definition
class Ux4gBottomNavItem {
  /// Unique key for the tab item
  final String? key;

  /// Label text displayed under or alongside the icon
  final String label;

  /// Icon: can be [IconData], [Widget], or a builder function `(bool isActive, Color color) => Widget`
  final dynamic icon;

  /// Optional separate icon to render when tab is active
  final dynamic activeIcon;

  /// Optional badge count or text (e.g. 5, "99+", true for a red dot)
  final dynamic badge;

  /// Custom badge background color
  final Color? badgeColor;

  /// Custom badge text color
  final Color? badgeTextColor;

  /// Whether the tab item is disabled
  final bool disabled;

  /// Accessibility / tooltip label
  final String? tooltip;

  const Ux4gBottomNavItem({
    this.key,
    required this.label,
    required this.icon,
    this.activeIcon,
    this.badge,
    this.badgeColor,
    this.badgeTextColor,
    this.disabled = false,
    this.tooltip,
  });
}

/// Prominent center floating action button configuration
class Ux4gBottomNavCenterAction {
  /// Icon to render inside the center action button (defaults to [Icons.add])
  final dynamic icon;

  /// Callback triggered when center action button is pressed
  final VoidCallback? onPressed;

  /// Button diameter in pixels (default: 48.0)
  final double size;

  /// Background color (defaults to theme primary)
  final Color? backgroundColor;

  /// Icon / foreground color (defaults to white)
  final Color? iconColor;

  /// Elevation / shadow depth (default: 4.0)
  final double elevation;

  /// Tooltip / accessibility label
  final String? tooltip;

  const Ux4gBottomNavCenterAction({
    this.icon,
    this.onPressed,
    this.size = 48.0,
    this.backgroundColor,
    this.iconColor,
    this.elevation = 4.0,
    this.tooltip,
  });
}

// ─── MAIN COMPONENT ──────────────────────────────────────────────────────────

/// **Ux4gBottomNavigationBar**
///
/// Fully accessible, responsive Bottom Navigation Bar built strictly to UX4G Design System guidelines:
/// - **Indicator Variants**: `pill` (soft capsule background), `bar` (top purple indicator bar), `plain` (clean icon/text tint)
/// - **Shape & Layout Variants**: `labelled`, `topRounded`, `iconOnly`, `centreAction`, `floatingPill`
/// - **Badge Support**: Numeric badges, text badges ("99+"), and notification dot indicators
/// - **Prominent Center Action Button**: High-visibility circular action button (FAB) for primary actions
/// - **Full Dark & Light Mode Support** with high-contrast active states
class Ux4gBottomNavigationBar extends StatefulWidget {
  /// Array of navigation tab items (typically 3 to 5 items)
  final List<Ux4gBottomNavItem> items;

  /// Controlled active tab index
  final int? selectedIndex;

  /// Default active tab index for uncontrolled usage (default: 0)
  final int defaultSelectedIndex;

  /// Callback triggered when a tab is selected
  final void Function(int index, Ux4gBottomNavItem item)? onTabChange;

  /// Active tab indicator style: [Ux4gBottomNavIndicatorVariant.pill], [Ux4gBottomNavIndicatorVariant.bar], [Ux4gBottomNavIndicatorVariant.plain] (default: `pill`)
  final Ux4gBottomNavIndicatorVariant indicatorVariant;

  /// Preset layout / shape variant
  final Ux4gBottomNavVariant variant;

  /// Container shape: [Ux4gBottomNavShape.rectangular], [Ux4gBottomNavShape.topRounded], [Ux4gBottomNavShape.floatingPill]
  final Ux4gBottomNavShape? shape;

  /// Whether to show text labels below icons (default true, automatically false for `iconOnly`)
  final bool? showLabels;

  /// Configuration for prominent center action button (used in `centreAction` variant)
  final Ux4gBottomNavCenterAction? centerAction;

  /// Color for active icon and label text (defaults to theme primary)
  final Color? activeColor;

  /// Color for inactive icon and label text (defaults to theme muted / neutral)
  final Color? inactiveColor;

  /// Background color for the pill indicator in `pill` mode (defaults to primary50 / primary400 with alpha)
  final Color? pillBackgroundColor;

  /// Color for the top bar indicator in `bar` mode (defaults to primary)
  final Color? barIndicatorColor;

  /// Height of the top bar indicator (default: 3.0)
  final double barIndicatorHeight;

  /// Width of the top bar indicator (default: 32.0)
  final double barIndicatorWidth;

  /// Background color of the navigation bar (defaults to surface)
  final Color? backgroundColor;

  /// Border color of the navigation bar container
  final Color? borderColor;

  /// Shadow / elevation level (default: 4.0)
  final double elevation;

  /// Whether to wrap within SafeArea (default: true)
  final bool useSafeArea;

  /// Height of the inner content area (default: 58 for labelled, 50 for iconOnly)
  final double? height;

  /// Top padding of navigation bar (default: 8 for rectangular, 4 for floating)
  final double? paddingTop;

  /// Bottom padding of navigation bar (default: 12 for rectangular, 4 for floating)
  final double? paddingBottom;

  /// Horizontal padding inside navigation bar
  final double? paddingHorizontal;

  /// Custom text style for inactive tab labels
  final TextStyle? labelStyle;

  /// Custom text style for active tab label
  final TextStyle? activeLabelStyle;

  /// Accessibility label for the bottom navigation bar
  final String? semanticLabel;

  const Ux4gBottomNavigationBar({
    super.key,
    required this.items,
    this.selectedIndex,
    this.defaultSelectedIndex = 0,
    this.onTabChange,
    this.indicatorVariant = Ux4gBottomNavIndicatorVariant.pill,
    this.variant = Ux4gBottomNavVariant.labelled,
    this.shape,
    this.showLabels,
    this.centerAction,
    this.activeColor,
    this.inactiveColor,
    this.pillBackgroundColor,
    this.barIndicatorColor,
    this.barIndicatorHeight = 3.0,
    this.barIndicatorWidth = 32.0,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 4.0,
    this.useSafeArea = true,
    this.height,
    this.paddingTop,
    this.paddingBottom,
    this.paddingHorizontal,
    this.labelStyle,
    this.activeLabelStyle,
    this.semanticLabel,
  });

  @override
  State<Ux4gBottomNavigationBar> createState() =>
      _Ux4gBottomNavigationBarState();
}

class _Ux4gBottomNavigationBarState extends State<Ux4gBottomNavigationBar> {
  late int _internalIndex;

  @override
  void initState() {
    super.initState();
    _internalIndex = widget.defaultSelectedIndex;
  }

  int get _currentIndex => widget.selectedIndex ?? _internalIndex;

  void _handleTabPress(int index, Ux4gBottomNavItem item) {
    if (item.disabled) return;
    if (widget.selectedIndex == null) {
      setState(() {
        _internalIndex = index;
      });
    }
    widget.onTabChange?.call(index, item);
  }

  Ux4gBottomNavShape get _resolvedShape {
    if (widget.shape != null) return widget.shape!;
    switch (widget.variant) {
      case Ux4gBottomNavVariant.topRounded:
        return Ux4gBottomNavShape.topRounded;
      case Ux4gBottomNavVariant.floatingPill:
        return Ux4gBottomNavShape.floatingPill;
      default:
        return Ux4gBottomNavShape.rectangular;
    }
  }

  bool get _isIconOnly =>
      widget.variant == Ux4gBottomNavVariant.iconOnly ||
      widget.showLabels == false;

  bool get _hasCenterAction =>
      widget.variant == Ux4gBottomNavVariant.centreAction;

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();
    final isDark = materialTheme.brightness == Brightness.dark;

    // Resolved colors with Dark / Light Mode fallbacks
    final resolvedActiveColor =
        widget.activeColor ??
        (isDark
            ? Ux4gColors.primary300
            : (ux4gColors?.primary ?? Ux4gColors.primary500));
    final resolvedInactiveColor =
        widget.inactiveColor ??
        (isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600);
    final resolvedPillBg =
        widget.pillBackgroundColor ??
        (isDark
            ? Ux4gColors.primary400.withValues(alpha: 0.18)
            : Ux4gColors.primary50);
    final resolvedBarColor = widget.barIndicatorColor ?? resolvedActiveColor;
    final resolvedBgColor =
        widget.backgroundColor ??
        (isDark
            ? Ux4gColors.neutral900
            : (ux4gColors?.surface ?? Ux4gColors.white));
    final resolvedBorderColor =
        widget.borderColor ??
        (isDark ? Ux4gColors.neutral700 : Ux4gColors.neutral200);

    final isFloating = _resolvedShape == Ux4gBottomNavShape.floatingPill;
    final isTopRounded = _resolvedShape == Ux4gBottomNavShape.topRounded;

    final resolvedPadTop = widget.paddingTop ?? (isFloating ? 4.0 : 8.0);
    final resolvedPadBottom = widget.paddingBottom ?? (isFloating ? 4.0 : 12.0);
    final resolvedContentHeight = widget.height ?? (_isIconOnly ? 50.0 : 58.0);

    // Box Decoration for container
    BoxDecoration containerDecoration;
    if (isFloating) {
      containerDecoration = BoxDecoration(
        color: resolvedBgColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: resolvedBorderColor, width: 1),
        boxShadow: widget.elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      );
    } else if (isTopRounded) {
      containerDecoration = BoxDecoration(
        color: resolvedBgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(
          top: BorderSide(color: resolvedBorderColor, width: 1),
          left: BorderSide(color: resolvedBorderColor, width: 1),
          right: BorderSide(color: resolvedBorderColor, width: 1),
        ),
        boxShadow: widget.elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ]
            : null,
      );
    } else {
      containerDecoration = BoxDecoration(
        color: resolvedBgColor,
        border: Border(top: BorderSide(color: resolvedBorderColor, width: 1)),
        boxShadow: widget.elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ]
            : null,
      );
    }

    Widget content = Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: resolvedPadTop,
        bottom: resolvedPadBottom,
        left: widget.paddingHorizontal ?? (isFloating ? 8.0 : 4.0),
        right: widget.paddingHorizontal ?? (isFloating ? 8.0 : 4.0),
      ),
      decoration: containerDecoration,
      child: SizedBox(
        height: resolvedContentHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildAllItems(
            resolvedActiveColor: resolvedActiveColor,
            resolvedInactiveColor: resolvedInactiveColor,
            resolvedPillBg: resolvedPillBg,
            resolvedBarColor: resolvedBarColor,
            padTop: resolvedPadTop,
            typography: ux4gTypography,
          ),
        ),
      ),
    );

    if (isFloating) {
      content = Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 1.0,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: content,
          ),
        ),
      );
    }

    final result = widget.useSafeArea
        ? Container(
            color: isFloating ? Colors.transparent : resolvedBgColor,
            child: SafeArea(top: false, child: content),
          )
        : content;

    return Semantics(
      container: true,
      label: widget.semanticLabel ?? 'Bottom navigation bar',
      child: result,
    );
  }

  List<Widget> _buildAllItems({
    required Color resolvedActiveColor,
    required Color resolvedInactiveColor,
    required Color resolvedPillBg,
    required Color resolvedBarColor,
    required double padTop,
    required Ux4gTypography? typography,
  }) {
    if (!_hasCenterAction) {
      return widget.items.asMap().entries.map((e) {
        return _buildTabItem(
          item: e.value,
          index: e.key,
          resolvedActiveColor: resolvedActiveColor,
          resolvedInactiveColor: resolvedInactiveColor,
          resolvedPillBg: resolvedPillBg,
          resolvedBarColor: resolvedBarColor,
          padTop: padTop,
          typography: typography,
        );
      }).toList();
    }

    final mid = widget.items.length ~/ 2;
    final left = widget.items.sublist(0, mid);
    final right = widget.items.sublist(mid);

    final list = <Widget>[];

    for (int i = 0; i < left.length; i++) {
      list.add(
        _buildTabItem(
          item: left[i],
          index: i,
          resolvedActiveColor: resolvedActiveColor,
          resolvedInactiveColor: resolvedInactiveColor,
          resolvedPillBg: resolvedPillBg,
          resolvedBarColor: resolvedBarColor,
          padTop: padTop,
          typography: typography,
        ),
      );
    }

    list.add(_buildCenterActionButton(resolvedActiveColor));

    for (int i = 0; i < right.length; i++) {
      final actualIndex = mid + i;
      list.add(
        _buildTabItem(
          item: right[i],
          index: actualIndex,
          resolvedActiveColor: resolvedActiveColor,
          resolvedInactiveColor: resolvedInactiveColor,
          resolvedPillBg: resolvedPillBg,
          resolvedBarColor: resolvedBarColor,
          padTop: padTop,
          typography: typography,
        ),
      );
    }

    return list;
  }

  Widget _buildTabItem({
    required Ux4gBottomNavItem item,
    required int index,
    required Color resolvedActiveColor,
    required Color resolvedInactiveColor,
    required Color resolvedPillBg,
    required Color resolvedBarColor,
    required double padTop,
    required Ux4gTypography? typography,
  }) {
    final isActive = _currentIndex == index;
    final fgColor = isActive ? resolvedActiveColor : resolvedInactiveColor;
    final isFloating = _resolvedShape == Ux4gBottomNavShape.floatingPill;
    final isPill =
        widget.indicatorVariant == Ux4gBottomNavIndicatorVariant.pill &&
        isActive;
    final isBar =
        widget.indicatorVariant == Ux4gBottomNavIndicatorVariant.bar &&
        isActive;

    final iconWidget = _renderIcon(item, isActive, fgColor);

    // Icon + Badge Box (24x24 matching React Native iconContainer)
    final iconWithBadge = SizedBox(
      width: 24,
      height: 24,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Center(child: iconWidget),
          if (item.badge != null) _renderBadge(item),
        ],
      ),
    );

    final tabContent = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: isPill ? resolvedPillBg : resolvedPillBg.withValues(alpha: 0),
        borderRadius: BorderRadius.circular(isFloating ? 999 : 8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconWithBadge,
          if (!_isIconOnly) ...[
            const SizedBox(height: 3),
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:
                  (isActive
                          ? (widget.activeLabelStyle ??
                                typography?.lS_strong ??
                                const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ))
                          : (widget.labelStyle ??
                                typography?.lS_default ??
                                const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                )))
                      .copyWith(color: fgColor),
            ),
          ],
        ],
      ),
    );

    Widget itemWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: item.disabled ? null : () => _handleTabPress(index, item),
          borderRadius: BorderRadius.circular(isFloating ? 999 : 8),
          canRequestFocus: false,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              tabContent,
            // Top bar indicator
            if (isBar)
              Positioned(
                top: -padTop + 1.0,
                child: Container(
                  width: isFloating
                      ? math.min(widget.barIndicatorWidth, 28.0)
                      : widget.barIndicatorWidth,
                  height: widget.barIndicatorHeight,
                  decoration: BoxDecoration(
                    color: resolvedBarColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(2),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );

    if (item.disabled) {
      itemWidget = Opacity(opacity: 0.4, child: itemWidget);
    }

    if (item.tooltip != null) {
      itemWidget = Tooltip(message: item.tooltip!, child: itemWidget);
    }

    itemWidget = Semantics(
      button: true,
      selected: isActive,
      enabled: !item.disabled,
      label: item.tooltip ?? item.label,
      child: itemWidget,
    );

    return Expanded(child: itemWidget);
  }

  Widget _renderIcon(Ux4gBottomNavItem item, bool isActive, Color color) {
    final activeIcon = isActive && item.activeIcon != null
        ? item.activeIcon
        : item.icon;

    if (activeIcon is Function) {
      return (activeIcon as dynamic)(isActive, color) as Widget;
    }
    if (activeIcon is IconData) {
      return Icon(activeIcon, size: 24, color: color);
    }
    if (activeIcon is Widget) {
      return activeIcon;
    }
    return Icon(Icons.circle, size: 20, color: color);
  }

  Widget _renderBadge(Ux4gBottomNavItem item) {
    final badge = item.badge;
    final badgeBg = item.badgeColor ?? Ux4gColors.red600;
    final badgeFg = item.badgeTextColor ?? Ux4gColors.white;

    if (badge is bool && badge == true) {
      return Positioned(
        top: -2,
        right: -2,
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: badgeBg, shape: BoxShape.circle),
        ),
      );
    }

    final text = badge.toString();
    return Positioned(
      top: -4,
      right: -10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
        decoration: BoxDecoration(
          color: badgeBg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: badgeFg,
              fontSize: 9,
              fontWeight: FontWeight.w700,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCenterActionButton(Color resolvedActiveColor) {
    final action = widget.centerAction ?? const Ux4gBottomNavCenterAction();
    final size = action.size;
    final bg = action.backgroundColor ?? resolvedActiveColor;
    final fg = action.iconColor ?? Ux4gColors.white;

    Widget iconContent;
    if (action.icon is Widget) {
      iconContent = action.icon as Widget;
    } else if (action.icon is IconData) {
      iconContent = Icon(action.icon as IconData, size: 24, color: fg);
    } else {
      iconContent = Icon(Icons.add, size: 26, color: fg);
    }

    Widget btn = Material(
      color: bg,
      shape: const CircleBorder(),
      elevation: action.elevation,
      shadowColor: resolvedActiveColor.withValues(alpha: 0.35),
      child: InkWell(
        onTap: action.onPressed,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: iconContent),
        ),
      ),
    );

    if (action.tooltip != null) {
      btn = Tooltip(message: action.tooltip!, child: btn);
    }

    btn = Semantics(
      button: true,
      label: action.tooltip ?? 'Center action',
      child: btn,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Center(child: btn),
    );
  }
}

// ─── CONVENIENCE PRESET CLASSES ──────────────────────────────────────────────

/// Bottom Navigation Bar with Soft Pill indicator around active tab
class Ux4gPillBottomNavBar extends StatelessWidget {
  final List<Ux4gBottomNavItem> items;
  final int? selectedIndex;
  final int defaultSelectedIndex;
  final void Function(int index, Ux4gBottomNavItem item)? onTabChange;
  final Ux4gBottomNavVariant variant;
  final Ux4gBottomNavShape? shape;
  final bool? showLabels;
  final Ux4gBottomNavCenterAction? centerAction;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? pillBackgroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double elevation;
  final bool useSafeArea;
  final double? height;

  const Ux4gPillBottomNavBar({
    super.key,
    required this.items,
    this.selectedIndex,
    this.defaultSelectedIndex = 0,
    this.onTabChange,
    this.variant = Ux4gBottomNavVariant.labelled,
    this.shape,
    this.showLabels,
    this.centerAction,
    this.activeColor,
    this.inactiveColor,
    this.pillBackgroundColor,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 4.0,
    this.useSafeArea = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Ux4gBottomNavigationBar(
      items: items,
      selectedIndex: selectedIndex,
      defaultSelectedIndex: defaultSelectedIndex,
      onTabChange: onTabChange,
      indicatorVariant: Ux4gBottomNavIndicatorVariant.pill,
      variant: variant,
      shape: shape,
      showLabels: showLabels,
      centerAction: centerAction,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      pillBackgroundColor: pillBackgroundColor,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      useSafeArea: useSafeArea,
      height: height,
    );
  }
}

/// Bottom Navigation Bar with Top Purple Bar indicator above active tab
class Ux4gBarBottomNavBar extends StatelessWidget {
  final List<Ux4gBottomNavItem> items;
  final int? selectedIndex;
  final int defaultSelectedIndex;
  final void Function(int index, Ux4gBottomNavItem item)? onTabChange;
  final Ux4gBottomNavVariant variant;
  final Ux4gBottomNavShape? shape;
  final bool? showLabels;
  final Ux4gBottomNavCenterAction? centerAction;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? barIndicatorColor;
  final double barIndicatorHeight;
  final double barIndicatorWidth;
  final Color? backgroundColor;
  final Color? borderColor;
  final double elevation;
  final bool useSafeArea;
  final double? height;

  const Ux4gBarBottomNavBar({
    super.key,
    required this.items,
    this.selectedIndex,
    this.defaultSelectedIndex = 0,
    this.onTabChange,
    this.variant = Ux4gBottomNavVariant.labelled,
    this.shape,
    this.showLabels,
    this.centerAction,
    this.activeColor,
    this.inactiveColor,
    this.barIndicatorColor,
    this.barIndicatorHeight = 3.0,
    this.barIndicatorWidth = 32.0,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 4.0,
    this.useSafeArea = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Ux4gBottomNavigationBar(
      items: items,
      selectedIndex: selectedIndex,
      defaultSelectedIndex: defaultSelectedIndex,
      onTabChange: onTabChange,
      indicatorVariant: Ux4gBottomNavIndicatorVariant.bar,
      variant: variant,
      shape: shape,
      showLabels: showLabels,
      centerAction: centerAction,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      barIndicatorColor: barIndicatorColor,
      barIndicatorHeight: barIndicatorHeight,
      barIndicatorWidth: barIndicatorWidth,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      useSafeArea: useSafeArea,
      height: height,
    );
  }
}

/// Bottom Navigation Bar with Plain clean active highlight (no pill, no bar)
class Ux4gPlainBottomNavBar extends StatelessWidget {
  final List<Ux4gBottomNavItem> items;
  final int? selectedIndex;
  final int defaultSelectedIndex;
  final void Function(int index, Ux4gBottomNavItem item)? onTabChange;
  final Ux4gBottomNavVariant variant;
  final Ux4gBottomNavShape? shape;
  final bool? showLabels;
  final Ux4gBottomNavCenterAction? centerAction;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double elevation;
  final bool useSafeArea;
  final double? height;

  const Ux4gPlainBottomNavBar({
    super.key,
    required this.items,
    this.selectedIndex,
    this.defaultSelectedIndex = 0,
    this.onTabChange,
    this.variant = Ux4gBottomNavVariant.labelled,
    this.shape,
    this.showLabels,
    this.centerAction,
    this.activeColor,
    this.inactiveColor,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 4.0,
    this.useSafeArea = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Ux4gBottomNavigationBar(
      items: items,
      selectedIndex: selectedIndex,
      defaultSelectedIndex: defaultSelectedIndex,
      onTabChange: onTabChange,
      indicatorVariant: Ux4gBottomNavIndicatorVariant.plain,
      variant: variant,
      shape: shape,
      showLabels: showLabels,
      centerAction: centerAction,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      useSafeArea: useSafeArea,
      height: height,
    );
  }
}

/// Floating Capsule Bottom Navigation Bar detached from screen borders
class Ux4gFloatingBottomNavBar extends StatelessWidget {
  final List<Ux4gBottomNavItem> items;
  final int? selectedIndex;
  final int defaultSelectedIndex;
  final void Function(int index, Ux4gBottomNavItem item)? onTabChange;
  final Ux4gBottomNavIndicatorVariant indicatorVariant;
  final bool? showLabels;
  final Ux4gBottomNavCenterAction? centerAction;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? pillBackgroundColor;
  final Color? barIndicatorColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double elevation;
  final bool useSafeArea;
  final double? height;

  const Ux4gFloatingBottomNavBar({
    super.key,
    required this.items,
    this.selectedIndex,
    this.defaultSelectedIndex = 0,
    this.onTabChange,
    this.indicatorVariant = Ux4gBottomNavIndicatorVariant.pill,
    this.showLabels,
    this.centerAction,
    this.activeColor,
    this.inactiveColor,
    this.pillBackgroundColor,
    this.barIndicatorColor,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 4.0,
    this.useSafeArea = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Ux4gBottomNavigationBar(
      items: items,
      selectedIndex: selectedIndex,
      defaultSelectedIndex: defaultSelectedIndex,
      onTabChange: onTabChange,
      indicatorVariant: indicatorVariant,
      variant: Ux4gBottomNavVariant.floatingPill,
      shape: Ux4gBottomNavShape.floatingPill,
      showLabels: showLabels,
      centerAction: centerAction,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      pillBackgroundColor: pillBackgroundColor,
      barIndicatorColor: barIndicatorColor,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      useSafeArea: useSafeArea,
      height: height,
    );
  }
}

/// Bottom Navigation Bar with Prominent Center Action '+' button
class Ux4gCenterActionBottomNavBar extends StatelessWidget {
  final List<Ux4gBottomNavItem> items;
  final int? selectedIndex;
  final int defaultSelectedIndex;
  final void Function(int index, Ux4gBottomNavItem item)? onTabChange;
  final Ux4gBottomNavIndicatorVariant indicatorVariant;
  final Ux4gBottomNavShape? shape;
  final bool? showLabels;
  final Ux4gBottomNavCenterAction? centerAction;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? pillBackgroundColor;
  final Color? barIndicatorColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double elevation;
  final bool useSafeArea;
  final double? height;

  const Ux4gCenterActionBottomNavBar({
    super.key,
    required this.items,
    this.selectedIndex,
    this.defaultSelectedIndex = 0,
    this.onTabChange,
    this.indicatorVariant = Ux4gBottomNavIndicatorVariant.pill,
    this.shape,
    this.showLabels,
    this.centerAction,
    this.activeColor,
    this.inactiveColor,
    this.pillBackgroundColor,
    this.barIndicatorColor,
    this.backgroundColor,
    this.borderColor,
    this.elevation = 4.0,
    this.useSafeArea = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Ux4gBottomNavigationBar(
      items: items,
      selectedIndex: selectedIndex,
      defaultSelectedIndex: defaultSelectedIndex,
      onTabChange: onTabChange,
      indicatorVariant: indicatorVariant,
      variant: Ux4gBottomNavVariant.centreAction,
      shape: shape,
      showLabels: showLabels,
      centerAction: centerAction ?? const Ux4gBottomNavCenterAction(),
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      pillBackgroundColor: pillBackgroundColor,
      barIndicatorColor: barIndicatorColor,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      elevation: elevation,
      useSafeArea: useSafeArea,
      height: height,
    );
  }
}
