import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../foundation/colors.dart';
import '../foundation/typography.dart';
import '../foundation/dimensions.dart';
import 'loader.dart';

enum Ux4gSearchFilterType { contains, startsWith, startsWithPerTerm }

enum Ux4gSearchFieldVariant { basicSearch, searchWithSubmit, autocomplete }

enum Ux4gSearchFieldSize {
  small(32),
  medium(40),
  large(48),
  xl(56);

  final double height;
  const Ux4gSearchFieldSize(this.height);
}

enum Ux4gSearchFieldStatus { defaultStatus, error, warning, success }

enum Ux4gSearchFieldButtonStyle { filled, tonal }

class Ux4gSearchField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onValueChange;
  final Ux4gSearchFilterType filterType;
  final Ux4gSearchFieldVariant variant;
  final Ux4gSearchFieldSize size;
  final Ux4gSearchFieldStatus status;
  final Ux4gSearchFieldButtonStyle buttonStyle;
  final String? label;
  final String? placeholder;
  final String? caption;
  final List<String> options;
  final bool showVoiceIcon;
  final bool showClearIcon;
  final bool isLoading;
  final VoidCallback? onVoiceClick;
  final VoidCallback? onClearClick;
  final ValueChanged<String>? onSubmitClick;
  final ValueChanged<String>? onOptionSelected;
  final bool enabled;
  final bool readOnly;
  final TextStyle? placeholderStyle;
  final double dropdownMinHeight;
  final double dropdownMaxHeight;

  /// Accessibility semantic label for screen readers.
  final String? semanticLabel;

  const Ux4gSearchField({
    super.key,
    required this.value,
    required this.onValueChange,
    this.filterType = Ux4gSearchFilterType.contains,
    this.variant = Ux4gSearchFieldVariant.basicSearch,
    this.size = Ux4gSearchFieldSize.medium,
    this.status = Ux4gSearchFieldStatus.defaultStatus,
    this.buttonStyle = Ux4gSearchFieldButtonStyle.filled,
    this.label,
    this.placeholder,
    this.caption,
    this.options = const [],
    this.showVoiceIcon = true,
    this.showClearIcon = true,
    this.isLoading = false,
    this.onVoiceClick,
    this.onClearClick,
    this.onSubmitClick,
    this.onOptionSelected,
    this.enabled = true,
    this.readOnly = false,
    this.placeholderStyle,
    this.dropdownMinHeight = 0.0,
    this.dropdownMaxHeight = 350.0,
    this.semanticLabel,
  });

  @override
  State<Ux4gSearchField> createState() => _Ux4gSearchFieldState();
}

class _Ux4gSearchFieldState extends State<Ux4gSearchField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  late TextEditingController _controller;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  final GlobalKey _fieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode.addListener(() {
      if (!mounted) return;
      setState(() => _isFocused = _focusNode.hasFocus);
      _updateOverlayState();
    });
  }

  void _updateOverlayState() {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final shouldShow =
          _isFocused &&
          widget.value.trim().isNotEmpty &&
          (widget.options.isNotEmpty ||
              widget.variant == Ux4gSearchFieldVariant.autocomplete);
      if (shouldShow) {
        if (_overlayEntry == null) {
          _showAutocomplete();
        } else {
          _overlayEntry?.markNeedsBuild();
        }
      } else {
        _hideAutocomplete();
      }
    });
  }

  @override
  void didUpdateWidget(Ux4gSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
    _updateOverlayState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _hideAutocomplete();
    super.dispose();
  }

  void _showAutocomplete() {
    if (_overlayEntry == null && mounted) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void _hideAutocomplete() {
    if (_overlayEntry != null) {
      final entry = _overlayEntry;
      _overlayEntry = null;
      if (SchedulerBinding.instance.schedulerPhase ==
          SchedulerPhase.persistentCallbacks) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          entry?.remove();
        });
      } else {
        entry?.remove();
      }
    }
  }

  OverlayEntry _createOverlayEntry() {
    final appTheme = Theme.of(context);
    return OverlayEntry(
      builder: (overlayContext) {
        final renderBox =
            _fieldKey.currentContext?.findRenderObject() as RenderBox?;
        final width = renderBox?.size.width ?? 0;

        // Show dropdown only when focused, has typed text, and has options or variant is autocomplete
        final isVisible =
            _isFocused &&
            widget.value.trim().isNotEmpty &&
            (widget.options.isNotEmpty ||
                widget.variant == Ux4gSearchFieldVariant.autocomplete);

        if (!isVisible) return const SizedBox.shrink();

        return Theme(
          data: appTheme,
          child: Builder(
            builder: (context) {
              final materialTheme = Theme.of(context);
              final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
              final surface =
                  ux4gColors?.surface ?? materialTheme.colorScheme.surface;

              return Positioned(
                width: width,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0, widget.size.height + 4),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(Ux4gRadius.radius8),
                    clipBehavior: Clip.antiAlias,
                    color: surface,
                    child: _buildAutocompleteList(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAutocompleteList() {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();

    final isDark = materialTheme.brightness == Brightness.dark;
    final onSurface = ux4gColors?.onSurface ?? Ux4gColors.neutral900;
    final bmDefault =
        ux4gTypography?.bM_default ??
        materialTheme.textTheme.bodyMedium ??
        const TextStyle(fontSize: 16);

    return Container(
      constraints: BoxConstraints(
        minHeight: widget.dropdownMinHeight,
        maxHeight: widget.dropdownMaxHeight,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Ux4gSpinner(size: 24),
              ),
            )
          else if (widget.options.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Text(
                "No results found",
                style: bmDefault.copyWith(
                  fontSize: 14,
                  color: onSurface.withValues(alpha: 0.5),
                ),
              ),
            )
          else
            Flexible(
              child: Builder(
                builder: (context) {
                  final query = widget.value.toLowerCase().trim();
                  // Check if value matches any option exactly (means user selected it)
                  final isExactSelection = widget.options.any((opt) {
                    return opt.toLowerCase().trim() == query;
                  });
                  // If exact selection, show all options; otherwise filter by filterType
                  final filteredOptions = isExactSelection || query.isEmpty
                      ? widget.options
                      : widget.options.where((option) {
                          final lowerOpt = option.toLowerCase();
                          return switch (widget.filterType) {
                            Ux4gSearchFilterType.contains => lowerOpt.contains(
                              query,
                            ),
                            Ux4gSearchFilterType.startsWith =>
                              lowerOpt.startsWith(query),
                            Ux4gSearchFilterType.startsWithPerTerm => () {
                              final queryTerms = query
                                  .split(' ')
                                  .where((t) => t.isNotEmpty);
                              final labelTerms = lowerOpt
                                  .split(' ')
                                  .where((t) => t.isNotEmpty);
                              return queryTerms.every(
                                (qTerm) => labelTerms.any(
                                  (lTerm) => lTerm.startsWith(qTerm),
                                ),
                              );
                            }(),
                          };
                        }).toList();

                  if (filteredOptions.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Text(
                        "No results found",
                        style: bmDefault.copyWith(
                          fontSize: 14,
                          color: onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    );
                  }

                  final queryText = widget.value.trim();

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (queryText.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 12,
                            bottom: 8,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: bmDefault.copyWith(
                                fontSize: 13,
                                color: onSurface.withValues(alpha: 0.6),
                              ),
                              children: [
                                const TextSpan(text: "Searching for "),
                                TextSpan(
                                  text: "'$queryText'",
                                  style: bmDefault.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 6),
                          itemCount: filteredOptions.length,
                          itemBuilder: (context, index) {
                            final option = filteredOptions[index];
                            final isSelected = widget.value == option;

                            return InkWell(
                              onTap: () {
                                widget.onOptionSelected?.call(option);
                                widget.onValueChange(option);
                                _focusNode.unfocus();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                color: isSelected
                                    ? (isDark
                                          ? Ux4gColors.primary950
                                          : Ux4gColors.primary50)
                                    : null,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        option,
                                        style: bmDefault.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: isSelected
                                              ? (isDark
                                                    ? Ux4gColors.primary300
                                                    : Ux4gColors.primary600)
                                              : onSurface,
                                        ),
                                      ),
                                    ),
                                    if (isSelected)
                                      Icon(
                                        Icons.check,
                                        color: isDark
                                            ? Ux4gColors.primary300
                                            : Ux4gColors.primary600,
                                        size: 18,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final ux4gColors = materialTheme.extension<Ux4gThemeColors>();
    final ux4gTypography = materialTheme.extension<Ux4gTypography>();

    final surface = ux4gColors?.surface ?? materialTheme.colorScheme.surface;
    final onSurface =
        ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface;
    final primary = ux4gColors?.primary ?? materialTheme.colorScheme.primary;
    final onPrimary =
        ux4gColors?.onPrimary ?? materialTheme.colorScheme.onPrimary;

    final bmDefault =
        ux4gTypography?.bM_default ??
        materialTheme.textTheme.bodyMedium ??
        const TextStyle(fontSize: 16);
    final bmStrong =
        ux4gTypography?.bM_strong ??
        materialTheme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ) ??
        const TextStyle(fontWeight: FontWeight.w700, fontSize: 16);
    final bxsDefault =
        ux4gTypography?.bXS_default ??
        materialTheme.textTheme.bodySmall ??
        const TextStyle(fontSize: 12);

    final isSubmitVariant =
        widget.variant == Ux4gSearchFieldVariant.searchWithSubmit;
    final showSubmitButton =
        isSubmitVariant ||
        (widget.variant == Ux4gSearchFieldVariant.autocomplete &&
            widget.onSubmitClick != null);
    final inputShape = showSubmitButton
        ? const BorderRadius.only(
            topLeft: Radius.circular(Ux4gRadius.radius8),
            bottomLeft: Radius.circular(Ux4gRadius.radius8),
          )
        : BorderRadius.circular(Ux4gRadius.radius8);

    final borderColor = _getBorderColor(materialTheme, ux4gColors);

    return Semantics(
      textField: true,
      enabled: widget.enabled,
      label: widget.semanticLabel ?? widget.label ?? widget.placeholder ?? 'Search',
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: bmStrong.copyWith(
              color: _getLabelColor(materialTheme, ux4gColors),
            ),
          ),
          const SizedBox(height: 8),
        ],
        Row(
          children: [
            Expanded(
              child: CompositedTransformTarget(
                key: _fieldKey,
                link: _layerLink,
                child: Container(
                  height: widget.size.height,
                  decoration: BoxDecoration(
                    color: widget.enabled
                        ? surface
                        : onSurface.withValues(alpha: 0.05),
                    borderRadius: inputShape,
                    border: Border.all(
                      color: borderColor,
                      width: _isFocused ? 2 : 1,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 20,
                        color: onSurface.withValues(alpha: 0.5),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          onChanged: widget.onValueChange,
                          onSubmitted: widget.onSubmitClick,
                          enabled: widget.enabled,
                          readOnly: widget.readOnly,
                          style: bmDefault.copyWith(
                            color: widget.enabled
                                ? onSurface
                                : onSurface.withValues(alpha: 0.4),
                          ),
                          decoration: InputDecoration(
                            hintText: widget.placeholder,
                            hintStyle: (widget.placeholderStyle ?? bmDefault)
                                .copyWith(
                                  color:
                                      widget.placeholderStyle?.color ??
                                      onSurface.withValues(alpha: 0.4),
                                  fontWeight:
                                      widget.placeholderStyle?.fontWeight ??
                                      FontWeight.w400,
                                ),
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      if (widget.isLoading &&
                          widget.variant !=
                              Ux4gSearchFieldVariant.autocomplete) ...[
                        const SizedBox(width: 8),
                        const Ux4gSpinner(size: 16),
                      ],
                      if (widget.showVoiceIcon) ...[
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: widget.onVoiceClick,
                          child: Icon(
                            Icons.mic,
                            size: 20,
                            color: onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                      if (widget.showClearIcon && widget.value.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        InkWell(
                          onTap:
                              widget.onClearClick ??
                              () => widget.onValueChange(""),
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: onSurface.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            if (showSubmitButton)
              Container(
                height: widget.size.height,
                width: widget.size.height,
                decoration: BoxDecoration(
                  color: widget.buttonStyle == Ux4gSearchFieldButtonStyle.filled
                      ? primary
                      : primary.withValues(alpha: 0.1),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(Ux4gRadius.radius8),
                    bottomRight: Radius.circular(Ux4gRadius.radius8),
                  ),
                ),
                child: InkWell(
                  onTap: () => widget.onSubmitClick?.call(widget.value),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color:
                          widget.buttonStyle ==
                              Ux4gSearchFieldButtonStyle.filled
                          ? onPrimary
                          : primary,
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (widget.caption != null && widget.caption!.trim().isNotEmpty) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                _getStatusIcon() ?? Icons.info_outline,
                size: 14,
                color: _getCaptionColor(materialTheme, ux4gColors),
              ),
              const SizedBox(width: 6),
              Text(
                widget.caption ?? "",
                style: bxsDefault.copyWith(
                  color: _getCaptionColor(materialTheme, ux4gColors),
                ),
              ),
            ],
          ),
        ],
      ],
    ),
  );
}

  Color _getBorderColor(ThemeData materialTheme, Ux4gThemeColors? ux4gColors) {
    final onSurface =
        ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface;
    final primary = ux4gColors?.primary ?? materialTheme.colorScheme.primary;
    final error = ux4gColors?.error ?? materialTheme.colorScheme.error;
    final warning = ux4gColors?.warning ?? Colors.orange;
    final success = ux4gColors?.success ?? Colors.green;

    if (!widget.enabled) return onSurface.withValues(alpha: 0.3);
    if (_isFocused &&
        (widget.options.isNotEmpty ||
            widget.variant == Ux4gSearchFieldVariant.autocomplete)) {
      return primary;
    }
    return switch (widget.status) {
      Ux4gSearchFieldStatus.error => error,
      Ux4gSearchFieldStatus.warning => warning,
      Ux4gSearchFieldStatus.success => success,
      Ux4gSearchFieldStatus.defaultStatus =>
        _isFocused ? primary : onSurface.withValues(alpha: 0.3),
    };
  }

  Color _getLabelColor(ThemeData materialTheme, Ux4gThemeColors? ux4gColors) {
    final onSurface =
        ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface;
    final primary = ux4gColors?.primary ?? materialTheme.colorScheme.primary;
    final onBackground =
        ux4gColors?.onBackground ?? materialTheme.colorScheme.onSurface;
    final error = ux4gColors?.error ?? materialTheme.colorScheme.error;
    final warning = ux4gColors?.warning ?? Colors.orange;
    final success = ux4gColors?.success ?? Colors.green;

    if (!widget.enabled) return onSurface.withValues(alpha: 0.4);
    return switch (widget.status) {
      Ux4gSearchFieldStatus.error => error,
      Ux4gSearchFieldStatus.warning => warning,
      Ux4gSearchFieldStatus.success => success,
      Ux4gSearchFieldStatus.defaultStatus =>
        _isFocused ? primary : onBackground,
    };
  }

  Color _getCaptionColor(ThemeData materialTheme, Ux4gThemeColors? ux4gColors) {
    final onSurface =
        ux4gColors?.onSurface ?? materialTheme.colorScheme.onSurface;
    final error = ux4gColors?.error ?? materialTheme.colorScheme.error;
    final warning = ux4gColors?.warning ?? Colors.orange;
    final success = ux4gColors?.success ?? Colors.green;

    if (!widget.enabled) return onSurface.withValues(alpha: 0.4);
    return switch (widget.status) {
      Ux4gSearchFieldStatus.error => error,
      Ux4gSearchFieldStatus.warning => warning,
      Ux4gSearchFieldStatus.success => success,
      Ux4gSearchFieldStatus.defaultStatus => onSurface.withValues(alpha: 0.6),
    };
  }

  IconData? _getStatusIcon() {
    return switch (widget.status) {
      Ux4gSearchFieldStatus.error => Icons.error,
      Ux4gSearchFieldStatus.warning => Icons.warning,
      Ux4gSearchFieldStatus.success => Icons.check_circle,
      Ux4gSearchFieldStatus.defaultStatus => null,
    };
  }
}
