import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../foundation/colors.dart';
import '../foundation/typography.dart';
import 'buttons.dart';
import 'card.dart';
import 'divider.dart';

/// Sheet height presets, matching UX4G specification and Figma `Size` variants:
///
/// | Variant    | Screen Height Ratio | Approx Height (800dp screen) |
/// |------------|---------------------|------------------------------|
/// | `peek`     | 0.26 (26%)          | ~208dp                       |
/// | `half`     | 0.50 (50%)          | ~400dp                       |
/// | `expanded` | 0.75 (75%)          | ~600dp                       |
/// | `full`     | 0.94 (94%)          | ~752dp                       |
enum Ux4gBottomSheetSize {
  peek(0.26),
  half(0.50),
  expanded(0.75),
  full(0.94);

  final double ratio;
  const Ux4gBottomSheetSize(this.ratio);
}

/// Horizontal arrangement of the footer actions.
enum Ux4gBottomSheetFooterAlign {
  split,
  left,
  center,
  right,
  justified,
  centered,
}

/// Backward compatibility alias for footer alignment.
typedef Ux4gBottomSheetFooterAlignment = Ux4gBottomSheetFooterAlign;

/// **Ux4gBottomSheet**
///
/// Fully draggable, developer-friendly, accessible Modal Bottom Sheet built strictly to UX4G Design System guidelines:
/// - Responsive and overflow-proof across all screen sizes (phones, tablets, desktop web, landscape mode)
/// - Full **draggable** gesture support: swipe down to dismiss or drag between snap points (`peek` <-> `half` <-> `expanded` <-> `full`)
/// - **Fixed Bottom Action Buttons**: Buttons remain anchored at the bottom of the screen at all heights and throughout dragging
/// - 16dp top-left and top-right rounded corners (`cornerRadius: 16`)
/// - Top drag handle indicator pill
/// - Header row with icon, title, description, subtle text, and close button
/// - Native UX4G Button components for primary and secondary actions
/// - Smooth spring / cubic transitions and velocity detection
/// - Full Dark Mode & Light Mode support via UX4G Theme
class Ux4gBottomSheet extends StatefulWidget {
  /// Callback when the sheet asks to close (backdrop tap, close button, or swipe-down).
  final VoidCallback onDismiss;

  /// Height preset from the UX4G `Size` variants (`peek`, `half`, `expanded`, `full`). Defaults to `half`.
  final Ux4gBottomSheetSize size;

  /// Explicit sheet height in pixels. Overrides `size` when provided.
  final double? height;

  /* ── Header ── */
  /// Whether to render the header block. Defaults to `true`.
  final bool showHeader;

  /// Header title text.
  final String? title;

  /// Secondary subtitle / description text rendered below the title.
  final String? description;

  /// Subtle tag or muted text rendered next to the title.
  final String? subtleText;

  /// Leading icon / widget rendered before the title (e.g. logo or symbol).
  final dynamic icon;

  /// Whether to show the header close (✕) button. Defaults to `true`.
  final bool showCloseButton;

  /// Custom callback for close button press (defaults to `onDismiss`).
  final VoidCallback? onCloseClick;

  /// Whether to show a divider under the header. Defaults to `false`.
  final bool showHeaderDivider;

  /* ── Content ── */
  /// Sheet body content widget.
  final Widget? content;

  /// Sheet body content widgets (alternative to `content`).
  final List<Widget>? children;

  /// Wrap content in a scrollable view. Defaults to `true`.
  final bool scrollable;

  /// Whether to show a divider between content and footer. Defaults to `false`.
  final bool showBottomDivider;

  /// Backward compatible boolean to toggle both header & footer dividers.
  final bool? showDividers;

  /* ── Footer Actions ── */
  /// Whether to render the footer button bar. Defaults to `true`.
  final bool showFooter;

  /// Whether to show the primary action button. Defaults to `true`.
  final bool showPrimaryButton;

  /// Whether to show the secondary action button. Defaults to `true`.
  final bool showSecondaryButton;

  /// Text for the primary action button. Defaults to `'Confirm'`.
  final String primaryButtonText;

  /// Text for the secondary action button. Defaults to `'Cancel'`.
  final String secondaryButtonText;

  /// Callback fired when primary button is clicked (defaults to `onDismiss`).
  final VoidCallback? onPrimaryPress;

  /// Callback fired when secondary button is clicked (defaults to `onDismiss`).
  final VoidCallback? onSecondaryPress;

  /// Renders the primary action in the destructive error color. Defaults to `false`.
  final bool isDestructive;

  /// Footer button alignment layout. Defaults to `Ux4gBottomSheetFooterAlign.split`.
  final Ux4gBottomSheetFooterAlign footerAlign;

  /// Replaces the standard buttons with custom footer content.
  final Widget? footerContent;

  /// Backward compatibility footer type from Card component.
  final Ux4gCardFooterType? footerType;

  /* ── Draggable & Gesture Behaviour ── */
  /// Whether swipe / drag gestures are enabled on the bottom sheet. Defaults to `true`.
  final bool isDraggable;

  /// Whether dragging up/down expands and collapses between multiple snap points. Defaults to `true`.
  final bool enableDragToExpand;

  /// Allowed snap points for draggable transitions. Defaults to all 4 UX4G sizes: `[peek, half, expanded, full]`.
  final List<Ux4gBottomSheetSize>? snapPoints;

  /// Callback fired when the bottom sheet snaps to a new size during drag.
  final ValueChanged<Ux4gBottomSheetSize>? onSnapChange;

  /// Whether to show the top drag handle pill. Defaults to `true`.
  final bool showDragHandle;

  /// Safe-area bottom inset. Defaults to `0`.
  final double bottomInset;

  /* ── Styling Overrides ── */
  /// Background color for the sheet surface. Defaults to theme surface color.
  final Color? backgroundColor;

  /// Color of the backdrop scrim. Defaults to UX4G neutral950 with 0.5 opacity.
  final Color? scrimColor;

  /// Top-left and top-right corner radius in pixels. Defaults to `16.0`.
  final double cornerRadius;

  /// Custom padding around content.
  final EdgeInsetsGeometry? contentPadding;

  /// Custom title text style override.
  final TextStyle? titleStyle;

  /// Custom description text style override.
  final TextStyle? descriptionStyle;

  /// Accessibility label for the bottom sheet.
  final String? semanticLabel;

  const Ux4gBottomSheet({
    super.key,
    required this.onDismiss,
    Ux4gBottomSheetSize? size,
    this.height,
    this.showHeader = true,
    String? title,
    this.description,
    String? subtleText,
    dynamic icon,
    this.showCloseButton = true,
    this.onCloseClick,
    this.showHeaderDivider = false,
    this.content,
    this.children,
    this.scrollable = true,
    this.showBottomDivider = false,
    this.showDividers,
    this.showFooter = true,
    this.showPrimaryButton = true,
    this.showSecondaryButton = true,
    this.primaryButtonText = 'Confirm',
    this.secondaryButtonText = 'Cancel',
    VoidCallback? onPrimaryPress,
    VoidCallback? onSecondaryPress,
    this.isDestructive = false,
    Ux4gBottomSheetFooterAlign? footerAlign,
    this.footerContent,
    this.footerType,
    bool? isDraggable,
    this.enableDragToExpand = true,
    this.snapPoints,
    this.onSnapChange,
    this.showDragHandle = true,
    this.bottomInset = 0,
    Color? backgroundColor,
    this.scrimColor,
    this.cornerRadius = 16.0,
    this.contentPadding,
    this.titleStyle,
    this.descriptionStyle,
    this.semanticLabel,
    // Aliases for developer convenience & backwards compatibility
    String? headerTitle,
    String? headerSubtleText,
    dynamic headerIcon,
    VoidCallback? onPrimaryClick,
    VoidCallback? onSecondaryClick,
    Color? containerColor,
    bool? draggable,
    Ux4gBottomSheetSize? snapPoint,
    Ux4gBottomSheetFooterAlign? footerAlignment,
  })  : title = title ?? headerTitle,
        subtleText = subtleText ?? headerSubtleText,
        icon = icon ?? headerIcon,
        onPrimaryPress = onPrimaryPress ?? onPrimaryClick,
        onSecondaryPress = onSecondaryPress ?? onSecondaryClick,
        backgroundColor = backgroundColor ?? containerColor,
        isDraggable = draggable ?? isDraggable ?? true,
        size = snapPoint ?? size ?? Ux4gBottomSheetSize.half,
        footerAlign = footerAlignment ?? footerAlign ?? Ux4gBottomSheetFooterAlign.split;

  /// Helper static method to show an interactive UX4G Modal Bottom Sheet.
  static Future<T?> show<T>(
    BuildContext context, {
    Widget? content,
    List<Widget>? children,
    Ux4gBottomSheetSize size = Ux4gBottomSheetSize.half,
    Ux4gBottomSheetSize? snapPoint,
    double? height,
    bool showHeader = true,
    String? title,
    String? description,
    String? subtleText,
    dynamic icon,
    bool showCloseButton = true,
    VoidCallback? onCloseClick,
    bool showHeaderDivider = false,
    bool scrollable = true,
    bool showBottomDivider = false,
    bool? showDividers,
    bool showFooter = true,
    bool showPrimaryButton = true,
    bool showSecondaryButton = true,
    String primaryButtonText = 'Confirm',
    String secondaryButtonText = 'Cancel',
    VoidCallback? onPrimaryPress,
    VoidCallback? onSecondaryPress,
    bool isDestructive = false,
    Ux4gBottomSheetFooterAlign footerAlign = Ux4gBottomSheetFooterAlign.split,
    Widget? footerContent,
    Ux4gCardFooterType? footerType,
    bool isDraggable = true,
    bool enableDragToExpand = true,
    List<Ux4gBottomSheetSize>? snapPoints,
    ValueChanged<Ux4gBottomSheetSize>? onSnapChange,
    bool showDragHandle = true,
    bool showBackdrop = true,
    bool isDismissible = true,
    bool dismissOnBackdropPress = true,
    Color? backgroundColor,
    Color? scrimColor,
    double cornerRadius = 16.0,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    // Aliases
    String? headerTitle,
    String? subtitle,
    String? headerSubtleText,
    dynamic headerIcon,
    VoidCallback? onPrimaryClick,
    VoidCallback? onSecondaryClick,
    Color? containerColor,
    bool? draggable,
    Ux4gBottomSheetFooterAlign? footerAlignment,
  }) {
    final effectiveTitle = title ?? headerTitle;
    final effectiveSubtle = subtleText ?? subtitle ?? headerSubtleText;
    final effectiveIcon = icon ?? headerIcon;
    final effectivePrimaryClick = onPrimaryPress ?? onPrimaryClick;
    final effectiveSecondaryClick = onSecondaryPress ?? onSecondaryClick;
    final effectiveBg = backgroundColor ?? containerColor;
    final effectiveDraggable = draggable ?? isDraggable;
    final effectiveSize = snapPoint ?? size;
    final effectiveFooterAlign = footerAlignment ?? footerAlign;

    final resolvedScrim = showBackdrop
        ? (scrimColor ?? const Color(0xFF0F172A).withValues(alpha: 0.5))
        : Colors.transparent;

    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible && dismissOnBackdropPress,
      isScrollControlled: true,
      enableDrag: false, // Managed internally for multi-snap spring physics
      barrierColor: resolvedScrim,
      backgroundColor: Colors.transparent,
      builder: (modalContext) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Ux4gBottomSheet(
              onDismiss: () {
                if (Navigator.of(modalContext).canPop()) {
                  Navigator.of(modalContext).pop();
                }
              },
              size: effectiveSize,
              height: height,
              showHeader: showHeader,
              title: effectiveTitle,
              description: description,
              subtleText: effectiveSubtle,
              icon: effectiveIcon,
              showCloseButton: showCloseButton,
              onCloseClick: onCloseClick,
              showHeaderDivider: showHeaderDivider,
              content: content,
              scrollable: scrollable,
              showBottomDivider: showBottomDivider,
              showDividers: showDividers,
              showFooter: showFooter,
              showPrimaryButton: showPrimaryButton,
              showSecondaryButton: showSecondaryButton,
              primaryButtonText: primaryButtonText,
              secondaryButtonText: secondaryButtonText,
              onPrimaryPress: effectivePrimaryClick,
              onSecondaryPress: effectiveSecondaryClick,
              isDestructive: isDestructive,
              footerAlign: effectiveFooterAlign,
              footerContent: footerContent,
              footerType: footerType,
              isDraggable: effectiveDraggable,
              enableDragToExpand: enableDragToExpand,
              snapPoints: snapPoints,
              onSnapChange: onSnapChange,
              showDragHandle: showDragHandle,
              backgroundColor: effectiveBg,
              cornerRadius: cornerRadius,
              contentPadding: contentPadding,
              titleStyle: titleStyle,
              descriptionStyle: descriptionStyle,
              children: children,
            ),
          ),
        );
      },
    );
  }

  @override
  State<Ux4gBottomSheet> createState() => _Ux4gBottomSheetState();
}

class _Ux4gBottomSheetState extends State<Ux4gBottomSheet>
    with SingleTickerProviderStateMixin {
  late Ux4gBottomSheetSize _currentSize;
  late AnimationController _animController;
  late Animation<double> _heightAnim;

  double _currentHeight = 0;
  double _dragStartHeight = 0;
  bool _isDragging = false;

  static const List<Ux4gBottomSheetSize> _allSizes = [
    Ux4gBottomSheetSize.peek,
    Ux4gBottomSheetSize.half,
    Ux4gBottomSheetSize.expanded,
    Ux4gBottomSheetSize.full,
  ];

  @override
  void initState() {
    super.initState();
    _currentSize = widget.size;
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    _heightAnim = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    )..addListener(() {
        setState(() {
          _currentHeight = _heightAnim.value;
        });
      });
  }

  @override
  void didUpdateWidget(covariant Ux4gBottomSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.size != oldWidget.size && widget.height == null) {
      _currentSize = widget.size;
      _animateToSize(_currentSize);
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  List<Ux4gBottomSheetSize> _getActiveSnapPoints() {
    if (widget.snapPoints != null && widget.snapPoints!.isNotEmpty) {
      return widget.snapPoints!;
    }
    if (widget.enableDragToExpand && widget.height == null) {
      return _allSizes;
    }
    return [_currentSize];
  }

  double _getMinSafeHeight(double screenH) {
    double minH = 0;
    if (widget.showDragHandle) minH += 22;
    if (widget.showHeader &&
        (widget.title != null ||
            widget.description != null ||
            widget.subtleText != null ||
            widget.icon != null ||
            widget.showCloseButton)) {
      minH += 60;
    }
    bool effectiveFooter = widget.showFooter;
    if (widget.footerType == Ux4gCardFooterType.none) {
      effectiveFooter = false;
    }
    if (effectiveFooter &&
        (widget.footerContent != null ||
            widget.showPrimaryButton ||
            widget.showSecondaryButton)) {
      minH += 72;
    }
    minH += 50; // buffer for content and insets
    return math.max(140.0, math.min(minH, screenH * 0.45));
  }

  double _getHeightForSize(Ux4gBottomSheetSize s, double screenH) {
    final minSafe = _getMinSafeHeight(screenH);
    final natural = (screenH * s.ratio).roundToDouble();
    return math.max(minSafe, math.min(natural, screenH * 0.95));
  }

  void _animateToHeight(double targetH, {VoidCallback? onDone}) {
    _heightAnim = Tween<double>(
      begin: _currentHeight,
      end: targetH,
    ).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );
    _animController.forward(from: 0).then((_) {
      onDone?.call();
    });
  }

  void _animateToSize(Ux4gBottomSheetSize s) {
    final screenH = MediaQuery.of(context).size.height;
    final targetH = _getHeightForSize(s, screenH);
    _animateToHeight(targetH);
  }

  void _handleDragStart(DragStartDetails details) {
    if (!widget.isDraggable) return;
    _isDragging = true;
    _animController.stop();
    _dragStartHeight = _currentHeight;
  }

  void _handleDragUpdate(DragUpdateDetails details, double screenH) {
    if (!widget.isDraggable || !_isDragging) return;

    final activeSnaps = _getActiveSnapPoints();
    final maxH = widget.height ?? _getHeightForSize(activeSnaps.last, screenH);

    // Dragging UP (delta.dy < 0) increases height; dragging DOWN (delta.dy > 0) decreases height
    double newH = _currentHeight - details.delta.dy;

    // Apply rubber-band resistance when dragged above max sheet height
    if (newH > maxH) {
      newH = maxH + (newH - maxH) * 0.25;
    }

    setState(() {
      _currentHeight = newH.clamp(0.0, screenH);
    });
  }

  void _handleDragEnd(DragEndDetails details, double screenH) {
    if (!widget.isDraggable || !_isDragging) return;
    _isDragging = false;

    final activeSnaps = _getActiveSnapPoints();
    final minH = _getHeightForSize(activeSnaps.first, screenH);
    final vy = details.velocity.pixelsPerSecond.dy; // > 0 is downward, < 0 is upward

    // Check if dragged down sufficiently to dismiss
    final isAtOrBelowLowest = _currentHeight < minH * 0.72;
    final isFastDown = vy > 500 && (_dragStartHeight - _currentHeight) > 25;

    if (isAtOrBelowLowest || (isFastDown && _currentHeight <= minH + 20)) {
      widget.onDismiss();
      return;
    }

    // Fast upward flick: jump to next higher snap point
    if (vy < -350) {
      final higher = activeSnaps.where((s) => _getHeightForSize(s, screenH) > _currentHeight + 10).toList();
      if (higher.isNotEmpty) {
        final nextSize = higher.first;
        _currentSize = nextSize;
        widget.onSnapChange?.call(nextSize);
        _animateToHeight(_getHeightForSize(nextSize, screenH));
        return;
      }
    }

    // Fast downward flick: jump to next lower snap point
    if (vy > 350) {
      final lower = activeSnaps.reversed.where((s) => _getHeightForSize(s, screenH) < _currentHeight - 10).toList();
      if (lower.isNotEmpty) {
        final nextSize = lower.first;
        _currentSize = nextSize;
        widget.onSnapChange?.call(nextSize);
        _animateToHeight(_getHeightForSize(nextSize, screenH));
        return;
      }
    }

    // Snap to closest preset
    Ux4gBottomSheetSize closestSize = activeSnaps.first;
    double minDiff = double.infinity;

    for (final s in activeSnaps) {
      final h = _getHeightForSize(s, screenH);
      final diff = (_currentHeight - h).abs();
      if (diff < minDiff) {
        minDiff = diff;
        closestSize = s;
      }
    }

    _currentSize = closestSize;
    widget.onSnapChange?.call(closestSize);
    _animateToHeight(_getHeightForSize(closestSize, screenH));
  }

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();
    final isDark = materialTheme.brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final screenH = mediaQuery.size.height;
    final viewInsetsBottom = mediaQuery.viewInsets.bottom;
    final safeBottom = mediaQuery.padding.bottom;

    final minSafeH = _getMinSafeHeight(screenH);

    // Initialize height on first frame
    if (_currentHeight == 0) {
      _currentHeight = widget.height ?? _getHeightForSize(_currentSize, screenH);
    }

    final surfaceColor = widget.backgroundColor ??
        (ux4gColors?.surface ?? (isDark ? const Color(0xFF1E293B) : Ux4gColors.white));
    final gripColor = isDark ? Ux4gColors.neutral600 : Ux4gColors.neutral300;
    final mutedColor = isDark ? Ux4gColors.neutral400 : Ux4gColors.neutral600;
    final dividerColor = isDark ? Ux4gColors.neutral800 : Ux4gColors.neutral200;
    final onSurface = ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface;

    // Resolve header visibility
    final hasHeader = widget.showHeader &&
        (widget.title != null ||
            widget.description != null ||
            widget.subtleText != null ||
            widget.icon != null ||
            widget.showCloseButton);

    // Resolve footer settings
    bool effectiveShowFooter = widget.showFooter;
    bool effectiveShowPrimary = widget.showPrimaryButton;
    bool effectiveShowSecondary = widget.showSecondaryButton;

    if (widget.footerType != null) {
      switch (widget.footerType!) {
        case Ux4gCardFooterType.none:
          effectiveShowFooter = false;
          break;
        case Ux4gCardFooterType.primaryOnly:
          effectiveShowFooter = true;
          effectiveShowPrimary = true;
          effectiveShowSecondary = false;
          break;
        case Ux4gCardFooterType.secondaryOnly:
          effectiveShowFooter = true;
          effectiveShowPrimary = false;
          effectiveShowSecondary = true;
          break;
        case Ux4gCardFooterType.primaryAndSecondary:
          effectiveShowFooter = true;
          effectiveShowPrimary = true;
          effectiveShowSecondary = true;
          break;
      }
    }

    final hasFooter = effectiveShowFooter &&
        (widget.footerContent != null || effectiveShowPrimary || effectiveShowSecondary);

    final showTopDivider = widget.showDividers ?? widget.showHeaderDivider;
    final showBotDivider = widget.showDividers ?? widget.showBottomDivider;

    // Smooth drag down translation without squishing content into negative bounds
    final effectiveHeight = math.max(_currentHeight, minSafeH);
    final downOffset = _currentHeight < minSafeH ? (minSafeH - _currentHeight) : 0.0;
    final totalBottomPadding = math.max(widget.bottomInset, safeBottom) + viewInsetsBottom;

    return Semantics(
      namesRoute: true,
      scopesRoute: true,
      explicitChildNodes: true,
      label: widget.semanticLabel ?? widget.title ?? 'Bottom sheet',
      child: Transform.translate(
        offset: Offset(0, downOffset),
        child: Material(
        color: Colors.transparent,
        child: Container(
          height: effectiveHeight + totalBottomPadding,
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(widget.cornerRadius),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.15),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            bottom: widget.bottomInset == 0 && viewInsetsBottom == 0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                /* ── Top Draggable Region (Drag Handle + Header) ── */
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onVerticalDragStart: _handleDragStart,
                  onVerticalDragUpdate: (d) => _handleDragUpdate(d, screenH),
                  onVerticalDragEnd: (d) => _handleDragEnd(d, screenH),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Drag Handle Indicator Pill
                      if (widget.showDragHandle)
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 6),
                          child: Center(
                            child: Container(
                              width: 32,
                              height: 4,
                              decoration: BoxDecoration(
                                color: gripColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),

                      // Header Block
                      if (hasHeader)
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: widget.showDragHandle ? 4 : 16,
                            bottom: 12,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Leading Icon
                              if (widget.icon != null) ...[
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: const EdgeInsets.only(right: 10, top: 2),
                                  alignment: Alignment.center,
                                  child: widget.icon is Widget
                                      ? widget.icon as Widget
                                      : Icon(
                                          widget.icon as IconData,
                                          size: 22,
                                          color: onSurface,
                                        ),
                                ),
                              ],

                              // Titles Block (Expanded with minWidth 0 to prevent overflow)
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.title ?? 'Header',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: (widget.titleStyle ??
                                              ux4gTypography?.hS_strong ??
                                              const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                height: 1.33,
                                              ))
                                          .copyWith(color: onSurface),
                                    ),
                                    if (widget.description != null) ...[
                                      const SizedBox(height: 2),
                                      Text(
                                        widget.description!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: (widget.descriptionStyle ??
                                                ux4gTypography?.bS_default ??
                                                const TextStyle(
                                                  fontSize: 13,
                                                  height: 1.38,
                                                ))
                                            .copyWith(color: mutedColor),
                                      ),
                                    ],
                                  ],
                                ),
                              ),

                              // Subtle Tag / Text
                              if (widget.subtleText != null) ...[
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    widget.subtleText!,
                                    style: (ux4gTypography?.lM_default ??
                                            const TextStyle(fontSize: 12))
                                        .copyWith(color: mutedColor),
                                  ),
                                ),
                              ],

                              // Close Button
                              if (widget.showCloseButton)
                                Tooltip(
                                  message: 'Close',
                                  child: Semantics(
                                    button: true,
                                    label: 'Close bottom sheet',
                                    child: InkWell(
                                      onTap: widget.onCloseClick ?? widget.onDismiss,
                                      borderRadius: BorderRadius.circular(14),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: onSurface,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                      // Header Divider
                      if (showTopDivider)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Ux4gDivider(color: dividerColor),
                        ),
                    ],
                  ),
                ),

                /* ── Body Content (Expands dynamically between Header and Fixed Footer) ── */
                Expanded(
                  child: SingleChildScrollView(
                    padding: widget.contentPadding ??
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    physics: const ClampingScrollPhysics(),
                    child: _buildContentWidget(),
                  ),
                ),

                /* ── Bottom Content Divider ── */
                if (showBotDivider)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Ux4gDivider(color: dividerColor),
                  ),

                /* ── Fixed Footer Actions (Anchored at the bottom at all times) ── */
                if (hasFooter)
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.08)
                              : Colors.black.withValues(alpha: 0.06),
                          width: 1,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: widget.footerContent ??
                        _buildFooterButtons(
                          context,
                          align: widget.footerAlign,
                          showPrimary: effectiveShowPrimary,
                          showSecondary: effectiveShowSecondary,
                          primaryText: widget.primaryButtonText,
                          secondaryText: widget.secondaryButtonText,
                          onPrimary: widget.onPrimaryPress ?? widget.onDismiss,
                          onSecondary: widget.onSecondaryPress ?? widget.onDismiss,
                          isDestructive: widget.isDestructive,
                        ),
                  ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildContentWidget() {
    if (widget.content != null) return widget.content!;
    if (widget.children != null && widget.children!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: widget.children!,
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildFooterButtons(
    BuildContext context, {
    required Ux4gBottomSheetFooterAlign align,
    required bool showPrimary,
    required bool showSecondary,
    required String primaryText,
    required String secondaryText,
    required VoidCallback onPrimary,
    required VoidCallback onSecondary,
    required bool isDestructive,
  }) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final errorColor = ux4gColors?.error ?? Ux4gColors.red500;

    final primaryBtn = Ux4gButton(
      variant: Ux4gButtonVariant.primary,
      text: primaryText,
      height: 44,
      backgroundColor: isDestructive ? errorColor : null,
      onPressed: onPrimary,
    );

    final secondaryBtn = Ux4gButton(
      variant: Ux4gButtonVariant.outline,
      text: secondaryText,
      height: 44,
      onPressed: onSecondary,
    );

    // Split / Justified layout: Two buttons expand 50/50 side-by-side
    final isSplit = align == Ux4gBottomSheetFooterAlign.split ||
        align == Ux4gBottomSheetFooterAlign.justified;

    if (isSplit) {
      return Row(
        children: [
          if (showPrimary && showSecondary) ...[
            Expanded(child: primaryBtn),
            const SizedBox(width: 12),
            Expanded(child: secondaryBtn),
          ] else if (showPrimary) ...[
            Expanded(child: primaryBtn),
          ] else if (showSecondary) ...[
            Expanded(child: secondaryBtn),
          ],
        ],
      );
    }

    MainAxisAlignment mainAxis = MainAxisAlignment.start;
    if (align == Ux4gBottomSheetFooterAlign.center ||
        align == Ux4gBottomSheetFooterAlign.centered) {
      mainAxis = MainAxisAlignment.center;
    } else if (align == Ux4gBottomSheetFooterAlign.right) {
      mainAxis = MainAxisAlignment.end;
    }

    return Row(
      mainAxisAlignment: mainAxis,
      children: [
        if (showSecondary) ...[
          Flexible(child: secondaryBtn),
          if (showPrimary) const SizedBox(width: 12),
        ],
        if (showPrimary) ...[
          Flexible(child: primaryBtn),
        ],
      ],
    );
  }
}

/// Backward compatibility class for legacy code referencing Ux4gBottomSheetLayout directly.
class Ux4gBottomSheetLayout extends StatelessWidget {
  final String? headerTitle;
  final String? headerSubtleText;
  final dynamic headerIcon;
  final bool showCloseButton;
  final String? description;
  final bool showDividers;
  final Ux4gCardFooterType footerType;
  final Ux4gBottomSheetFooterAlignment footerAlignment;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback onPrimaryClick;
  final VoidCallback onSecondaryClick;
  final VoidCallback onCloseClick;
  final bool isDraggable;
  final Widget content;

  const Ux4gBottomSheetLayout({
    super.key,
    this.headerTitle,
    this.headerSubtleText,
    this.headerIcon,
    this.showCloseButton = true,
    this.description,
    this.showDividers = true,
    this.footerType = Ux4gCardFooterType.none,
    this.footerAlignment = Ux4gBottomSheetFooterAlignment.left,
    this.primaryButtonText = 'Confirm',
    this.secondaryButtonText = 'Cancel',
    required this.onPrimaryClick,
    required this.onSecondaryClick,
    required this.onCloseClick,
    required this.isDraggable,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Ux4gBottomSheet(
      onDismiss: onCloseClick,
      title: headerTitle,
      subtleText: headerSubtleText,
      icon: headerIcon,
      showCloseButton: showCloseButton,
      description: description,
      showDividers: showDividers,
      footerType: footerType,
      footerAlign: footerAlignment,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      onPrimaryPress: onPrimaryClick,
      onSecondaryPress: onSecondaryClick,
      onCloseClick: onCloseClick,
      isDraggable: isDraggable,
      content: content,
    );
  }
}
