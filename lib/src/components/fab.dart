import 'package:flutter/material.dart';
import '../foundation/colors.dart';
import '../foundation/typography.dart';
import '../theme/theme.dart';

/// Layout variant for [Ux4gFab].
enum Ux4gFabVariant {
  /// Standard circular floating action button with icon only.
  icon,

  /// Extended pill-shaped floating action button with label (and optional icon).
  labelled,

  /// Speed-dial menu where action items are joined inside a single vertical capsule.
  menuJoined,

  /// Speed-dial menu where action items are individual spaced circular buttons.
  menuSpaced,

  /// Speed-dial menu where action items are individual pill buttons with icons and labels.
  menuLabelled,
}

/// Color theme preset for [Ux4gFab].
enum Ux4gFabColorTheme {
  /// Filled brand primary background (purple) with white content.
  brand,

  /// Elevated white surface background with primary or dark content and subtle border.
  surface,
}

/// Screen position presets for [Ux4gFab].
enum Ux4gFabPosition {
  /// Flow inline without absolute positioning.
  none,

  /// Positioned at the bottom right corner of the parent/screen.
  bottomRight,

  /// Positioned at the bottom left corner of the parent/screen.
  bottomLeft,

  /// Positioned at the bottom center of the parent/screen.
  bottomCenter,

  /// Positioned at the top right corner of the parent/screen.
  topRight,

  /// Positioned at the top left corner of the parent/screen.
  topLeft,
}

/// Sizing presets for [Ux4gFab].
enum Ux4gFabSize {
  /// Small FAB: 44x44 circular button.
  small,

  /// Medium FAB: 56x56 circular button (standard).
  medium,

  /// Large FAB: 64x64 circular button.
  large,
}

/// Model representing an individual action item in a speed-dial menu.
class Ux4gFabActionItem {
  /// Unique identifier for the action item.
  final String id;

  /// Text label displayed in [Ux4gFabVariant.menuLabelled] or tooltip.
  final String? label;

  /// Icon to display: can be an [IconData] or a custom [Widget] or `null` for label-only.
  final dynamic icon;

  /// Callback fired when this action item is tapped.
  final VoidCallback? onPressed;

  /// Custom background color override for this action item.
  final Color? backgroundColor;

  /// Custom content (icon/text) color override.
  final Color? contentColor;

  /// Whether this action item is disabled.
  final bool disabled;

  /// Accessibility / tooltip label.
  final String? tooltip;

  const Ux4gFabActionItem({
    required this.id,
    this.label,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.contentColor,
    this.disabled = false,
    this.tooltip,
  });
}

/// UX4G Floating Action Button (FAB) and Speed-Dial component.
///
/// Supports standard circular icon FAB, extended labelled pill FAB (with or without icon),
/// and three distinct speed-dial menu variants: joined capsule, spaced circles, and labelled pills.
class Ux4gFab extends StatefulWidget {
  /// Layout variant. Defaults to [Ux4gFabVariant.icon].
  final Ux4gFabVariant variant;

  /// Color theme preset. Defaults to [Ux4gFabColorTheme.brand].
  final Ux4gFabColorTheme colorTheme;

  /// Text label for [Ux4gFabVariant.labelled] extended FAB.
  final String label;

  /// Whether to display an icon in the button. Defaults to `true`.
  /// Set to `false` for label-only pill FAB without an icon.
  final bool showIcon;

  /// Main icon displayed when idle / closed. Defaults to [Icons.add] when [showIcon] is `true`.
  final dynamic icon;

  /// Active icon displayed when speed-dial menu is expanded. Defaults to [Icons.close].
  final dynamic activeIcon;

  /// List of action items for speed-dial menus.
  final List<Ux4gFabActionItem>? actions;

  /// Controlled open state for speed-dial menu.
  final bool? isOpen;

  /// Initial open state when uncontrolled. Defaults to `false`.
  final bool defaultOpen;

  /// Callback fired when the speed-dial menu is toggled.
  final ValueChanged<bool>? onToggle;

  /// Callback fired when the main FAB button is pressed.
  final VoidCallback? onPressed;

  /// Screen position preset when used in a [Stack]. Defaults to [Ux4gFabPosition.none].
  final Ux4gFabPosition position;

  /// Alignment of speed-dial menu items relative to the FAB button.
  /// If `null`, automatically aligns to [CrossAxisAlignment.end] (right-aligned) for
  /// [Ux4gFabVariant.menuLabelled] and right-positioned FABs, or [CrossAxisAlignment.center].
  final CrossAxisAlignment? alignment;

  /// Custom offset overrides when [position] is set.
  final EdgeInsets? offset;

  /// Whether to show a semi-transparent backdrop scrim when menu is open.
  final bool showBackdrop;

  /// Callback fired when the backdrop scrim is tapped.
  final VoidCallback? onBackdropPressed;

  /// Whether the FAB is disabled.
  final bool disabled;

  /// Sizing preset. Defaults to [Ux4gFabSize.medium].
  final Ux4gFabSize size;

  /// Custom background color override for the main trigger button.
  final Color? backgroundColor;

  /// Custom content (icon/text) color override for the main trigger button.
  final Color? contentColor;

  /// Custom elevation shadow level.
  final double? elevation;

  /// Whether to animate menu open/close transitions. Defaults to `true`.
  final bool animated;

  /// Custom text style for labels.
  final TextStyle? labelStyle;

  /// Tooltip / accessibility label.
  final String? tooltip;

  /// Semantic label for screen readers.
  final String? semanticLabel;

  const Ux4gFab({
    super.key,
    this.variant = Ux4gFabVariant.icon,
    this.colorTheme = Ux4gFabColorTheme.brand,
    this.label = 'Button',
    this.showIcon = true,
    this.icon,
    this.activeIcon,
    this.actions,
    this.isOpen,
    this.defaultOpen = false,
    this.onToggle,
    this.onPressed,
    this.position = Ux4gFabPosition.none,
    this.alignment,
    this.offset,
    this.showBackdrop = false,
    this.onBackdropPressed,
    this.disabled = false,
    this.size = Ux4gFabSize.medium,
    this.backgroundColor,
    this.contentColor,
    this.elevation,
    this.animated = true,
    this.labelStyle,
    this.tooltip,
    this.semanticLabel,
  });

  /// Default action items matching the UX4G design specifications.
  static const List<Ux4gFabActionItem> defaultActions = [
    Ux4gFabActionItem(id: 'add', label: 'Add', icon: Icons.add),
    Ux4gFabActionItem(
      id: 'message',
      label: 'Message',
      icon: Icons.chat_bubble_outline_rounded,
    ),
    Ux4gFabActionItem(id: 'share', label: 'Share', icon: Icons.share_outlined),
    Ux4gFabActionItem(id: 'call', label: 'Call', icon: Icons.phone_outlined),
  ];

  @override
  State<Ux4gFab> createState() => _Ux4gFabState();
}

class _Ux4gFabState extends State<Ux4gFab>
    with SingleTickerProviderStateMixin {
  late bool _internalOpen;
  late AnimationController _animController;
  late Animation<double> _expandAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool get _isControlled => widget.isOpen != null;
  bool get _isMenuOpen => _isControlled ? widget.isOpen! : _internalOpen;

  bool get _isMenuVariant =>
      widget.variant == Ux4gFabVariant.menuJoined ||
      widget.variant == Ux4gFabVariant.menuSpaced ||
      widget.variant == Ux4gFabVariant.menuLabelled;

  CrossAxisAlignment get _effectiveAlignment {
    if (widget.alignment != null) return widget.alignment!;
    switch (widget.position) {
      case Ux4gFabPosition.bottomLeft:
      case Ux4gFabPosition.topLeft:
        return CrossAxisAlignment.start;
      case Ux4gFabPosition.bottomCenter:
        return CrossAxisAlignment.center;
      case Ux4gFabPosition.bottomRight:
      case Ux4gFabPosition.topRight:
        return CrossAxisAlignment.end;
      case Ux4gFabPosition.none:
        return widget.variant == Ux4gFabVariant.menuLabelled
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.center;
    }
  }

  @override
  void initState() {
    super.initState();
    _internalOpen = widget.defaultOpen;

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
      value: _isMenuOpen ? 1.0 : 0.0,
    );

    _expandAnimation = CurvedAnimation(
      parent: _animController,
      curve: const Cubic(0.2, 0.0, 0.0, 1.0),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_expandAnimation);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(_expandAnimation);
  }

  @override
  void didUpdateWidget(Ux4gFab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isControlled && widget.isOpen != oldWidget.isOpen) {
      if (widget.animated) {
        if (widget.isOpen!) {
          _animController.forward();
        } else {
          _animController.reverse();
        }
      } else {
        _animController.value = widget.isOpen! ? 1.0 : 0.0;
      }
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    if (widget.disabled) return;
    final nextState = !_isMenuOpen;
    if (!_isControlled) {
      setState(() {
        _internalOpen = nextState;
      });
      if (widget.animated) {
        if (nextState) {
          _animController.forward();
        } else {
          _animController.reverse();
        }
      } else {
        _animController.value = nextState ? 1.0 : 0.0;
      }
    }
    widget.onToggle?.call(nextState);
  }

  void _handleMainPress() {
    if (widget.disabled) return;
    if (_isMenuVariant) {
      _toggleMenu();
    }
    widget.onPressed?.call();
  }

  void _handleBackdropPress() {
    if (widget.onBackdropPressed != null) {
      widget.onBackdropPressed!.call();
    } else {
      if (!_isControlled) {
        setState(() {
          _internalOpen = false;
        });
        if (widget.animated) {
          _animController.reverse();
        } else {
          _animController.value = 0.0;
        }
      }
      widget.onToggle?.call(false);
    }
  }

  double get _mainButtonDiameter {
    switch (widget.size) {
      case Ux4gFabSize.small:
        return 44.0;
      case Ux4gFabSize.medium:
        return 56.0;
      case Ux4gFabSize.large:
        return 64.0;
    }
  }

  double get _mainIconSize {
    switch (widget.size) {
      case Ux4gFabSize.small:
        return 20.0;
      case Ux4gFabSize.medium:
        return 24.0;
      case Ux4gFabSize.large:
        return 28.0;
    }
  }

  double get _mainFontSize {
    switch (widget.size) {
      case Ux4gFabSize.small:
        return 13.0;
      case Ux4gFabSize.medium:
        return 15.0;
      case Ux4gFabSize.large:
        return 16.0;
    }
  }

  Widget _buildIcon(dynamic iconDataOrWidget, Color color, double size) {
    if (iconDataOrWidget == null) {
      return Icon(Icons.add, color: color, size: size);
    }
    if (iconDataOrWidget is IconData) {
      return Icon(iconDataOrWidget, color: color, size: size);
    }
    if (iconDataOrWidget is Widget) {
      return IconTheme(
        data: IconThemeData(color: color, size: size),
        child: iconDataOrWidget,
      );
    }
    return Icon(Icons.add, color: color, size: size);
  }

  Widget _buildJoinedMenu(
    BuildContext context,
    Ux4gThemeColors colors,
    Ux4gTypography typography,
    List<Ux4gFabActionItem> actions,
  ) {
    final surfaceBg = colors.surface;
    const borderColor = Color(0xFFE2E8F0);

    return Container(
      decoration: BoxDecoration(
        color: surfaceBg,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: borderColor, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 16.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: actions.asMap().entries.map((entry) {
          final action = entry.value;
          final iconColor = action.contentColor ?? const Color(0xFF262626);

          return Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: action.disabled
                  ? null
                  : () {
                      action.onPressed?.call();
                      if (!_isControlled) {
                        setState(() => _internalOpen = false);
                        _animController.reverse();
                      }
                      widget.onToggle?.call(false);
                    },
              child: Opacity(
                opacity: action.disabled ? 0.45 : 1.0,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 2.0),
                  child: _buildIcon(action.icon ?? Icons.circle, iconColor, 20.0),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSpacedMenu(
    BuildContext context,
    Ux4gThemeColors colors,
    Ux4gTypography typography,
    List<Ux4gFabActionItem> actions,
  ) {
    final isBrand = widget.colorTheme == Ux4gFabColorTheme.brand;
    final surfaceBg = colors.surface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: _effectiveAlignment,
      children: actions.asMap().entries.map((entry) {
        final action = entry.value;
        final itemBg = action.backgroundColor ?? surfaceBg;
        final itemFg = action.contentColor ??
            (isBrand ? const Color(0xFF262626) : colors.primary);

        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Material(
            color: itemBg,
            shape: const CircleBorder(
              side: BorderSide(color: Color(0xFFE2E8F0), width: 1.0),
            ),
            elevation: 3.0,
            shadowColor: Colors.black.withValues(alpha: 0.12),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: action.disabled
                  ? null
                  : () {
                      action.onPressed?.call();
                      if (!_isControlled) {
                        setState(() => _internalOpen = false);
                        _animController.reverse();
                      }
                      widget.onToggle?.call(false);
                    },
              child: Opacity(
                opacity: action.disabled ? 0.45 : 1.0,
                child: SizedBox(
                  width: 44.0,
                  height: 44.0,
                  child: Center(
                    child: _buildIcon(action.icon ?? Icons.circle, itemFg, 20.0),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLabelledMenu(
    BuildContext context,
    Ux4gThemeColors colors,
    Ux4gTypography typography,
    List<Ux4gFabActionItem> actions,
  ) {
    final isBrand = widget.colorTheme == Ux4gFabColorTheme.brand;
    final surfaceBg = colors.surface;
    const borderColor = Color(0xFFE2E8F0);

    final itemColor = isBrand ? colors.primary : const Color(0xFF171717);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: _effectiveAlignment,
      children: actions.asMap().entries.map((entry) {
        final action = entry.value;
        final itemBg = action.backgroundColor ?? surfaceBg;
        final fgColor = action.contentColor ?? itemColor;

        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Material(
            color: itemBg,
            borderRadius: BorderRadius.circular(999.0),
            elevation: 2.5,
            shadowColor: Colors.black.withValues(alpha: 0.10),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: action.disabled
                  ? null
                  : () {
                      action.onPressed?.call();
                      if (!_isControlled) {
                        setState(() => _internalOpen = false);
                        _animController.reverse();
                      }
                      widget.onToggle?.call(false);
                    },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999.0),
                  border: Border.all(color: borderColor, width: 1.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 9.0,
                  horizontal: 18.0,
                ),
                child: Opacity(
                  opacity: action.disabled ? 0.45 : 1.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (action.icon != null) ...[
                        _buildIcon(action.icon, fgColor, 18.0),
                        if (action.label != null && action.label!.isNotEmpty)
                          const SizedBox(width: 8.0),
                      ],
                      if (action.label != null && action.label!.isNotEmpty)
                        Text(
                          action.label!,
                          style: typography.bM_default.copyWith(
                            color: fgColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMainButton(
    BuildContext context,
    Ux4gThemeColors colors,
    Ux4gTypography typography,
  ) {
    final isBrand = widget.colorTheme == Ux4gFabColorTheme.brand;
    final isLabelled = widget.variant == Ux4gFabVariant.labelled;

    final defaultBgColor = isBrand ? colors.primary : colors.surface;
    final defaultFgColor = isBrand ? Colors.white : colors.primary;

    final mainBg = widget.backgroundColor ?? defaultBgColor;
    final mainFg = widget.contentColor ?? defaultFgColor;

    final diameter = _mainButtonDiameter;
    final iconSize = _mainIconSize;
    final fontSize = _mainFontSize;

    final shouldShowIcon = widget.showIcon;
    final currentIcon = _isMenuVariant && _isMenuOpen
        ? (widget.activeIcon ?? Icons.close)
        : (widget.icon ?? Icons.add);

    final double btnHeight = isLabelled ? diameter * 0.86 : diameter;
    final double borderRadius = isLabelled ? btnHeight / 2 : diameter / 2;

    Widget buttonContent;
    if (isLabelled) {
      buttonContent = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (shouldShowIcon) ...[
              _buildIcon(currentIcon, mainFg, iconSize),
              if (widget.label.isNotEmpty) const SizedBox(width: 8.0),
            ],
            if (widget.label.isNotEmpty)
              Text(
                widget.label,
                style: widget.labelStyle ??
                    typography.bM_strong.copyWith(
                      color: mainFg,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
              ),
          ],
        ),
      );
    } else {
      buttonContent = SizedBox(
        width: diameter,
        height: diameter,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
            child: KeyedSubtree(
              key: ValueKey<bool>(_isMenuVariant && _isMenuOpen),
              child: _buildIcon(currentIcon, mainFg, iconSize),
            ),
          ),
        ),
      );
    }

    final double elevationVal = widget.elevation ?? (isBrand ? 4.0 : 3.0);
    final Color shadowColor = isBrand
        ? colors.primary.withValues(alpha: 0.35)
        : Colors.black.withValues(alpha: 0.12);

    return Semantics(
      button: true,
      enabled: !widget.disabled,
      label: widget.semanticLabel ??
          widget.tooltip ??
          (widget.label.isNotEmpty ? widget.label : 'Floating action button'),
      child: Opacity(
        opacity: widget.disabled ? 0.45 : 1.0,
        child: Material(
          color: mainBg,
          elevation: elevationVal,
          shadowColor: shadowColor,
          borderRadius: BorderRadius.circular(borderRadius),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.disabled ? null : _handleMainPress,
            child: Container(
              height: btnHeight,
              constraints: isLabelled
                  ? BoxConstraints(minHeight: btnHeight)
                  : BoxConstraints(
                      minWidth: diameter,
                      minHeight: diameter,
                      maxWidth: diameter,
                      maxHeight: diameter,
                    ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: !isBrand
                    ? Border.all(color: const Color(0xFFE2E8F0), width: 1.0)
                    : null,
              ),
              child: buttonContent,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Ux4gTheme.colors(context);
    final typography = Ux4gTheme.typography(context);
    final actionsList = widget.actions ?? Ux4gFab.defaultActions;
    final crossAxis = _effectiveAlignment;

    Alignment scaleAlignment = Alignment.bottomCenter;
    if (crossAxis == CrossAxisAlignment.end) {
      scaleAlignment = Alignment.bottomRight;
    } else if (crossAxis == CrossAxisAlignment.start) {
      scaleAlignment = Alignment.bottomLeft;
    }

    Widget menuWidget = const SizedBox.shrink();
    if (_isMenuVariant) {
      Widget menuContent;
      switch (widget.variant) {
        case Ux4gFabVariant.menuJoined:
          menuContent = _buildJoinedMenu(context, colors, typography, actionsList);
          break;
        case Ux4gFabVariant.menuSpaced:
          menuContent = _buildSpacedMenu(context, colors, typography, actionsList);
          break;
        case Ux4gFabVariant.menuLabelled:
          menuContent = _buildLabelledMenu(context, colors, typography, actionsList);
          break;
        default:
          menuContent = const SizedBox.shrink();
      }

      if (widget.animated) {
        menuWidget = FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _expandAnimation,
              alignment: scaleAlignment,
              child: menuContent,
            ),
          ),
        );
      } else {
        menuWidget = _isMenuOpen ? menuContent : const SizedBox.shrink();
      }
    }

    final column = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxis,
      children: [
        if (_isMenuVariant) ...[
          IgnorePointer(
            ignoring: !_isMenuOpen,
            child: menuWidget,
          ),
          const SizedBox(height: 12.0),
        ],
        _buildMainButton(context, colors, typography),
      ],
    );

    if (widget.position == Ux4gFabPosition.none) {
      return column;
    }

    // When positioned in a stack/overlay
    final defaultMargin = widget.offset ?? const EdgeInsets.all(24.0);

    double? top;
    double? bottom;
    double? left;
    double? right;

    switch (widget.position) {
      case Ux4gFabPosition.bottomRight:
        bottom = defaultMargin.bottom;
        right = defaultMargin.right;
        break;
      case Ux4gFabPosition.bottomLeft:
        bottom = defaultMargin.bottom;
        left = defaultMargin.left;
        break;
      case Ux4gFabPosition.bottomCenter:
        bottom = defaultMargin.bottom;
        break;
      case Ux4gFabPosition.topRight:
        top = defaultMargin.top;
        right = defaultMargin.right;
        break;
      case Ux4gFabPosition.topLeft:
        top = defaultMargin.top;
        left = defaultMargin.left;
        break;
      case Ux4gFabPosition.none:
        break;
    }

    final positionedContent = Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: widget.position == Ux4gFabPosition.bottomCenter
          ? Center(child: column)
          : column,
    );

    if (widget.showBackdrop && _isMenuVariant && _isMenuOpen) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _handleBackdropPress,
              behavior: HitTestBehavior.opaque,
              child: Container(
                color: Colors.black.withValues(alpha: 0.35),
              ),
            ),
          ),
          positionedContent,
        ],
      );
    }

    return positionedContent;
  }
}
